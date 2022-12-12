package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.*;
import com.example.gigacontrol_g2.daos.DaoDatosFijos;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.catalina.User;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet(name = "ServletUsuario", urlPatterns ={"/ServletUsuario"} )
public class ServletUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action") == null ? "inicio" : request.getParameter("action");


        HttpSession session = request.getSession();
        BUsuarios usuario = (BUsuarios) session.getAttribute("userlogged");
        RequestDispatcher requestDispatcher;
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        UsersDao usersDao = new UsersDao();



        /*usersDao.obtenerIncidenciasDelUsuario(usuario.getIdUsuario());*/
        SeguridadDao seguridadDao = new SeguridadDao();



        ///CONTADORES PAGINACION INCIDENCIAS GENERALES --FALTA REPLICAR EL NULL DE DESTACADAS. ///
        int valor_total_filas_int = 0;
        float valor_total_filas = 0;
        String valor_total_filas_str = daoDatosFijos.contarIncidencias();
        System.out.println(valor_total_filas_str);
        if(valor_total_filas_str == null){
            valor_total_filas_int = 0;
            valor_total_filas = 0;
        }else{
            valor_total_filas_int = Integer.parseInt(valor_total_filas_str);
            System.out.println(valor_total_filas_int);
            valor_total_filas = Float.parseFloat(valor_total_filas_str);
        }
        float maxPag = (float) (valor_total_filas / 3);
        int maxPag2 = (int) Math.ceil(maxPag);
        System.out.println(maxPag2);
        ////////////////////////////////////////////

        ///CONTADORES PAGINACION - MIS INCIDENCIAS DESTACADAS///
        int valor_total_filas_int2 = 0;
        float valor_total_filas2 = 0;
        String valor_total_filas_str2 =null;
        if (usuario != null) {
            valor_total_filas_str2 = usersDao.ContarIncidenciasDestacadas(usuario.getIdUsuario());
        }

        if (valor_total_filas_str2 == null) {
            valor_total_filas_int2 = 0;
            valor_total_filas2 = 0;
        } else {
            valor_total_filas_int2 = Integer.parseInt(valor_total_filas_str2);
            valor_total_filas2 = Float.parseFloat(valor_total_filas_str2);
        }
        float maxPag3 = (float) (valor_total_filas2 / 3);
        int maxPag4 = (int) Math.ceil(maxPag3);

        ////////////////////////////////////////////



        switch (action) {

            case "inicio":

                if (usuario != null && usuario.getRolId() == 2) {


                    int valor_pagina = 1;
                    //paginacion

                    String s = request.getParameter("pg");
                    System.out.println("\n");
                    System.out.println(s);
                    boolean isNumeric = (s != null && s.matches("[0-9]+"));


                    if (request.getParameter("pg") != null) {
                        System.out.println("pasa validacion de vacio");
                        if (request.getParameter("pg") != "") {
                            System.out.println("pasa validacion de que es numero");
                            if (isNumeric == true) {
                                System.out.println("pasa validacion de que no es null");
                                if (Integer.parseInt(request.getParameter("pg")) > 0 && Integer.parseInt(request.getParameter("pg")) < maxPag2 + 1) {
                                    System.out.println("pasa validacion de estar limitado en los posibles valores de pagina");
                                    valor_pagina = Integer.parseInt(request.getParameter("pg"));
                                }
                                /*}*/




                                /*boolean valor_lista = list2.contains(Integer.parseInt(request.getParameter("pg")));
                                System.out.println(valor_lista);
                                if(valor_lista ==true){
                                    System.out.println("pasa filtro de que esta en la lista2");
                                    System.out.println("pg");*/
                                /*valor_pagina = Integer.parseInt(request.getParameter("pg"));*/


                            } else {
                                valor_pagina = 1;
                            }
                        } else {
                            valor_pagina = 1;
                        }
                    } else {
                        valor_pagina = 1;
                    }


                    System.out.println(valor_pagina);

                    int regMin = (valor_pagina - 1) * 3;
                    System.out.println(regMin + "#");

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
                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletInicio");
                }
                break;

            case "listarimg":
                String idincidencia2 = request.getParameter("id");
                int incidenciaid2 = Integer.parseInt(idincidencia2);
                daoDatosFijos.listarImg(incidenciaid2, response);
                break;

            case "listarimgPerfil":
                System.out.println("listar img");
                String idusuarioimg = request.getParameter("idp");
                int usuarioidimg = Integer.parseInt(idusuarioimg);
                System.out.println("idimg: " + usuarioidimg);
                daoDatosFijos.listarImgPerfil(usuarioidimg, response);

                break;
            //incidencia
            case "editar":
                String idinci = request.getParameter("id");
                int idIncidenciaa = Integer.parseInt(idinci);

                if (idinci != null) { //abro el form para editar
                    Incidencia incidencia = seguridadDao.buscarIncidencia(idIncidenciaa);
                    System.out.println("hola");
                    request.setAttribute("incidencia", incidencia);
                    requestDispatcher = request.getRequestDispatcher("Usuario/EditarIncidencia.jsp");
                    requestDispatcher.forward(request, response);
                } else { //id no encontrado
                    response.sendRedirect(request.getContextPath() + "/Usuario/VerMisIncidencias.jsp");
                }
                break;

            case "listaMisIncidencias":
                if (usuario != null && usuario.getRolId() == 2) {
                    int valor_pagina2 = 1;
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
                    ArrayList<Incidencia> listaDeMisIncidenciasD = usersDao.obtenerIncidenciasDestacadas(usuario.getIdUsuario());
                    /*if(listaDeMisIncidenciasD != null){*/
                    request.setAttribute("ListaDeIncidenciasDestacadas", listaDeMisIncidenciasD);
                    /*}*/
                    requestDispatcher = request.getRequestDispatcher("Usuario/MisIncidencias.jsp");
                    //enviar
                    requestDispatcher.forward(request, response);
                } else {
                    requestDispatcher = request.getRequestDispatcher("inicioDeSesion.jsp");
                    requestDispatcher.forward(request, response);
                }
                break;
            case "nuevaIncidencia":
                requestDispatcher = request.getRequestDispatcher("Usuario/NuevaIncidencia.jsp");
                requestDispatcher.forward(request, response);
                break;

            //case "regresaraMisIncidenciaUsuario":
            //  requestDispatcher = request.getRequestDispatcher("Usuario/VerMisIncidencias.jsp");
                //   requestDispatcher.forward(request, response);
                //break;
            case "perfil":
                request.setCharacterEncoding("UTF-8");
                
                requestDispatcher = request.getRequestDispatcher("Usuario/PerfilUsuario.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "destacar":
                String idincidencia = request.getParameter("idi");
                int incidenciaid = Integer.parseInt(idincidencia);
                usersDao.destacarEstrella(usuario.getIdUsuario(), incidenciaid);
                response.sendRedirect(request.getContextPath() + "/ServletUsuario");
                break;

            case "destacarIncVer":
                String idincidenciaV = request.getParameter("idi");
                int incidenciaidV = Integer.parseInt(idincidenciaV);
                usersDao.destacarEstrella(usuario.getIdUsuario(), incidenciaidV);
                response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=verIncidencia&id="+idincidenciaV);
                break;

            case "destacarIncVerMis":
                String idincidenciaVmis = request.getParameter("idi");
                int incidenciaidVmis = Integer.parseInt(idincidenciaVmis);
                usersDao.destacarEstrella(usuario.getIdUsuario(), incidenciaidVmis);
                response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=verMisIncidencias&id="+idincidenciaVmis);
                break;

            case "quitardestacado":
                String idincidencia1 = request.getParameter("idi");
                int incidenciaid1 = Integer.parseInt(idincidencia1);
                usersDao.eliminarDestacado(usuario.getIdUsuario(), incidenciaid1);
                response.sendRedirect(request.getContextPath() + "/ServletUsuario");
                break;

            case "quitardestacadoIncVer":
                String idincidencia1V = request.getParameter("idi");
                int incidenciaid1V = Integer.parseInt(idincidencia1V);
                usersDao.eliminarDestacado(usuario.getIdUsuario(), incidenciaid1V);
                response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=verIncidencia&id="+idincidencia1V);
                break;

            case "quitardestacadoIncVerMis":
                String idincidencia1Vmis = request.getParameter("idi");
                int incidenciaid1Vmis = Integer.parseInt(idincidencia1Vmis);
                usersDao.eliminarDestacado(usuario.getIdUsuario(), incidenciaid1Vmis);
                response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=verMisIncidencias&id="+idincidencia1Vmis);
                break;


            case "verIncidencia":
                String idIncidenciaStr = request.getParameter("id");
                int idIncidencia = Integer.parseInt(idIncidenciaStr);
                Incidencia incidencia = seguridadDao.buscarIncidencia(idIncidencia);
                request.setAttribute("incidencia", incidencia);
                ArrayList<Estado> listaEstados = daoDatosFijos.obtenerListaEstados();
                request.setAttribute("ListaEstados", listaEstados);
                ArrayList<ComentarIncidencia> listaComentarios = daoDatosFijos.obtenerComentariosDeIncidencia(idIncidencia);
                request.setAttribute("ListaComentarios", listaComentarios);
                request.setAttribute("listaDestacados", usersDao.incidenciasDestacadas(usuario.getIdUsuario()));
                request.setAttribute("numDestacados", daoDatosFijos.numDestacadosPorIncidencia());
                requestDispatcher = request.getRequestDispatcher("Usuario/VerIncidencia.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "verMisIncidencia":
                String idMisIncidenciaStr = request.getParameter("id");
                int idMisIncidencia = Integer.parseInt(idMisIncidenciaStr);
                Incidencia incidenciaMis = seguridadDao.buscarIncidencia(idMisIncidencia);
                request.setAttribute("incidencia", incidenciaMis);
                ArrayList<Estado> listaEstadosMis = daoDatosFijos.obtenerListaEstados();
                request.setAttribute("ListaEstados", listaEstadosMis);
                ArrayList<ComentarIncidencia> listaComentariosMis = daoDatosFijos.obtenerComentariosDeIncidencia(idMisIncidencia);
                request.setAttribute("ListaComentarios", listaComentariosMis);
                request.setAttribute("listaDestacados", usersDao.incidenciasDestacadas(usuario.getIdUsuario()));
                request.setAttribute("numDestacados", daoDatosFijos.numDestacadosPorIncidencia());
                request.setAttribute("numeroComentarios", usersDao.contarComentario(idMisIncidencia));
                requestDispatcher = request.getRequestDispatcher("Usuario/VerMisIncidencias.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "mostrarFotoPerfil":
                String idUsuario = request.getParameter("idu");
                int idUsuario1 = Integer.parseInt(idUsuario);
                daoDatosFijos.mostrarImagenUsuario(idUsuario1, response);
                break;

            case "borrar":
                String spell = request.getParameter("id");
                try{
                    int spelli = Integer.parseInt(spell);
                    usersDao.borrar(spelli);
                    response.sendRedirect(request.getContextPath()+"/ServletUsuario?action=listaMisIncidencias");

                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+ "/ServletUsuario?action=listaMisIncidencias");
                }
                break;

        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        UsersDao usersDao = new UsersDao();
        HttpSession session = request.getSession();
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        BUsuarios usuario = (BUsuarios) session.getAttribute("userlogged");

        String action = request.getParameter("action"); /*== null ? "lista" : request.getParameter("action");*/

        switch (action) {
            case "buscar":
                String searchText = request.getParameter("searchText");

                ArrayList<Incidencia> lista = usersDao.BuscarIncidencia(searchText);
                Incidencia inc  = new Incidencia();
                /*inc.setIdIncidencia(0);*/
                int valor_total_filas_int = lista.size();
                System.out.println(valor_total_filas_int);
                /*if(valor_total_filas_int==0){
                    lista.add(inc);
                }*/
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
                request.setAttribute("ListaDeIncidencias", lista);
                if(lista.size()==1){
                    System.out.println("idprueba: "+lista.get(0).getIdIncidencia());
                }
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
                System.out.println(request.getParameter("tipoIncidenciaID"));
                ti.setIdTipoDeIncidencia(Integer.parseInt(request.getParameter("tipoIncidenciaID")));


                //ti.setIdTipoDeIncidencia(1);
                NivelDeUrgencia nu = new NivelDeUrgencia();
                nu.setIdNivelDeUrgencia(Integer.parseInt(request.getParameter("nivelUrgenciaID")));

                //nu.setIdNivelDeUrgencia(1);
                Estado estado = new Estado();
                estado.setIdEstado(1);
                //fotoIncidencia
                /*Part foto = request.getPart("foto");
                System.out.println(foto);
                InputStream foto1= foto.getInputStream();
                System.out.println(foto1);*/

                //Part partin = request.getPart("fotoIncidencia");
                //InputStream fotoin = partin.getInputStream();


                try {
                    Incidencia newIncidencia = new Incidencia();
                    newIncidencia.setNombreDeIncidencia(nombre_);
                    newIncidencia.setDescripcion(descripcion_);
                    newIncidencia.setZonaPucp(zonaPucp_);
                    newIncidencia.setUbicacion(ubicacion_);
                    newIncidencia.setTipoDeIncidencia(ti);
                    newIncidencia.setNivelDeUrgencia(nu);
                    newIncidencia.setEstado(estado);
                    /*newIncidencia.setFoto(foto1);*/
                    usersDao.nuevaIncidencia(newIncidencia, usuario.getIdUsuario());
                    //usersDao.nuevaIncidencia(newIncidencia, usuario.getIdUsuario(), fotoin);

                    response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=inicio");

                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=nuevaIncidencia");
                }
                break;



            case "editarIncidencia":

                String incidenciaIDstr = request.getParameter("inciID");
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String zonaPucp = request.getParameter("zonaPucp");
                String ubicacion = request.getParameter("ubicacion");
                System.out.println(ubicacion);
                String tistr = request.getParameter("tipoIncidenciaID");
                String nustr = request.getParameter("nivelUrgenciaID");

                try {

                    int incidenID = Integer.parseInt(incidenciaIDstr);
                    System.out.println(incidenID);
                    int tiID = Integer.parseInt(tistr);
                    int nuID = Integer.parseInt(nustr);
                    System.out.println("llego id incidencia "+ incidenID);
                    usersDao.actualizarIncidencia(incidenID, nombre, descripcion, zonaPucp, ubicacion, tiID, nuID);
                    response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=verMisIncidencia&id=" + incidenciaIDstr);
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/ServletUsuario?action=verMisIncidencia&id=" + incidenciaIDstr);
                }
                break;

            case "ingresarComentario":
                String resolucion = request.getParameter("resolucionIncidencia");
                BUsuarios user = (BUsuarios) request.getSession().getAttribute("userlogged");
                int id = Integer.parseInt(request.getParameter("idIncidencia"));
                System.out.println("idInc"+id);
                usersDao.guardarComentario(user.getIdUsuario(), id, resolucion);

                response.sendRedirect(request.getContextPath()+"/ServletUsuario?action=verMisIncidencia&id=" + id);
                break;

        }
    }
}