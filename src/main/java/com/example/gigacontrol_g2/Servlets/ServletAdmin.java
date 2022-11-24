package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAdmin", urlPatterns = {"/ServletAdmin"})
public class ServletAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher requestDispatcher;

        UsersDao usersDao = new UsersDao();
        ArrayList<BUsuarios> lista = usersDao.getUsersList();

        String valor_total_filas_str = usersDao.contar();
        int valor_total_filas_int = Integer.parseInt(valor_total_filas_str);
        float valor_total_filas = Float.parseFloat(valor_total_filas_str);

        float maxPag = (float) (valor_total_filas / 9);
        int maxPag2 = (int) Math.ceil(maxPag);

        switch (action) {
            case "Inicio":
                BUsuarios user = (BUsuarios) request.getSession().getAttribute("userlogged");
                if(user != null && user.getIdUsuario()!=1 && user.getIdUsuario()!=2 ){
                    requestDispatcher = request.getRequestDispatcher("Admi/AdminInicio.jsp");
                    requestDispatcher.forward(request, response);
                }
                else {
                    requestDispatcher = request.getRequestDispatcher("inicioDeSesion.jsp");
                    requestDispatcher.forward(request, response);
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

                if (valor_pagina != maxPag2){
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



                requestDispatcher = request.getRequestDispatcher("Admi/listaUsuarios.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "Editar":
                String userID = request.getParameter("id");
                user = usersDao.buscarPorId(userID);

                if (user != null) { //abro el form para editar
                    request.setAttribute("user", user);
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
            case "borrar":
                String userID_b = request.getParameter("id");
                usersDao.borrar(userID_b);

                response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=ListaUsuarios");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        UsersDao usersDao = new UsersDao();






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
                try {
                    int rolID = Integer.parseInt(rolstr);
                    int userID = Integer.parseInt(userIDstr);
                    usersDao.actualizar(userID, nombre, apellido, dni, codigo, correo, categoria, rolID);
                    response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=ListaUsuarios");
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=Editar&id=" + userIDstr);
                }
                break;
            case "guardar":
                String nombre_c = request.getParameter("nombre");
                String apellido_c = request.getParameter("apellido");
                String dni_c = request.getParameter("dni");
                String codigo_c = request.getParameter("codigo");
                String correo_c = request.getParameter("correo");
                String categoria_c = request.getParameter("categoria");
                String celular = request.getParameter("celular");
                String rolstr_C = request.getParameter("rolID");
                try {
                    int rolID = Integer.parseInt(rolstr_C);
                    BUsuarios newuser = new BUsuarios();
                    newuser.setNombre(nombre_c);
                    newuser.setApellido(apellido_c);
                    newuser.setDni(dni_c);
                    newuser.setCodigo(codigo_c);
                    newuser.setCorreo(correo_c);
                    newuser.setCategoria(categoria_c);
                    newuser.setRolId(rolID);
                    newuser.setCelular(celular);
                    newuser.setContrasena("123456");
                    usersDao.guardar(newuser);
                    response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=ListaUsuarios");

                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/ServletAdmin?action=guardar");
                }
                break;


            case "buscar":
                String searchText = request.getParameter("searchText");

                ArrayList<BUsuarios> lista = usersDao.buscarPorApellido(searchText);

                int valor_pagina = 1;

                String nro_filas_total_busqueda_apellido_str = usersDao.contarxApellido(searchText);
                int nro_filas_total_busqueda_apellido_int = Integer.parseInt(nro_filas_total_busqueda_apellido_str);
                float valor_total_filas = Float.parseFloat(nro_filas_total_busqueda_apellido_str);

                float maxPag = (float) (valor_total_filas / 9);
                int maxPag2 = (int) Math.ceil(maxPag);


                if (request.getParameter("pg") != null) {
                    valor_pagina = Integer.parseInt(request.getParameter("pg"));
                }


                int regMin = (valor_pagina - 1) * 9;

                if (valor_pagina != maxPag2){
                    int regMax = valor_pagina * 9;
                    request.setAttribute("maxPag2", maxPag2);
                    request.setAttribute("regMin", regMin);
                    request.setAttribute("regMax", regMax);
                    request.setAttribute("valor_pagina", valor_pagina);
                }else{
                    int regMax = nro_filas_total_busqueda_apellido_int;
                    request.setAttribute("maxPag2", maxPag2);
                    request.setAttribute("regMin", regMin);
                    request.setAttribute("regMax", regMax);
                    request.setAttribute("valor_pagina", valor_pagina);
                }


                request.setAttribute("lista", lista);
                request.setAttribute("searchText", searchText);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admi/listaUsuarios.jsp");
                requestDispatcher.forward(request, response);
                break;
        }
    }
}
