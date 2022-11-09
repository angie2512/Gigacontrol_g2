package com.example.gigacontrol_g2.Usuario.Servlets;

import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.Incidencia;
import com.example.gigacontrol_g2.Seguridad.DaosSeguridad.DaoIncidencia;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "VerIncidencia", urlPatterns= {"/VerIncidencia"})
public class VerIncidencia extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (action == null) ? "mostrar" : action;
        RequestDispatcher vista;
        DaoIncidencia daoIncidencia = new DaoIncidencia();


        switch (action) {
            case "mostrar":
                String idIncidenciaStr = request.getParameter("id");
                int idIncidencia = Integer.parseInt(idIncidenciaStr);
                Incidencia incidencia = daoIncidencia.buscarIncidencia(idIncidencia);
                System.out.println(incidencia.getIdIncidencia());
                System.out.println(incidencia.getUsuario().getNombre());
                System.out.println(incidencia.getDescripcion());
                System.out.println(incidencia.getUsuario().getCodigo());
                request.setAttribute("incidencia", incidencia);
                vista = request.getRequestDispatcher("Seguridad/VerIncidencia.jsp");
                vista.forward(request, response);

                response.sendRedirect(request.getContextPath() + "/InicioSeguridad");
                break;

            case "mostrarReporte":
                String idIncidencia1Str = request.getParameter("id");
                int idIncidencia1 = Integer.parseInt(idIncidencia1Str);
                Incidencia incidencia1 = daoIncidencia.buscarIncidencia(idIncidencia1);
                request.setAttribute("Incidencia", incidencia1);
                vista = request.getRequestDispatcher("Seguridad/ReporteIncidencia.jsp");
                vista.forward(request, response);

                response.sendRedirect(request.getContextPath() + "/InicioSeguridad");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action= request.getParameter("action");
            DaoIncidencia daoIncidencia = new DaoIncidencia();

            switch (action){
                case "guardar":
                    String idIncidenciaStr = request.getParameter("idIncidencia");
                    int idIncidencia = Integer.parseInt(idIncidenciaStr);
                    String resolucion = request.getParameter("resolucionIncidencia");

                    daoIncidencia.guardarComentario(idIncidencia,resolucion);

                    response.sendRedirect(request.getContextPath()+"/InicioSeguridad");
                    break;
            }

    }
}
