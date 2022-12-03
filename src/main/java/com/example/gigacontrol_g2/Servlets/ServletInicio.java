package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.daos.DaoDatosFijos;
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
            switch (action) {
                case "LogIn":
                    BUsuarios user = (BUsuarios) request.getSession().getAttribute("userlogged");

                    if (user != null && user.getIdUsuario() != 0) {
                        if (user.getRolId() == 1) {
                            /*int codigoAutenticacion = envioCorreo.generarCodigoDeAutenticacion();
                            String correoDestino = user.getCorreo();
                            envioCorreo.enviarCodigoDeAutenticacion(codigoAutenticacion,correoDestino);
                            response.sendRedirect(request.getContextPath() + "/ServletInicio?action=autenticarSeguridad");*/
                            response.sendRedirect(request.getContextPath() + "/ServletSeguridad");
                        } else if (user.getRolId() == 2) {
                            response.sendRedirect(request.getContextPath() + "/ServletUsuario");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/ServletAdmin");
                        }
                        //response.sendRedirect(request.getContextPath());
                    } else {
                        view = request.getRequestDispatcher("inicioDeSesion.jsp");
                        view.forward(request, response);
                    }
                    break;

                case "autenticarSeguridad":
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
            }
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        String action = request.getParameter("action");
        //String action = request.getParameter("action") == null ? "mostarIndex" : request.getParameter("action");
        String codigo = request.getParameter("codigo");
        String contrasena  = request.getParameter("contrasena");
        EnvioCorreo envioCorreo = new EnvioCorreo();

        BUsuarios usuariolog = daoDatosFijos.validUserPassword(codigo,contrasena);
        if(usuariolog !=null){
            HttpSession session = request.getSession();
            session.setAttribute("userlogged",usuariolog);
            if (usuariolog.getRolId()==3){
                response.sendRedirect("ServletAdmin?action=Inicio");
            }else if (usuariolog.getRolId()==1){
                //Avance de Doble Autenticacion Seguridad
                /*int codigoAutenticacion = envioCorreo.generarCodigoDeAutenticacion();
                String correoDestino = usuariolog.getCorreo();
                envioCorreo.enviarCodigoDeAutenticacion(codigoAutenticacion,correoDestino);
                response.sendRedirect(request.getContextPath() + "/ServletInicio?action=autenticarSeguridad");*/
                response.sendRedirect(request.getContextPath() + "/ServletSeguridad?action=listarIncidencia");
            }
            else {
                response.sendRedirect("InicioUsuario");
            }
        }else{
            response.sendRedirect(request.getContextPath() + "ServletInicio?action=LogIn&error");
        }
    }
}
