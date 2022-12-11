<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    BUsuarios usuario = (BUsuarios) session.getAttribute("userlogged");
    if (usuario != null && usuario.getIdUsuario() > 0 && usuario.getRolId() == 1) {
        response.sendRedirect(request.getContextPath() + "/ServletSeguridad");
    } else if (usuario != null && usuario.getIdUsuario() > 0 && usuario.getRolId() == 2) {
        response.sendRedirect(request.getContextPath() + "/ServletUsuario");
    } else if (usuario != null && usuario.getIdUsuario() > 0 && usuario.getRolId() == 3) {
        response.sendRedirect(request.getContextPath() + "/ServletAdmin");
    }
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
              crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Ek Mukta' rel='stylesheet'>
        <title>Bienvenid@ GigaControl</title>
        <style>
            body {
                background: url("https://files.pucp.education/puntoedu/wp-content/uploads/2021/03/31184656/campus-pucp-cia-letras-2020_03-1920x1080-1.jpg");
                background-position: center center;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                margin: 0;
                height: 100vh;
                bgcolor: "#800000";
                font-family: 'Ek Mukta';
                font-size: 22px;
            }

            p {
                font-family: Decor;
            }

            .btn-1 {
                display: inline-block;
                background: #b4ebf7;
                text-decoration: none;
                font-size: 18px;
                padding: 15px 25px;
                color: #305767;
                border-radius: 30px;
                border: none;
            }

            .btn-2 {
                display: inline-block;
                background: #adf3db;
                text-decoration: none;
                font-size: 18px;
                padding: 15px 25px;
                color: #305767;
                border-radius: 30px;
                border: none;
            }

            @media (min-width: 768px) {
                .btn-1 {
                    padding: 15px 105px;
                    background-color: #E3F3FA;
                }

                .btn-2 {
                    padding: 15px 105px;
                    background-color: #E3F3FA;
                }
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>


    </head>

    <body class="p-3 m-0 border-0 bd-example">


        <center>
            <div class="card mb-3"
                 style="max-width:50rem ;background-color:rgba(255,255,255,0.70); top: 50%; left: 50%; transform: translateY(-50%) translateX(-50%); position: absolute">
                <div class="card-header">
                    <img src="resources/Images/LOGO_azul.png" alt="Logo" width="145rem;" height="48rem"
                         class="rounded float-start img-fluid">
                </div>
                <div class="card-body">
                    <center>
                        <h1 style="font-family:'Georgia';color:#4b71bb" class="card-title"><b>BIENVENIDO A
                            GIGACONTROL</b></h1>
                        <h5 style="font-family: 'Mukta Mahee', sans-serif;color:#40936d" class="card-subtitle mb-2">
                            Servicio de ayuda a incidencias en la comunidad PUCP</h5>
                        <br>
                        <h6 style="font-family: 'Georgia'">Elige la opción que desees realizar</h6>
                        <p></p>
                        <div class="d-grid gap-2 mx-auto">
                            <a href="<%=request.getContextPath()%>/ServletInicio?action=LogIn">
                                <button class="btn-1" type="button"><b>Iniciar Sesión</b></button>
                            </a>
                            <a href="<%=request.getContextPath()%>/ServletInicio?action=registro">
                                <button class="btn-2" type="button"><b>Registrarse</b></button>
                            </a>
                            <br>
                        </div>

                        <% if (session.getAttribute("msg") != null) {%>
                        <div class="alert alert-success"><%=session.getAttribute("msg")%>
                        </div>
                        <% session.removeAttribute("msg"); %>
                        <% } %>

                        <% if (session.getAttribute("msgSeg") != null) {%>
                        <div class="alert alert-success"><%=session.getAttribute("msgSeg")%>
                        </div>
                        <% session.removeAttribute("msgSeg"); %>
                        <% } %>
                    </center>
                </div>
            </div>
        </center>
        <br>
        <br>
        <br>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
                crossorigin="anonymous"></script>
    </body>

</html>
