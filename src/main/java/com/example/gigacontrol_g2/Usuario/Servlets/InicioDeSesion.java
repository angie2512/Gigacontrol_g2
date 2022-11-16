package com.example.gigacontrol_g2.Usuario.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "InicioDeSesion", value = "/InicioDeSesion")
public class InicioDeSesion extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "LogIn" : request.getParameter("action");
        RequestDispatcher vista;

        switch (action){
            case "LogIn":
                BUsuarios us = (BUsuarios) request.getSession().getAttribute("usuarioSession");

                //Se valida que la sesion exista  y tambien el id de ese usuario
                if( us!=null && us.getIdUsuario() !=0){
                    response.sendRedirect(request.getContextPath());
                }else{
                    vista = request.getRequestDispatcher("inicioDeSesion.jsp");
                    vista.forward(request, response);
                }
                break;

            case "LogOut":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect(request.getContextPath()+"/Index");
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UsersDao usersDao = new UsersDao();
        String codigo = request.getParameter("codigo");
        String contrasena  = request.getParameter("contrasena");

         BUsuarios usuario = usersDao.validarUsuarioPasswordHashed(codigo,contrasena);

        if(usuario !=null){
            HttpSession session = request.getSession();
            session.setAttribute("usuarioSession",usuario);

            if (usuario.getRolId() ==2){
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
        }
    }
}
