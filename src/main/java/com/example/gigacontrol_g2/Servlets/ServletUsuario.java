package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.*;
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

@WebServlet(name = "ServletUsuario", value = "/ServletUsuario")
public class ServletUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "inicio" : request.getParameter("action");
        HttpSession session= request.getSession();
        BUsuarios usuario=(BUsuarios) session.getAttribute("userlogged");

        RequestDispatcher requestDispatcher;
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        UsersDao usersDao = new UsersDao();
        usersDao.obtenerIncidenciasDelUsuario(usuario.getIdUsuario());
        SeguridadDao seguridadDao = new SeguridadDao();

        ///INCIDENCIAS GENERALES///
        String valor_total_filas_str = daoDatosFijos.contarIncidencias();
        int valor_total_filas_int = Integer.parseInt(valor_total_filas_str);
        float valor_total_filas = Float.parseFloat(valor_total_filas_str);

        float maxPag = (float) (valor_total_filas / 3);
        int maxPag2 = (int) Math.ceil(maxPag);


        ///MIS INCIDENCIAS DESTACADAS///
        String valor_total_filas_str2 = usersDao.ContarIncidenciasDestacadas(usuario.getIdUsuario());
        int valor_total_filas_int2 = Integer.parseInt(valor_total_filas_str2);
        float valor_total_filas2 = Float.parseFloat(valor_total_filas_str2);

        float maxPag3 = (float) (valor_total_filas2 / 3);
        int maxPag4 = (int) Math.ceil(maxPag3);
        ////////////////////////





        request.setCharacterEncoding("UTF-8");
        BUsuarios userSeg = (BUsuarios) request.getSession().getAttribute("userlogged");

        switch (action) {

            case "inicio":

                if (userSeg != null && userSeg.getRolId() == 2) {
                    int valor_pagina = 1;
                    /*request.setAttribute("listaUsuarios", usersDao.getUsersList());*/

                    //paginacion

                    if (request.getParameter("pg") != null) {
                        valor_pagina = Integer.parseInt(request.getParameter("pg"));
                    }

                    int regMin = (valor_pagina - 1) * 3;

                    if (valor_pagina != maxPag2) {
                        int regMax = valor_pagina * 3;

                        request.setAttribute("maxPag2", maxPag2);
                        request.setAttribute("regMin", regMin);
                        request.setAttribute("regMax", regMax);
                        request.setAttribute("valor_pagina", valor_pagina);
                    } else {
                        int regMax = valor_total_filas_int;

                        request.setAttribute("maxPag2", maxPag2);
                        request.setAttribute("regMin", regMin);
                        request.setAttribute("regMax", regMax);
                        request.setAttribute("valor_pagina", valor_pagina);
                    }


                    request.setAttribute("ListaDeIncidencias", seguridadDao.obtenerListaDeIncidencias());


                    request.setAttribute("ListaNombres", usersDao.getUsersList());
                    request.setAttribute("listaDestacados", usersDao.incidenciasDestacadas(usuario.getIdUsuario()));
                    request.setAttribute("numDestacados", daoDatosFijos.numDestacadosPorIncidencia());
                    requestDispatcher = request.getRequestDispatcher("Usuario/InicioUsuario.jsp");
                    requestDispatcher.forward(request, response);
                }else {

                        requestDispatcher = request.getRequestDispatcher("inicioDeSesion.jsp");
                        requestDispatcher.forward(request, response);
                }
                    break;

                    case "listarimg":
                        String idincidencia2 = request.getParameter("id");
                        int incidenciaid2 = Integer.parseInt(idincidencia2);
                        daoDatosFijos.listarImg(incidenciaid2, response);
                        break;

                    case "listarimgPerfil":
                        String idusuarioimg = request.getParameter("idp");
                        int usuarioidimg = Integer.parseInt(idusuarioimg);
                        daoDatosFijos.listarImgPerfil(usuarioidimg, response);
                        break;

                    case "editar":
                        requestDispatcher = request.getRequestDispatcher("Usuario/EditarIncidencia.jsp");
                        requestDispatcher.forward(request, response);
                        break;

                    case "listaMisIncidencias":


                        if (userSeg != null && userSeg.getRolId() == 2) {
                            int valor_pagina2 = 1;
                            /*request.setAttribute("listaUsuarios", usersDao.getUsersList());*/


                            //paginacion de mis incidencias destacadas

                            if (request.getParameter("pg1") != null) {
                                valor_pagina2 = Integer.parseInt(request.getParameter("pg1"));
                            }

                            int regMin2 = (valor_pagina2 - 1) * 3;

                            if (valor_pagina2 != maxPag4) {
                                int regMax2 = valor_pagina2 * 3;

                                request.setAttribute("maxPag4", maxPag4);
                                request.setAttribute("regMin2", regMin2);
                                request.setAttribute("regMax2", regMax2);
                                request.setAttribute("valor_pagina2", valor_pagina2);
                            } else {
                                int regMax2 = valor_total_filas_int2;

                                request.setAttribute("maxPag4", maxPag4);
                                request.setAttribute("regMin2", regMin2);
                                request.setAttribute("regMax2", regMax2);
                                request.setAttribute("valor_pagina2", valor_pagina2);
                            }

                            //asignar
                            request.setAttribute("ListaDeIncidenciasDelUsuario", usersDao.obtenerIncidenciasDelUsuario(usuario.getIdUsuario()));
                            request.setAttribute("ListaDeIncidenciasDestacadas", usersDao.obtenerIncidenciasDestacadas(usuario.getIdUsuario()));
                            requestDispatcher = request.getRequestDispatcher("Usuario/MisIncidencias.jsp");
                            //enviar
                            requestDispatcher.forward(request, response);
                        }else{
                            requestDispatcher = request.getRequestDispatcher("inicioDeSesion.jsp");
                            requestDispatcher.forward(request, response);
                        }




                        break;

                    case "nuevaIncidencia":
                        requestDispatcher = request.getRequestDispatcher("Usuario/NuevaIncidencia.jsp");
                        requestDispatcher.forward(request, response);
                        break;

                    case "perfil":
                        requestDispatcher = request.getRequestDispatcher("Usuario/PerfilUsuario.jsp");
                        requestDispatcher.forward(request, response);
                        break;

                    case "destacar":
                        String idincidencia = request.getParameter("idi");
                        int incidenciaid = Integer.parseInt(idincidencia);
                        usersDao.destacarEstrella(usuario.getIdUsuario(), incidenciaid);
                        response.sendRedirect(request.getContextPath() + "/ServletUsuario");
                        break;

                    case "quitardestacado":
                        String idincidencia1 = request.getParameter("idi");
                        int incidenciaid1 = Integer.parseInt(idincidencia1);
                        usersDao.eliminarDestacado(usuario.getIdUsuario(), incidenciaid1);
                        response.sendRedirect(request.getContextPath() + "/ServletUsuario");
                        break;

                    case "verIncidencia":
                        String idIncidenciaStr = request.getParameter("id");
                        int idIncidencia = Integer.parseInt(idIncidenciaStr);
                        Incidencia incidencia = seguridadDao.buscarIncidencia(idIncidencia);
                        request.setAttribute("incidencia", incidencia);
                        ArrayList<Estado> listaEstados = daoDatosFijos.obtenerListaEstados();
                        request.setAttribute("ListaEstados", listaEstados);
                        ArrayList<ComentarIncidencia> listaDeComentarios = daoDatosFijos.obtenerComentariosDeIncidencia(idIncidencia);
                        request.setAttribute("ListaComentarios", listaDeComentarios);
                        request.setAttribute("listaDestacados", usersDao.incidenciasDestacadas(usuario.getIdUsuario()));
                        request.setAttribute("numDestacados", daoDatosFijos.numDestacadosPorIncidencia());
                        requestDispatcher = request.getRequestDispatcher("Usuario/VerIncidencia.jsp");
                        requestDispatcher.forward(request, response);
                        break;
                    case "mostrarFotoPerfil":
                        String idUsuario = request.getParameter("idu");
                        int idUsuario1 = Integer.parseInt(idUsuario);
                        daoDatosFijos.mostrarImagenUsuario(idUsuario1, response);
                        break;
                }
        }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        UsersDao usersDao = new UsersDao();
        HttpSession session= request.getSession();
        BUsuarios usuario=(BUsuarios) session.getAttribute("userlogged");
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        switch (action) {
            case "buscar":
                String searchText = request.getParameter("searchText");

                ArrayList<Incidencia> lista = usersDao.BuscarIncidencia(searchText);
                request.setAttribute("ListaDeIncidencias", lista);
                request.setAttribute("listaDestacados", usersDao.incidenciasDestacadas(usuario.getIdUsuario()));
                request.setAttribute("numDestacados", daoDatosFijos.numDestacadosPorIncidencia());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/InicioUsuario.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "registroIncidencia":
                String nombre_ = request.getParameter("nombre");
                String descripcion_ = request.getParameter("descripcion");
                String zonaPucp_ = request.getParameter("zonaPucp");
                String ubicacion_ = request.getParameter("ubicacion");
                TipoDeIncidencia ti = new TipoDeIncidencia();
                ti.setIdTipoDeIncidencia(Integer.parseInt(request.getParameter("tipoIncidenciaID")));
                NivelDeUrgencia nu = new NivelDeUrgencia();
                nu.setIdNivelDeUrgencia(Integer.parseInt(request.getParameter("nivelUrgenciaID")));
                Estado estado = new Estado();
                estado.setIdEstado(1);

                try {
                    Incidencia newIncidencia = new Incidencia();
                    newIncidencia.setNombreDeIncidencia(nombre_);
                    newIncidencia.setDescripcion(descripcion_);
                    newIncidencia.setZonaPucp(zonaPucp_);
                    newIncidencia.setUbicacion(ubicacion_);
                    newIncidencia.setTipoDeIncidencia(ti);
                    newIncidencia.setNivelDeUrgencia(nu);
                    newIncidencia.setEstado(estado);
                    usersDao.nuevaIncidencia(newIncidencia, usuario.getIdUsuario());

                    response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=inicio");

                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=nuevaIncidencia");
                }
                break;

        }
    }
}