package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.beans.Incidencia;
import com.example.gigacontrol_g2.daos.DaoDatosFijos;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet(name = "ServletUsuario", value = "/ServletUsuario")
public class ServletUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        RequestDispatcher requestDispatcher;
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        UsersDao usersDao = new UsersDao();
        SeguridadDao seguridadDao = new SeguridadDao();


        switch (action) {
            case "editar":
                requestDispatcher = request.getRequestDispatcher("Usuario/EditarIncidencia.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "inicio":
                request.setAttribute("ListaDeIncidencias", seguridadDao.obtenerListaDeIncidencias());
                request.setAttribute("ListaNombres", usersDao.getUsersList());
                requestDispatcher = request.getRequestDispatcher("Usuario/InicioUsuario.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "listaMisIncidencias":
                //asignar
                request.setAttribute("ListaDeIncidencias", usersDao.obtenerListaDeIncidencias());
                requestDispatcher = request.getRequestDispatcher("Usuario/MisIncidencias.jsp");
                //enviar
                requestDispatcher.forward(request, response);
                break;

            case "nuevaIncidencia":
                requestDispatcher = request.getRequestDispatcher("Usuario/NuevaIncidencia.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "perfil":
                requestDispatcher = request.getRequestDispatcher("Usuario/PerfilUsuario.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "verIncidencia":
                requestDispatcher = request.getRequestDispatcher("Usuario/VerIncidencia.jsp");
                requestDispatcher.forward(request, response);
                break;
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        UsersDao usersDao = new UsersDao();

        switch (action) {
            case "buscar":
                String searchText = request.getParameter("searchText");

                ArrayList<Incidencia> lista = usersDao.BuscarIncidencia(searchText);
                request.setAttribute("lista", lista);
                request.setAttribute("searchText", searchText);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/InicioUsuario.jsp");
                requestDispatcher.forward(request, response);
                break;
        }
    }
}
