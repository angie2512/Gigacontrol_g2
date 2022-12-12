package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.daos.DaoAdmin;
import com.example.gigacontrol_g2.daos.SeguridadDao;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.swing.*;
import java.awt.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

@MultipartConfig
@WebServlet(name = "ServletAdmin", urlPatterns = {"/ServletAdmin"})
public class
ServletAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action") == null ? "Inicio" : request.getParameter("action");
        RequestDispatcher requestDispatcher;
        DaoAdmin daoAdmin = new DaoAdmin();
        UsersDao usersDao = new UsersDao();
        ArrayList<BUsuarios> lista = usersDao.getUsersList();

        String valor_total_filas_str = usersDao.contar();
        int valor_total_filas_int = Integer.parseInt(valor_total_filas_str);
        float valor_total_filas = Float.parseFloat(valor_total_filas_str);

        float maxPag = (float) (valor_total_filas / 9);
        int maxPag2 = (int) Math.ceil(maxPag);
        BUsuarios user = (BUsuarios) request.getSession().getAttribute("userlogged");
        switch (action) {
            case "Inicio":
                if (user != null /*&& user.getIdUsuario()!=1 && user.getIdUsuario()!=2 */) {
                    requestDispatcher = request.getRequestDispatcher("Admi/AdminInicio.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletInicio");
                }
                break;

            case "Perfil":
                requestDispatcher = request.getRequestDispatcher("Admi/perfil.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "ListaUsuarios":

                int valor_pagina = 1;

                request.setAttribute("lista", lista);

                if (request.getParameter("pg") != null) {
                    valor_pagina = Integer.parseInt(request.getParameter("pg"));
                }
                int regMin = (valor_pagina - 1) * 9;

                if (valor_pagina != maxPag2) {
                    int regMax = valor_pagina * 9;
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
                for (BUsuarios p : lista) {
                    if (p.getApellido().equalsIgnoreCase("maradona")) {
                        System.out.println("foto? " + p.getFotoPerfil());
                    }
                }
                requestDispatcher = request.getRequestDispatcher("Admi/listaUsuarios.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "Editar":
                String userID = request.getParameter("id");
                BUsuarios userNew = daoAdmin.buscarPorId(userID);
                // user = usersDao.buscarPorId(userID);
                if (user != null) { //abro el form para editar
                    request.setAttribute("user", userNew);
                    requestDispatcher = request.getRequestDispatcher("Admi/edituser.jsp");
                    requestDispatcher.forward(request, response);
                } else { //id no encontrado
                    response.sendRedirect(request.getContextPath() + "/ServletAdmin");
                }
                break;
            case "nuevoUsuario":
                requestDispatcher = request.getRequestDispatcher("Admi/registarusuario.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "banear":
                String userID_ban = request.getParameter("id");
                daoAdmin.banear(userID_ban);
                response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=ListaUsuarios");
                break;
            case "borrar":
                String userID_del = request.getParameter("id");
                daoAdmin.borrar(userID_del);
                response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=ListaUsuarios");
                break;
            case "reactivar":
                String userID_react = request.getParameter("id");
                daoAdmin.reactivar(userID_react);
                response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=ListaUsuarios");
                break;
            case "mostrafoto":
                String idStr = request.getParameter("id");
                int id = Integer.parseInt(idStr);
                daoAdmin.viewImage(id, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        DaoAdmin daoAdmin = new DaoAdmin();
        UsersDao usersDao = new UsersDao();
        HttpSession session = request.getSession();
        BUsuarios usuario = (BUsuarios) session.getAttribute("userlogged");

        switch (action) {
            case "actualizar":

                String userIDstr = request.getParameter("userID");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String dni = request.getParameter("dni");
                String codigo = request.getParameter("codigo");
                String correo = request.getParameter("correo");
                String categoria = request.getParameter("categoria");
                String rolstr = request.getParameter("rolID");
                System.out.println("id: " + userIDstr);
                System.out.println("rol: " + rolstr);
                try {
                    System.out.println("entra?");
                    int rolID = Integer.parseInt(rolstr);
                    int userID = Integer.parseInt(userIDstr);
                    daoAdmin.update(userID, nombre, apellido, dni, codigo, correo, categoria, rolID);
                    //usersDao.actualizar(userID, nombre, apellido, dni, codigo, correo, categoria, rolID);
                    response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=ListaUsuarios");
                } catch (NumberFormatException e) {
                    System.out.println("prob");
                    response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=Editar&id=" + userIDstr);
                }
                break;
            case "guardar":
                String nombre_c = request.getParameter("nombre");
                String apellido_c = request.getParameter("apellido");
                String correo_c = request.getParameter("correo");
                String codigo_c = request.getParameter("codigo");
                String dni_c = request.getParameter("dni");
                String celular = request.getParameter("celular");
                String categoria_c = request.getParameter("categoria");
                String rolstr_C = request.getParameter("rolID");
                System.out.println("nombre null?" + "hola" + nombre_c + "pedo");
                BUsuarios newuser = new BUsuarios();
                if (nombre_c.equals("") || apellido_c == null || correo_c == null || codigo_c == null || dni_c == null || celular == null || categoria_c == null || rolstr_C == null) {
                    System.out.println("entra?");
                    request.getSession().setAttribute("err", "Debe LLenar todos los campos");
                    response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=nuevoUsuario");
                } else {
                    if (dni_c.length() == 8) {
                        if (daoAdmin.validarDNI(dni_c)) {
                            if (codigo_c.length() == 8) {
                                if (daoAdmin.validarCodigo(codigo_c)) {
                                    try {//celular
                                        int number = Integer.parseInt(celular);
                                        if (celular.length() == 9) {
                                            if (correo_c.contains("@")) {
                                                if (categoria_c != null) {
                                                    if (rolstr_C != null) {
                                                        newuser.setNombre(nombre_c);
                                                        newuser.setApellido(apellido_c);
                                                        newuser.setDni(dni_c);
                                                        newuser.setCelular(celular);
                                                        newuser.setCodigo(codigo_c);
                                                        newuser.setCorreo(correo_c);
                                                        newuser.setCategoria(categoria_c);
                                                        newuser.setRolId(Integer.parseInt(rolstr_C));
                                                        daoAdmin.guardar(newuser);
                                                        response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=ListaUsuarios");
                                                    } else {
                                                        request.getSession().setAttribute("msj6", "Debe seleccionar una rol");
                                                    }
                                                } else {
                                                    request.getSession().setAttribute("msj5", "Debe seleccionar una categoria");
                                                }
                                            } else {
                                                request.getSession().setAttribute("msj4", "Debe ingresar un correo valido");
                                            }
                                        } else {
                                            request.getSession().setAttribute("msj3", "El numero debe tener 9 digitos");
                                        }
                                    } catch (NumberFormatException e) {
                                        request.getSession().setAttribute("msj3", "Ingrese valores numericos");
                                    }
                                } else {
                                    request.getSession().setAttribute("msj2", "El codigo ingresado ya se encuntra registrado");
                                }
                            } else {
                                request.getSession().setAttribute("msj2", "El codigo PUCP debe tener 8 digitos");
                            }
                        } else {
                            request.getSession().setAttribute("msj", "El Numero de DNI ingresado ya se encuntra registrado");
                        }
                    } else {
                        request.getSession().setAttribute("msj", "El Numero de DNI debe tener 8 digitos");
                    }
                }
                // response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=nuevoUsuario");
                break;


            case "buscar":
                ArrayList<BUsuarios> lista = null;
                String tipo = request.getParameter("tipoBusqueda");
                String parameter = request.getParameter("parameter");

                String nro_filas_total_busqueda_apellido_str = "0";

                if (tipo == null) {
                    tipo = "apellido";
                }

                if (tipo.equalsIgnoreCase("apellido")) {
                    lista = daoAdmin.buscarPorApellido(parameter);
                    nro_filas_total_busqueda_apellido_str = daoAdmin.contarApellido(parameter);
                } else if (tipo.equalsIgnoreCase("nombre")) {
                    lista = daoAdmin.buscarPorNombre(parameter);
                    nro_filas_total_busqueda_apellido_str = daoAdmin.contarNombre(parameter);
                } else if (tipo.equalsIgnoreCase("codigo")) {
                    lista = daoAdmin.buscarPorCodigo(parameter);
                    nro_filas_total_busqueda_apellido_str = daoAdmin.contarCodigo(parameter);
                }

                int valor_pagina = 1;

                // String nro_filas_total_busqueda_apellido_str = usersDao.contarxApellido(parameter);


                int nro_filas_total_busqueda_apellido_int = Integer.parseInt(nro_filas_total_busqueda_apellido_str);
                float valor_total_filas = Float.parseFloat(nro_filas_total_busqueda_apellido_str);

                float maxPag = (float) (valor_total_filas / 9);
                int maxPag2 = (int) Math.ceil(maxPag);


                if (request.getParameter("pg") != null) {
                    valor_pagina = Integer.parseInt(request.getParameter("pg"));
                }


                int regMin = (valor_pagina - 1) * 9;

                if (valor_pagina != maxPag2) {
                    int regMax = valor_pagina * 9;
                    request.setAttribute("maxPag2", maxPag2);
                    request.setAttribute("regMin", regMin);
                    request.setAttribute("regMax", regMax);
                    request.setAttribute("valor_pagina", valor_pagina);
                } else {
                    int regMax = nro_filas_total_busqueda_apellido_int;
                    request.setAttribute("maxPag2", maxPag2);
                    request.setAttribute("regMin", regMin);
                    request.setAttribute("regMax", regMax);
                    request.setAttribute("valor_pagina", valor_pagina);
                }


                request.setAttribute("lista", lista);
                request.setAttribute("parameter", parameter);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admi/listaUsuarios.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "actualizarFoto":
                SeguridadDao seguridadDao = new SeguridadDao();
                Part part = request.getPart("photo");
                InputStream foto = part.getInputStream();
                seguridadDao.editarFoto(usuario.getIdUsuario(), foto);
                usuario.setFotoPerfil(foto.toString());

                /*
                response.sendRedirect(request.getContextPath()+"/ServletSeguridad?action=perfil");

                System.out.println("user to chanf fo :"+ usuario.getIdUsuario());
                Part part= request.getPart("Newphoto");

                InputStream foto= part.getInputStream();

                daoAdmin.updatePhoto(usuario.getIdUsuario(),foto);

                usuario.setFotoPerfil(foto.toString());*/
                response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=Perfil");
                break;
        }
    }
}
