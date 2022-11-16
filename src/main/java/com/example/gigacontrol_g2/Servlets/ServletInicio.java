package com.example.gigacontrol_g2.Servlets;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.daos.DaoDatosFijos;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletInicio", urlPatterns = {"","/ServletInicio"})
public class ServletInicio extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher requestDispatcher;
        if(action==null){
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request,response);
        }
        else{
            switch (action){
                case "LogIn":
                    BUsuarios user = (BUsuarios) request.getSession().getAttribute("userlogged") ;

                    if(user != null && user.getIdUsuario() !=0){
                        response.sendRedirect(request.getContextPath());
                        System.out.println("aca?");
                    }
                    else {
                        requestDispatcher = request.getRequestDispatcher("inicioDeSesion.jsp");
                        requestDispatcher.forward(request, response);
                        System.out.println("aqui");
                    }
                    break;
                case "logout":
                    HttpSession session = request.getSession();
                    session.invalidate();
                    response.sendRedirect( request.getContextPath() + "/ServletInicio");
                    break;
                case "registro":
                    requestDispatcher = request.getRequestDispatcher("registro.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "Registrousuario":
                    requestDispatcher = request.getRequestDispatcher("RegistroUsuario.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "Registroseguridad":
                    requestDispatcher = request.getRequestDispatcher("RegistroSeguridad.jsp");
                    requestDispatcher.forward(request,response);
                    break;

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();

        String codigo = request.getParameter("codigo");
        String contrasena  = request.getParameter("contrasena");
        BUsuarios usuariolog = daoDatosFijos.validUserPassword(codigo,contrasena);
        if(usuariolog !=null){
            HttpSession session = request.getSession();
            session.setAttribute("userlogged",usuariolog);
            if (usuariolog.getRolId()==3){
                response.sendRedirect("ServletAdmin?action=Inicio");
            }else if (usuariolog.getRolId()==1){
                response.sendRedirect("InicioSeguridad");
            }
            else {
                response.sendRedirect("InicioUsuario");
            }
        }else{
            response.sendRedirect(request.getContextPath() + "ServletInicio?action=LogIn&error");
        }
    }
}
