package com.example.gigacontrol_g2.Usuario.Servlets;

import com.example.gigacontrol_g2.beans.Incidencia;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "VerIncidencia", urlPatterns= {"/VerIncidencia"})
public class VerIncidencia extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher vista;
        SeguridadDao seguridadDao = new SeguridadDao();
        String idIncidenciaStr = request.getParameter("id");
        int idIncidencia = Integer.parseInt(idIncidenciaStr);


        switch (action) {
            case "mostrar":
                Incidencia incidencia = seguridadDao.buscarIncidencia(idIncidencia);
                request.setAttribute("Incidencia", incidencia);
                vista = request.getRequestDispatcher("Seguridad/VerIncidencia.jsp");
                vista.forward(request, response);

                //response.sendRedirect(request.getContextPath() + "/InicioSeguridad");
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action= request.getParameter("action");
            SeguridadDao seguridadDao = new SeguridadDao();

            switch (action){
                case "guardar":
                    String idIncidenciaStr = request.getParameter("idIncidencia");
                    int idIncidencia = Integer.parseInt(idIncidenciaStr);
                    String resolucion = request.getParameter("resolucionIncidencia");

                    seguridadDao.guardarComentario(idIncidencia,resolucion);

                    response.sendRedirect(request.getContextPath()+"/InicioSeguridad");
                    break;
            }

    }
}
