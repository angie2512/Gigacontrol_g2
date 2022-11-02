package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.Daos.DaoEstado;
import com.example.gigacontrol_g2.Daos.DaoIncidencia;
import com.example.gigacontrol_g2.Daos.DaoNivelDeUrgencia;
import com.example.gigacontrol_g2.Daos.DaoTipoDeIncidencia;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "InicioSeguridad", value = "/InicioSeguridad")
public class InicioSeguridad extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoEstado daoestado = new DaoEstado();
        DaoTipoDeIncidencia daoTipoDeIncidencia = new DaoTipoDeIncidencia();
        DaoNivelDeUrgencia daoNivelDeUrgencia = new DaoNivelDeUrgencia();
        DaoIncidencia daoIncidencia = new DaoIncidencia();
        request.setAttribute("ListaEstados", daoestado.obtenerListaEstados());
        request.setAttribute("ListaTipoDeIncidencias", daoTipoDeIncidencia.obtenerListaTipoDeIncidencias());
        request.setAttribute("ListaNivelesDeUrgencia", daoNivelDeUrgencia.obtenerListaNivelesDeUrgencia());
        request.setAttribute("ListaDeIncidencias", daoIncidencia.obtenerListaDeIncidencias());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");

        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
