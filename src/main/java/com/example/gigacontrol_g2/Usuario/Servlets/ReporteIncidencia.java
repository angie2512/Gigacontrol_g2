package com.example.gigacontrol_g2.Usuario.Servlets;

import com.example.gigacontrol_g2.Seguridad.DaosSeguridad.DaoIncidencia;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ReporteIncidencia", value = "/ReporteIncidencia")
public class ReporteIncidencia extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher vista;
        DaoIncidencia daoIncidencia = new DaoIncidencia();
        String idIncidenciaStr = request.getParameter("id");
        int idIncidencia = Integer.parseInt(idIncidenciaStr);

        switch (action) {
            case "mostrarReporte":
                Incidencia incidencia = daoIncidencia.buscarIncidencia(idIncidencia);
                request.setAttribute("incidencia2", incidencia);
                vista = request.getRequestDispatcher("Seguridad/ReporteIncidencia.jsp");
                vista.forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
