package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "PerfilUsuario", value = "/PerfilUsuario")
@MultipartConfig
public class PerfilUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action")==null?"normal":request.getParameter("action");
        SeguridadDao seguridadDao = new SeguridadDao();
        HttpSession session= request.getSession();
        BUsuarios usuario=(BUsuarios) session.getAttribute("userlogged");
        switch (action){
            case "mostrarFoto":
                seguridadDao.mostrarImagen(usuario.getIdUsuario(),response);
                break;
            case "normal":
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/PerfilUsuario.jsp");
                requestDispatcher.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        SeguridadDao seguridadDao = new SeguridadDao();
        HttpSession session= request.getSession();
        BUsuarios usuario=(BUsuarios) session.getAttribute("userlogged");

        String action=request.getParameter("action")==null?"":request.getParameter("action");
        switch (action){
            case "actualizarFoto":
                Part part= request.getPart("Newphoto");
                InputStream foto= part.getInputStream();
                seguridadDao.editarFoto(usuario.getIdUsuario(), foto);
                usuario.setFotoPerfil(foto.toString());
                response.sendRedirect(request.getContextPath()+"/ServletSeguridad?action=perfil");
                break;

            case "actualizarFotoPerfil":
                Part part1= request.getPart("Newphoto");
                InputStream foto1= part1.getInputStream();
                seguridadDao.editarFoto(usuario.getIdUsuario(), foto1);
                usuario.setFotoPerfil(foto1.toString());
                response.sendRedirect(request.getContextPath()+"/ServletUsuario?action=perfil");
                break;

        }
    }
}
