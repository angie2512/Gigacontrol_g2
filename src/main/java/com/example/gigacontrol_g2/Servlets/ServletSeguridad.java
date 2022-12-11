package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.JavaPDF;
import com.example.gigacontrol_g2.beans.*;
import com.example.gigacontrol_g2.daos.DaoDatosFijos;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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

        HttpSession session= request.getSession();
        BUsuarios usuario=(BUsuarios) session.getAttribute("userlogged");

        ArrayList<BUsuarios> lista = usersDao.getUsersList();

        String valor_total_filas_str = daoDatosFijos.contarIncidencias();
        int valor_total_filas_int = Integer.parseInt(valor_total_filas_str);
        float valor_total_filas = Float.parseFloat(valor_total_filas_str);


        float maxPag = (float) (valor_total_filas / 3);
        int maxPag2 = (int) Math.ceil(maxPag);

        switch (action) {
            case "mostrarFoto":
                seguridadDao.mostrarImagen(usuario.getIdUsuario(),response);
                break;

            case "listarIncidencia":

                request.setCharacterEncoding("UTF-8");
                if(usuario != null && usuario.getRolId()==1 ) {
                    int valor_pagina = 1;
                    /*request.setAttribute("listaUsuarios", usersDao.getUsersList());*/

                    //paginacion

                    if(request.getParameter("pg") != null){
                        valor_pagina = Integer.parseInt(request.getParameter("pg"));
                    }

                    int regMin = (valor_pagina-1)*3;

                    if(valor_pagina != maxPag2){
                        int regMax = valor_pagina * 3;

                        request.setAttribute("maxPag2", maxPag2);
                        request.setAttribute("regMin", regMin);
                        request.setAttribute("regMax", regMax);
                        request.setAttribute("valor_pagina", valor_pagina);
                    }else{
                        int regMax = valor_total_filas_int;

                        request.setAttribute("maxPag2", maxPag2);
                        request.setAttribute("regMin", regMin);
                        request.setAttribute("regMax", regMax);
                        request.setAttribute("valor_pagina", valor_pagina);
                    }

                    if(session.getAttribute("listaDescargar")!= null){
                        session.removeAttribute("listaDescargar");
                        session.setAttribute("listaDescargar",seguridadDao.obtenerListaDeIncidencias());
                    }else{
                        session.setAttribute("listaDescargar",seguridadDao.obtenerListaDeIncidencias());
                    }

                    request.setAttribute("listaIncidencias", seguridadDao.obtenerListaDeIncidencias());
                    requestDispatcher = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");
                    requestDispatcher.forward(request, response);
                }else{
                    requestDispatcher = request.getRequestDispatcher("inicioDeSesion.jsp");
                    requestDispatcher.forward(request, response);
                }

                break;


            case "paginacionInicio":
                int valor_pagina = 1;
                request.setAttribute("lista", lista);

                if(request.getParameter("pg") != null){
                    valor_pagina = Integer.parseInt(request.getParameter("pg"));
                }

                int regMin = (valor_pagina-1)*9;

                if(valor_pagina != maxPag2){
                    int regMax = valor_pagina * 9;

                    request.setAttribute("maxPag2", maxPag2);
                    request.setAttribute("regMin", regMin);
                    request.setAttribute("regMax", regMax);
                    request.setAttribute("valor_pagina", valor_pagina);
                }else{
                    int regMax = valor_total_filas_int;

                    request.setAttribute("maxPag2", maxPag2);
                    request.setAttribute("regMin", regMin);
                    request.setAttribute("regMax", regMax);
                    request.setAttribute("valor_pagina", valor_pagina);
                }

                requestDispatcher = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "perfil":
                request.setCharacterEncoding("UTF-8");
                requestDispatcher = request.getRequestDispatcher("Seguridad/Perfil.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "verIncidencia":
                request.setCharacterEncoding("UTF-8");
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
                session= request.getSession();
                BUsuarios bUsuarios = (BUsuarios) session.getAttribute("userlogged");
                seguridadDao.mostrarImagen(bUsuarios.getIdUsuario(), response);
                break;


            case "agregar":
                request.setAttribute("ListaIncidencias", seguridadDao.obtenerListaDeIncidencias());
                requestDispatcher = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "descargar":
                System.out.println("si llego");
                try(PrintWriter salir =  response.getWriter()) {
                    ArrayList<Incidencia> incidencias = (ArrayList<Incidencia>) session.getAttribute("listaDescargar");
                    int i = 1;
                    String text = "Codigo%Nombre%Estado%Nivel de Urgencia%Tipo de Incidencia\n";
                    for(Incidencia incidencia2 : incidencias){
                        text += incidencia2.getUsuario().getCodigo() +"%"+incidencia2.getUsuario().getNombre()+"%"+incidencia2.getEstado().getNombre()+"%"+
                                incidencia2.getNivelDeUrgencia().getNombre()+"%"+incidencia2.getTipoDeIncidencia().getNombre()+"\n";
                        i ++;
                    }
                    System.out.println(text.length());
                    response.setContentType("application/pdf");
                    response.setHeader("Content-Disposition", "attachment; filename=gigacontrol.pdf");
                    JavaPDF javaPDF= new JavaPDF();
                    String nombre = "GIGACONTROL REPORTE";
                    byte[] pdf= javaPDF.pdfFuncionTable(text,nombre);
                    InputStream in =new ByteArrayInputStream(pdf);
                    int f;
                    while((f=in.read())!=-1){
                        salir.write(f);
                    }
                    in.close();
                }
                break;
            default:
                response.sendRedirect(request.getContextPath());


        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        //BUsuarios bUsuarios = (BUsuarios) session.getAttribute("userlogged");
        String action = request.getParameter("action") == null ? "actualizarIncidencia": request.getParameter("action");
        SeguridadDao seguridadDao = new SeguridadDao();

        String idIncidenciaStr = request.getParameter("idIncidencia") == null?"0":request.getParameter("idIncidencia");
        int idIncidencia = Integer.parseInt(idIncidenciaStr);
        Incidencia incidencia;
        RequestDispatcher view;
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        ArrayList<String> estados = new ArrayList<>();
        estados.add("nombre");

        switch (action){

            case "buscarIncidencia":
                String searchText = request.getParameter("searchText")==null?"":request.getParameter("searchText");
                String estado = request.getParameter("estado")==null?"":request.getParameter("estado");
                String nivelurg = request.getParameter("nivelurg")==null?"":request.getParameter("nivelurg");
                ArrayList<Incidencia> lista = seguridadDao.BuscarIncidencia(searchText, estado, nivelurg);

                if(session.getAttribute("listaDescargar")!= null){
                    session.removeAttribute("listaDescargar");
                    session.setAttribute("listaDescargar", lista);
                }else{
                    session.setAttribute("listaDescargar", lista);
                }
                Incidencia inc  = new Incidencia();
                inc.setIdIncidencia(0);
                int valor_total_filas_int = lista.size();
                if(valor_total_filas_int==0){
                    lista.add(inc);
                }
                float valor_total_filas = (float) valor_total_filas_int;

                float maxPag = (float) (valor_total_filas / 3);
                int maxPag2 = (int) Math.ceil(maxPag);

                int valor_pagina = 1;
                //paginacion

                int regMin = (valor_pagina-1)*3;

                if(valor_pagina != maxPag2){
                    int regMax = valor_pagina * 3;

                    request.setAttribute("maxPag2", maxPag2);
                    request.setAttribute("regMin", regMin);
                    request.setAttribute("regMax", regMax);
                    request.setAttribute("valor_pagina", valor_pagina);
                }else{
                    int regMax = valor_total_filas_int;

                    request.setAttribute("maxPag2", maxPag2);
                    request.setAttribute("regMin", regMin);
                    request.setAttribute("regMax", regMax);
                    request.setAttribute("valor_pagina", valor_pagina);
                }
                //cierre paginacion
                request.setAttribute("listaIncidencias", lista);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Seguridad/InicioSeguridad.jsp");
                requestDispatcher.forward(request, response);
                break;

            /*case "buscar":
                String opcion  = request.getParameter("opcion");
                int idSleccioando = request.getParameter("id");

                if ( opcion .equals("En Proceso")){
                    listailtrado = seguridadDao.busquedaPorEstado()
                }else if (opcion.equales("Registrado")){
                    listafiltrado = seguridadDao.obtenerListaDeIncidencias()
                }else if (opcion.equals("Atendido))
                if(estado.equals("Resuelto")){
                    listaFiltraEstado = seguridadDao.busquedaPorEstado(buscar);
                }
                request.setAttribute("listaEstados",listaFiltraEstado);
                view = request.getRequestDispatcher("/Seguridad/InicioSeguridad.jsp");
                view.forward(request,response);
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

        }
    }
}
