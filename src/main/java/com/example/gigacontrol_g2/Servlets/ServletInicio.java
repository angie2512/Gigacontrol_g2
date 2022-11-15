package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.Usuario;
import com.example.gigacontrol_g2.Seguridad.DaosSeguridad.DaoUsuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletInicio", urlPatterns = {"","/ServletInicio"})
public class ServletInicio extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher requestDispatcher;
        if(action==null){
            System.out.println("en index");
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request,response);
        }
        else{
            switch (action){
                case "LogIn":
                    Usuario us = (Usuario) request.getSession().getAttribute("usuarioSession");

                    //Se valida que la sesion exista  y tambien el id de ese usuario
                    if( us!=null && us.getIdUsuario() !=0){
                        response.sendRedirect(request.getContextPath());
                    }else{
                        requestDispatcher = request.getRequestDispatcher("inicioDeSesion.jsp");
                        requestDispatcher.forward(request, response);
                    }
                    break;


                case "registro":
                    System.out.println("en registro buen");
                    requestDispatcher = request.getRequestDispatcher("registro.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "Registrousuario":
                    System.out.println("en usuario good");
                    requestDispatcher = request.getRequestDispatcher("RegistroUsuario.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "Registroseguridad":
                    System.out.println("En usuario good");
                    requestDispatcher = request.getRequestDispatcher("RegistroSeguridad.jsp");
                    requestDispatcher.forward(request,response);
                    break;

            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ACA?");
        /*DaoUsuario daoUsuario = new DaoUsuario();

        String codigo = request.getParameter("codigo");
        String contrasena  = request.getParameter("contrasena");

        Usuario usuario = daoUsuario.validarUsuarioPasswordHashed(codigo,contrasena);

        if(usuario !=null){
            HttpSession session = request.getSession();
            session.setAttribute("usuarioSession",usuario);

            if (usuario.getRol().getIdRol()==2){
                if(usuario.getCategoria() == "administrativo"){
                    response.sendRedirect(request.getContextPath()+"/InicioAdmi");
                }else{
                    response.sendRedirect(request.getContextPath()+"/InicioUsuario");
                }
            }else{
                response.sendRedirect(request.getContextPath()+"/InicioSeguridad");
            }
        }else{
            response.sendRedirect(request.getContextPath() + "/InicioDeSesion?error");
        }*/
    }
}
