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
import java.util.ArrayList;

@WebServlet(name = "InicioUsuario", value = "/InicioUsuario")@MultipartConfig
public class InicioUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        HttpSession session= request.getSession();
        BUsuarios usuario=(BUsuarios) session.getAttribute("userlogged");
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        UsersDao usersDao = new UsersDao();
        SeguridadDao seguridadDao = new SeguridadDao();
        RequestDispatcher view;

        //request.setAttribute("ListaEstados", daoestado.obtenerListaEstados());
        //request.setAttribute("ListaTipoDeIncidencias", seguridadDao.obtenerListaDeIncidencias());
        //request.setAttribute("ListaNivelesDeUrgencia", daoNivelDeUrgencia.obtenerListaNivelesDeUrgencia());
        request.setAttribute("ListaDeIncidencias", seguridadDao.obtenerListaDeIncidencias());
        request.setAttribute("ListaNombres", usersDao.getUsersList());
        request.setAttribute("listaDestacados", usersDao.incidenciasDestacadas(usuario.getIdUsuario()));
        System.out.println("destacados: "+usersDao.incidenciasDestacadas(usuario.getIdUsuario()).size());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/InicioUsuario.jsp");

        requestDispatcher.forward(request, response);

        switch (action) {
            case "destacar":
                String idincidencia = request.getParameter("idi");
                int incidenciaid = Integer.parseInt(idincidencia);
                usersDao.destacarEstrella(usuario.getIdUsuario(), incidenciaid);
                response.sendRedirect(request.getContextPath()+"/InicioUsuario");
                break;
            case "listarimg":
                String idincidencia2 = request.getParameter("id");
                int incidenciaid2 = Integer.parseInt(idincidencia2);
                daoDatosFijos.listarImg(incidenciaid2,response);
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
                request.setAttribute("ListaDeIncidencias", lista);
                request.setAttribute("searchText", searchText);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/InicioUsuario.jsp");
                requestDispatcher.forward(request, response);
                break;
        }
    }
}
