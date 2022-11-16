package com.example.gigacontrol_g2.Usuario.Servlets;


import com.example.gigacontrol_g2.beans.Incidencia;
import com.example.gigacontrol_g2.daos.DaoDatosFijos;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "InicioUsuario", value = "/InicioUsuario")
public class InicioUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        UsersDao usersDao = new UsersDao();
        SeguridadDao seguridadDao = new SeguridadDao();
        RequestDispatcher view;

        //request.setAttribute("ListaEstados", daoestado.obtenerListaEstados());
        //request.setAttribute("ListaTipoDeIncidencias", seguridadDao.obtenerListaDeIncidencias());
        //request.setAttribute("ListaNivelesDeUrgencia", daoNivelDeUrgencia.obtenerListaNivelesDeUrgencia());
        request.setAttribute("ListaDeIncidencias", seguridadDao.obtenerListaDeIncidencias());
        request.setAttribute("ListaNombres", usersDao.getUsersList());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/InicioUsuario.jsp");

        requestDispatcher.forward(request, response);

        switch (action) {

            case ("buscar"):
                String buscar = request.getParameter("keyword");
                ArrayList<Incidencia> listaFiltrada = usersDao.BuscarIncidencia(buscar);
                request.setAttribute("ListaHeroes", listaFiltrada);
                view = request.getRequestDispatcher("/menuHeroes.jsp");
                view.forward(request, response);
                break;

        }
    }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
    }
