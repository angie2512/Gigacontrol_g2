package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.beans.ComentarIncidencia;
import com.example.gigacontrol_g2.beans.Estado;
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

        String action = request.getParameter("action") == null ? "listarIncidencia" : request.getParameter("action");
        RequestDispatcher requestDispatcher;

        UsersDao usersDao = new UsersDao();
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        SeguridadDao seguridadDao = new SeguridadDao();


        switch (action) {
            case "listarIncidencia":
                BUsuarios userSeg = (BUsuarios) request.getSession().getAttribute("userlogged");
                if(userSeg != null && userSeg.getRolId()==1 ) {
                    request.setAttribute("listaUsuarios", usersDao.getUsersList());
                    request.setAttribute("listaIncidencias", seguridadDao.obtenerListaDeIncidencias());
                    requestDispatcher = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");
                    requestDispatcher.forward(request, response);
                }else{
                    requestDispatcher = request.getRequestDispatcher("inicioDeSesion.jsp");
                    requestDispatcher.forward(request, response);
                }

                break;

            case "perfil":
                requestDispatcher = request.getRequestDispatcher("Seguridad/Perfil.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "verIncidencia":
                String idIncidenciaStr = request.getParameter("id");
                int idIncidencia = Integer.parseInt(idIncidenciaStr);
                Incidencia incidencia = seguridadDao.buscarIncidencia(idIncidencia);
                request.setAttribute("incidencia", incidencia);
                ArrayList<Estado> listaEstados = daoDatosFijos.obtenerListaEstados();
                request.setAttribute("ListaEstados",listaEstados);
                ArrayList<ComentarIncidencia> listaDeComentarios = daoDatosFijos.obtenerComentariosDeIncidencia(idIncidencia);
                request.setAttribute("ListaComentarios",listaDeComentarios);
                requestDispatcher = request.getRequestDispatcher("Seguridad/VerIncidencia.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "reporte":
                String idIncidenciaStr1 = request.getParameter("id");
                int idIncidencia1 = Integer.parseInt(idIncidenciaStr1);
                Incidencia incidencia1 = seguridadDao.buscarIncidencia(idIncidencia1);
                request.setAttribute("indicencia", incidencia1);

                requestDispatcher = request.getRequestDispatcher("Seguridad/ReporteIncidencia.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "entregarImagen":
                HttpSession session= request.getSession();
                BUsuarios bUsuarios = (BUsuarios) session.getAttribute("userlogged");
                seguridadDao.mostrarImagen(bUsuarios.getIdUsuario(), response);
                break;
            default:
                response.sendRedirect(request.getContextPath());
                break;


        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        BUsuarios bUsuarios = (BUsuarios) session.getAttribute("userlogged");
        String action = request.getParameter("action") == null ? "actualizarIncidencia": request.getParameter("action");
        SeguridadDao seguridadDao = new SeguridadDao();

        String idIncidenciaStr = request.getParameter("idIncidencia");
        int idIncidencia = Integer.parseInt(idIncidenciaStr);


        switch (action){
            /*case "guardarComentario":
                //String idIncidenciaStr = request.getParameter("idIncidencia");
                //int idIncidencia = Integer.parseInt(idIncidenciaStr);
                String resolucion = request.getParameter("resolucionIncidencia");
                BUsuarios userSeg = (BUsuarios) request.getSession().getAttribute("userlogged");
                seguridadDao.guardarComentario(userSeg.getIdUsuario(),idIncidencia,resolucion);

                response.sendRedirect(request.getContextPath()+"/ServletSeguridad");
                break;

            case "actualizarEstado":
                String idEstadoStr = request.getParameter("estado");
                int idEstado = Integer.parseInt(idEstadoStr);
                seguridadDao.actualizarEstado(idEstado , idIncidencia);
                break;
             */

            case "actualizarIncidencia":
                String resolucion = request.getParameter("resolucionIncidencia");
                BUsuarios userSeg = (BUsuarios) request.getSession().getAttribute("userlogged");
                seguridadDao.guardarComentario(userSeg.getIdUsuario(),idIncidencia,resolucion);
                String idEstadoStr = request.getParameter("estado");
                int idEstado = Integer.parseInt(idEstadoStr);
                seguridadDao.actualizarEstado(idEstado , idIncidencia);
                response.sendRedirect(request.getContextPath()+"/ServletSeguridad");
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
                InputStream fotoPerfil = part.getInputStream();

                seguridadDao.editarFoto(bUsuarios.getIdUsuario(),fotoPerfil);
                bUsuarios.setFotoPerfil(fotoPerfil.toString());
                response.sendRedirect(request.getContextPath()+"/ServletSeguridad");
                break;

        }

    }
}
