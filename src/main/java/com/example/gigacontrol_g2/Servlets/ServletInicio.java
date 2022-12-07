package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.daos.DaoDatosFijos;
import com.example.gigacontrol_g2.daos.UsersDao;
import com.example.gigacontrol_g2.mailcorreo.EnvioCorreo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletInicio", urlPatterns = {"","/ServletInicio"})
public class ServletInicio extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        //String action = request.getParameter("action") == null ? "mostarIndex" : request.getParameter("action");
        RequestDispatcher view;
        EnvioCorreo envioCorreo = new EnvioCorreo();
        if (action == null) {
            view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        } else {
            BUsuarios user = (BUsuarios) request.getSession().getAttribute("userlogged");
            switch (action) {
                case "LogIn":
                    if (user != null && user.getIdUsuario() != 0) {
                        if (user.getRolId() == 2) {
                            response.sendRedirect(request.getContextPath() + "/ServletUsuario");
                        } else if (user.getRolId() == 3) {
                            response.sendRedirect(request.getContextPath() + "/ServletAdmin");
                        }
                        //response.sendRedirect(request.getContextPath());
                    } else {
                        view = request.getRequestDispatcher("inicioDeSesion.jsp");
                        view.forward(request, response);
                    }
                    break;

                case "autenticarSeguridad":
                    int codigoAutenticacion = envioCorreo.generarCodigoDeAutenticacion();
                    String correoDestino = user.getCorreo();
                    envioCorreo.enviarCodigoDeAutenticacion(codigoAutenticacion, correoDestino);
                    String codigoAutenticacionStr = Integer.toString(codigoAutenticacion);
                    request.setAttribute("Codigo", codigoAutenticacionStr);
                    view = request.getRequestDispatcher("AutenticacionSeguridad.jsp");
                    view.forward(request, response);
                    break;

                case "logout":
                    HttpSession session = request.getSession();
                    session.invalidate();
                    response.sendRedirect(request.getContextPath() + "/ServletInicio");
                    break;
                case "registro":
                    view = request.getRequestDispatcher("registro.jsp");
                    view.forward(request, response);
                    break;
                case "Registrousuario":
                    view = request.getRequestDispatcher("RegistroUsuario.jsp");
                    view.forward(request, response);
                    break;
                case "Registroseguridad":
                    view = request.getRequestDispatcher("RegistroSeguridad.jsp");
                    view.forward(request, response);
                    break;

                case "OlvidoContrasena":
                    view = request.getRequestDispatcher("OlvidasteTuContrasena.jsp");
                    view.forward(request, response);
                    break;
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        //String action = request.getParameter("action");
        String action = request.getParameter("action") == null ? "IniciarSesion" : request.getParameter("action");
        String codigo = request.getParameter("codigo");
        String contrasena = request.getParameter("contrasena");
        RequestDispatcher view;
        HttpSession session = request.getSession();
        UsersDao usersDao = new UsersDao();
        EnvioCorreo envioCorreo = new EnvioCorreo();

        switch (action) {
            case "IniciarSesion":
                BUsuarios usuariolog = daoDatosFijos.validUserPassword(codigo, contrasena);
                if (usuariolog != null) {
                    session.setAttribute("userlogged", usuariolog);
                    System.out.println("rol: "+ usuariolog.getRolId());
                    if (usuariolog.getRolId() == 3) {
                        response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=Inicio");
                    } else if (usuariolog.getRolId() == 1) {
                        //Avance de Doble Autenticacion Seguridad
                        response.sendRedirect(request.getContextPath() + "/ServletInicio?action=autenticarSeguridad");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/ServletUsuario");
                    }
                } else {
                    session.setAttribute("error", "Hubo un Error en su Código o Contraseña , Vuelva a Ingresar");
                    view = request.getRequestDispatcher("inicioDeSesion.jsp");
                    view.forward(request, response);
                }
                break;

            case "autenticacionSeguridad":
                String codigoAutenticacionIngresado = request.getParameter("codigoAutenticacionIngresado");
                String codigoAutenticacionOriginal = request.getParameter("codigoAutenticacion");
                //int num_intentos = 3;
                //while (num_intentos>0) {
                if (codigoAutenticacionIngresado.equals(codigoAutenticacionOriginal)) {
                    response.sendRedirect(request.getContextPath() + "/ServletSeguridad");
                } else {
                    session.invalidate();
                    response.sendRedirect("ServletInicio");
                            /*session.setAttribute("error2", "Codigo Incorrecto, Vuelva a Ingresar \n" +
                                    "(Tiene " + num_intentos + " Oportunidades Más)");
                            session.setAttribute("userlogged",usuariolog);

                            num_intentos--;
                        }*/
                    //num_intentos--;
                    }
                break;

            case "registroSeguridad":
                String correoPUCPSeg = request.getParameter("correoPUCPSeg");
                String codigoPUCPSeg = request.getParameter("codigoPUCPSeg");
                for (BUsuarios usuar : usersDao.getUsersList()){
                    if(correoPUCPSeg.equals(usuar.getCorreo()) && codigoPUCPSeg.equals(usuar.getCodigo())){
                        String contrasenaTemporalSeguridad = envioCorreo.generarContrasenaTemporalSeguridad();
                        envioCorreo.enviarContrasenaTemporal(contrasenaTemporalSeguridad, correoPUCPSeg);
                        response.sendRedirect(request.getContextPath()+"/ServletInicio");
                    }
                }
                break;

        }
    }
}



