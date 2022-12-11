package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.daos.DaoDatosFijos;
import com.example.gigacontrol_g2.daos.UsersDao;
import com.example.gigacontrol_g2.mailcorreo.EnvioCorreo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletInicio", urlPatterns = {"","/ServletInicio"})
public class ServletInicio extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        //String action = request.getParameter("action") == null ? "mostarIndex" : request.getParameter("action");
        RequestDispatcher view;
        EnvioCorreo envioCorreo = new EnvioCorreo();


        ArrayList<String> list = new ArrayList<>();
        list.add(null);
        list.add("LogIn");
        list.add("establecerNuevaContraSeguridad");
        list.add("autenticarSeguridad");
        list.add("logout");
        list.add("registro");
        list.add("Registrousuario");
        list.add("Registroseguridad");
        list.add("OlvidoContrasena");

        if(list.contains(action)) {

            if (action == null) {
                view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
            } else {
                BUsuarios user = (BUsuarios) request.getSession().getAttribute("userlogged");
                switch (action) {

                    case "LogIn":

                    if (user != null && user.getIdUsuario() > 0) {
                        if (user.getRolId() == 2) {
                            response.sendRedirect(request.getContextPath() + "/ServletUsuario");
                        } else if (user.getRolId() == 3) {
                            response.sendRedirect(request.getContextPath() + "/ServletAdmin");
                        } else if (user.getRolId()==1){
                            response.sendRedirect(request.getContextPath() + "/ServletSeguridad");
                        }
                    } else {
                        view = request.getRequestDispatcher("inicioDeSesion.jsp");
                        view.forward(request, response);
                        }
                        break;

                    case "establecerNuevaContraSeguridad":
                        view = request.getRequestDispatcher("EstablecerNuevaContraSeguridad.jsp");
                        view.forward(request, response);
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
        }else{
            response.sendRedirect(request.getContextPath() + "/ServletInicio");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        RequestDispatcher view;
        HttpSession session = request.getSession();
        UsersDao usersDao = new UsersDao();
        EnvioCorreo envioCorreo = new EnvioCorreo();
        //////////////////////////////////////////////////////////////


        String action = request.getParameter("action") == null ? "IniciarSesion" : request.getParameter("action");
        //int num_intentos = 3;



        switch (action) {
            case "IniciarSesion":
                String codigo = request.getParameter("codigo");
                String contrasena = request.getParameter("contrasena");

                if (codigo == null || contrasena == null) {
                    request.setAttribute("error", "El usuario o password no pueden ser vacíos");
                    view = request.getRequestDispatcher("login/loginForm.jsp");
                    view.forward(request, response);
                }else {
                    BUsuarios usuariolog = daoDatosFijos.validUserPassword(codigo, contrasena);
                    if (usuariolog != null) {
                        session.setAttribute("userlogged", usuariolog);
                        System.out.println("rol: "+ usuariolog.getRolId());
                        //Para primer inicio de sesion y cambio de contraseña ( seguridad y usuario pucp).
                        if(usuariolog.getEstado() == 4){
                            response.sendRedirect(request.getContextPath() + "/ServletInicio?action=establecerNuevaContraSeguridad");
                        } else if (usuariolog.getRolId() == 3 && usuariolog.getEstado() == 1) {
                            response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=Inicio");
                            //Avance de Doble Ausdsatenticacion Seguridad
                        } else if (usuariolog.getRolId() == 1 && usuariolog.getEstado() == 1){
                            response.sendRedirect(request.getContextPath() + "/ServletInicio?action=autenticarSeguridad");
                        }else if (usuariolog.getRolId() ==2 && usuariolog.getEstado() == 1) {
                            response.sendRedirect(request.getContextPath() + "/ServletUsuario");
                        }
                    } else {
                        session.setAttribute("error", "El usuario o password no existen , Vuelva a Ingresar las credenciales");
                        view = request.getRequestDispatcher("inicioDeSesion.jsp");
                        view.forward(request, response);
                    }
                }



                break;

            case "autenticacionSeguridad":
                //session.setAttribute("userlogged", usuariolog);
                //System.out.println(usuariolog.getCodigo());
                String codigoAutenticacionIngresado = request.getParameter("codigoAutenticacionIngresado");
                String codigoAutenticacionOriginal = request.getParameter("codigoAutenticacion");
                //while (num_intentos>0) {
                    if (codigoAutenticacionIngresado.equals(codigoAutenticacionOriginal)) {
                        response.sendRedirect(request.getContextPath() + "/ServletSeguridad");
                    } else {
                        //s.out.println("error en el código");
                        //session.invalidate();
                        //response.sendRedirect("ServletInicio");
                        /*if(num_intentos>=2) {
                            session.setAttribute("error2", "Codigo Incorrecto, Vuelva a Ingresar \n" +
                                    "(Tiene " +num_intentos+ " Oportunidades Más)");
                        }else if (num_intentos==1){
                            session.setAttribute("error2", "Codigo Incorrecto, Vuelva a Ingresar \n" +
                                    "(Tiene " +num_intentos+ " Oportunidad Más)");
                        }

                        if(num_intentos>0) {
                            view = request.getRequestDispatcher("AutenticacionSeguridad.jsp");
                            view.forward(request, response);
                        }
                        num_intentos--;

                         */
                        //session.setAttribute("userlogged", usuariolog);
                        session.setAttribute("error2", "Codigo Incorrecto, Vuelva a Ingresar");
                        request.setAttribute("Codigo", codigoAutenticacionOriginal);
                        view = request.getRequestDispatcher("AutenticacionSeguridad.jsp");
                        view.forward(request, response);
                    }
                break;

            case "registroSeguridad":
                String correoPUCPSeg = request.getParameter("correoPUCPSeg");
                String codigoPUCPSeg = request.getParameter("codigoPUCPSeg");
                for (BUsuarios usuar : usersDao.getUsersList()){
                    if(correoPUCPSeg.equals(usuar.getCorreo()) && codigoPUCPSeg.equals(usuar.getCodigo())){
                        int idUsuario = usuar.getIdUsuario();
                        String contrasenaTemporalSeguridad = envioCorreo.generarContrasenaTemporalSeguridad();
                        envioCorreo.enviarContrasenaTemporal(contrasenaTemporalSeguridad, correoPUCPSeg);
                        usersDao.crearCredencialesUsuario(codigoPUCPSeg,contrasenaTemporalSeguridad,idUsuario);
                        String estadoUsuarioSeg = "4";
                        usersDao.actualizarEstadoDeUsuario(idUsuario,estadoUsuarioSeg);
                        session.setAttribute("msgSeg","LISTO! Ya falta poco...\n" +
                                                            "Se envió a su correo: \n" +
                                                            "Su  Contraseña Temporal De Acceso a la Aplicación\n" +
                                                            "Inicie sesión y establezca su Nueva Contraseña");
                        response.sendRedirect(request.getContextPath() + "/ServletInicio");
                    }
                }
                session.setAttribute("errorSeg","No Se Encontró alguno de los Campos , Vuelva a Ingresar Correctamente");
                view = request.getRequestDispatcher("RegistroSeguridad.jsp");
                view.forward(request, response);
                break;

                case "establecernuevacontraseg":

                    String contrasena1= request.getParameter("contrasena1");
                    String contrasena2= request.getParameter("contrasena2");
                    String idUsuarioStr = request.getParameter("idUsuarioLog");
                    int idUsuario = Integer.parseInt( idUsuarioStr);
                    if(contrasena1.equals(contrasena2)){
                        usersDao.actualizarContrasenaSeguridad(idUsuario,contrasena1);
                        String estadoUsuario = "1";
                        usersDao.actualizarEstadoDeUsuario(idUsuario,estadoUsuario);
                        response.sendRedirect(request.getContextPath()+"/ServletSeguridad");
                    }else {
                        session.setAttribute("errorSeg2","No Se Encontró alguno de los Campos , Ingrese Correctamente");
                        view = request.getRequestDispatcher("EstablecerNuevaContraSeguridad.jsp");
                        view.forward(request, response);
                    }
                    break;


                case "ValidacionRegistroUsuario":
                    String correouser = request.getParameter("correo");
                    String codigouser = request.getParameter("codigo2");
                    BUsuarios usuariovalidado = daoDatosFijos.validarCorreoContraseniaUsuario(codigouser,correouser);

                    if( usuariovalidado != null){
                        try{
                            //actualizar el estado en la master
                            daoDatosFijos.changeStateRegisterUser(usuariovalidado.getIdUsuario(),4);
                            // registrar en validacionusuarionuevo

                            String contrasenaTemporal = envioCorreo.generarContrasenaTemporalSeguridad();
                            envioCorreo.enviarContrasenaTemporal(contrasenaTemporal, correouser);
                            daoDatosFijos.registerUserValidation(codigouser,contrasenaTemporal,usuariovalidado.getIdUsuario());


                            session.setAttribute("msg","Usuario registrado exitosamente. Revise su correo para cambiar su contraseña");
                            response.sendRedirect(request.getContextPath() + "/ServletInicio");

                        } catch (IOException e) {
                            session.setAttribute("err","Error al registrar el usuario o datos incorrectos");
                            response.sendRedirect(request.getContextPath() + "/ServletInicio?action=Registrousuario");
                        }
                    }else{
                        session.setAttribute("err","Error al registrar el usuario o datos incorrectos");
                        response.sendRedirect(request.getContextPath() + "/ServletInicio?action=Registrousuario");
                    }
                    break;

        }
    }
}



