package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.daos.DaoCorreo;
import com.example.gigacontrol_g2.beans.MailCorreo;
import com.example.gigacontrol_g2.daos.UsersDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MailServlet", value = "/MailServlet")
public class MailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        DaoCorreo daoCorreo = new DaoCorreo();
        UsersDao usersDao = new UsersDao();
        RequestDispatcher requestDispatcher;

        switch (action){
            case "enviarCorreo":
                request.setAttribute("listaCorreo", daoCorreo.obtenerCorreoUsuarios());
                requestDispatcher = request.getRequestDispatcher("COLOCAR JSP ESPECÍFICO");
                requestDispatcher.forward(request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
