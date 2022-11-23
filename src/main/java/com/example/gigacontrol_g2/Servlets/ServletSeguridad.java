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

@WebServlet(name = "ServletSeguridad", value = "/ServletSeguridad")
public class ServletSeguridad extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        RequestDispatcher requestDispatcher;

        UsersDao usersDao = new UsersDao();
        SeguridadDao seguridadDao = new SeguridadDao();
        ArrayList<Incidencia> lista = seguridadDao.obtenerListaDeIncidencias();
        //String idIncidenciaStr = request.getParameter("id");
        //int idIncidencia = Integer.parseInt("idIncidenciaStr");

        switch (action){

            case "listarIncidencia":
                request.setAttribute("listaUsuarios", usersDao.getUsersList());
                request.setAttribute("listaIncidencias", seguridadDao.obtenerListaDeIncidencias());
                requestDispatcher = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "perfil":
                requestDispatcher = request.getRequestDispatcher("Seguridad/Perfil.jsp");
                requestDispatcher.forward(request, response);
                break;


            case "entregaImagen":
                HttpSession session= request.getSession();
                BUsuarios bUsuarios = (BUsuarios) session.getAttribute("clienteLog");
                seguridadDao.mostrarImagen(bUsuarios.getIdUsuario(), response);
                break;

            case "reporte":
                String idIncidenciaStr1 = request.getParameter("id");
                int idIncidencia1 = Integer.parseInt(idIncidenciaStr1);
                Incidencia incidencia1 = seguridadDao.buscarIncidencia(idIncidencia1);
                request.setAttribute("indicencia",incidencia1);

                requestDispatcher = request.getRequestDispatcher("Seguridad/ReporteIncidencia.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "verIncidencia":
                String idIncidenciaStr = request.getParameter("id");
                int idIncidencia = Integer.parseInt(idIncidenciaStr);
                Incidencia incidencia = seguridadDao.buscarIncidencia(idIncidencia);
                request.setAttribute("indicencia",incidencia);
                requestDispatcher = request.getRequestDispatcher("Seguridad/VerIncidencia.jsp");
                requestDispatcher.forward(request, response);
                break;


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        SeguridadDao seguridadDao = new SeguridadDao();

        switch (action){
            case "guardar":
                String idIncidenciaStr = request.getParameter("idIncidencia");
                int idIncidencia = Integer.parseInt(idIncidenciaStr);
                String resolucion = request.getParameter("resolucionIncidencia");

                seguridadDao.guardarComentario(idIncidencia,resolucion);

                response.sendRedirect(request.getContextPath()+"/InicioSeguridad");
                break;

            case "buscar":
                String buscar = request.getParameter("keyword");
                ArrayList<Incidencia> listaFiltrada1 = seguridadDao.buscarPorIncidencia(buscar);
                request.setAttribute("listaIncidencias", listaFiltrada1);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ServletSeguridad");
                requestDispatcher.forward(request, response);
                break;

            case "actualizarFoto":
                Part part= request.getPart("photoUrl");
                InputStream foto = part.getInputStream();
                BUsuarios bUsuarios = new BUsuarios();

                seguridadDao.editarFoto(bUsuarios.getIdUsuario(),foto);
                bUsuarios.setFotoPerfil(foto.toString());
                response.sendRedirect(request.getContextPath()+"/ServletSeguridad");
                break;

        }

    }
}
