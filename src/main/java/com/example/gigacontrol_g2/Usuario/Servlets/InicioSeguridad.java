package com.example.gigacontrol_g2.Usuario.Servlets;

import com.example.gigacontrol_g2.Usuario.Daos.DaoEstado;
import com.example.gigacontrol_g2.Seguridad.DaosSeguridad.DaoIncidencia;
import com.example.gigacontrol_g2.Usuario.Daos.DaoNivelDeUrgencia;
import com.example.gigacontrol_g2.Usuario.Daos.DaoTipoDeIncidencia;
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
        RequestDispatcher vista;
        request.setAttribute("ListaEstados", daoestado.obtenerListaEstados());
        request.setAttribute("ListaTipoDeIncidencias", daoTipoDeIncidencia.obtenerListaTipoDeIncidencias());
        request.setAttribute("ListaNivelesDeUrgencia", daoNivelDeUrgencia.obtenerListaNivelesDeUrgencia());
        request.setAttribute("ListaDeIncidencias", daoIncidencia.obtenerListaDeIncidencias());
        vista = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
