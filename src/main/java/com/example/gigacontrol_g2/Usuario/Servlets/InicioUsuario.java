package com.example.gigacontrol_g2.Usuario.Servlets;

import com.example.gigacontrol_g2.Usuario.Daos.DaoEstado;
import com.example.gigacontrol_g2.Usuario.Daos.DaoIncidencia;
import com.example.gigacontrol_g2.Usuario.Daos.DaoNivelDeUrgencia;
import com.example.gigacontrol_g2.Usuario.Daos.DaoTipoDeIncidencia;
import com.example.gigacontrol_g2.Usuario.Daos.UsuarioDao;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "InicioUsuario", value = "/InicioUsuario")
public class InicioUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoEstado daoestado = new DaoEstado();
        DaoTipoDeIncidencia daoTipoDeIncidencia = new DaoTipoDeIncidencia();
        DaoNivelDeUrgencia daoNivelDeUrgencia = new DaoNivelDeUrgencia();
        DaoIncidencia daoIncidencia = new DaoIncidencia();
        UsuarioDao usuarioDao = new UsuarioDao();

        request.setAttribute("ListaEstados", daoestado.obtenerListaEstados());
        request.setAttribute("ListaTipoDeIncidencias", daoTipoDeIncidencia.obtenerListaTipoDeIncidencias());
        request.setAttribute("ListaNivelesDeUrgencia", daoNivelDeUrgencia.obtenerListaNivelesDeUrgencia());
        request.setAttribute("ListaDeIncidencias", daoIncidencia.obtenerListaDeIncidencias());
        request.setAttribute("ListaNombres", usuarioDao.obtenerListaDeNombres());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/InicioUsuario.jsp");

        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
