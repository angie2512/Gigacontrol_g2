package com.example.gigacontrol_g2.Usuario.Servlets;


import com.example.gigacontrol_g2.daos.DaoDatosFijos;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "InicioUsuario", value = "/InicioUsuario")
public class InicioUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        UsersDao usersDao = new UsersDao();
        SeguridadDao seguridadDao = new SeguridadDao();

        //request.setAttribute("ListaEstados", daoestado.obtenerListaEstados());
        //request.setAttribute("ListaTipoDeIncidencias", seguridadDao.obtenerListaDeIncidencias());
        //request.setAttribute("ListaNivelesDeUrgencia", daoNivelDeUrgencia.obtenerListaNivelesDeUrgencia());
        request.setAttribute("ListaDeIncidencias", seguridadDao.obtenerListaDeIncidencias());
        request.setAttribute("ListaNombres", usersDao.getUsersList());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/InicioUsuario.jsp");

        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
