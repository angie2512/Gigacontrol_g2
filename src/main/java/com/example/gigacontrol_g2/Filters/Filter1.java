package com.example.gigacontrol_g2.Filters;

import com.example.gigacontrol_g2.beans.BUsuarios;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(filterName = "Filter1", urlPatterns = {"/ServletUsuario"})
public class Filter1 implements Filter {


    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {



        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        BUsuarios usuario = (BUsuarios) request.getSession().getAttribute("userlogged");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath());
        } else {
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0);

            chain.doFilter(request, response);
        }

    }


}

