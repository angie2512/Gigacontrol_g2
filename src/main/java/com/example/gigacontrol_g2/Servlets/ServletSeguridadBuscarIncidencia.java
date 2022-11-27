package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.Incidencia;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletSeguridadBuscarIncidencia", value = "/ServletSeguridadBuscarIncidencia")
public class ServletSeguridadBuscarIncidencia extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        SeguridadDao seguridadDao = new SeguridadDao();

        switch (action) {
            case "buscar":
                String searchText = request.getParameter("searchText");

                ArrayList<Incidencia> lista = seguridadDao.buscarPorIncidencia(searchText);

                request.setAttribute("lista", lista);
                request.setAttribute("searchText", searchText);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");
                requestDispatcher.forward(request, response);
                break;
        }
    }
}