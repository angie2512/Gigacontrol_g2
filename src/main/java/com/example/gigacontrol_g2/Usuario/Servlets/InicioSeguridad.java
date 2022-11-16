package com.example.gigacontrol_g2.Usuario.Servlets;


import com.example.gigacontrol_g2.daos.SeguridadDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "InicioSeguridad", value = "/InicioSeguridad")
public class InicioSeguridad extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //DaoEstado daoestado = new DaoEstado();
        //DaoNivelDeUrgencia daoNivelDeUrgencia = new DaoNivelDeUrgencia();
        SeguridadDao seguridadDao = new SeguridadDao();
        RequestDispatcher vista;
        //request.setAttribute("ListaEstados", daoestado.obtenerListaEstados());
        //request.setAttribute("ListaTipoDeIncidencias", daoTipoDeIncidencia.obtenerListaTipoDeIncidencias());
        //request.setAttribute("ListaNivelesDeUrgencia", daoNivelDeUrgencia.obtenerListaNivelesDeUrgencia());
        request.setAttribute("ListaDeIncidencias", seguridadDao.obtenerListaDeIncidencias());
        vista = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
