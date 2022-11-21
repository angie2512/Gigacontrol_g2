package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.daos.DaoDatosFijos;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "MisIncidencias", value = "/MisIncidencias")
public class MisIncidencias extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        UsersDao usersDao = new UsersDao();
        SeguridadDao seguridadDao = new SeguridadDao();
        RequestDispatcher view;
        //asignar
        request.setAttribute("ListaDeIncidencias", usersDao.obtenerListaDeIncidencias());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/MisIncidencias.jsp");
        //enviar
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
