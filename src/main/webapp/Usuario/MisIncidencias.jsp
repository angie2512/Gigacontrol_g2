<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.TipoDeIncidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.Estado" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Incidencia> IncidenciasUsuario = (ArrayList<Incidencia>) request.getAttribute("ListaDeIncidenciasDelUsuario");
    ArrayList<Incidencia> IncidenciasDestacadas = (ArrayList<Incidencia>) request.getAttribute("ListaDeIncidenciasDestacadas");
%>

<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Mis Incidencias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <style>
        body {
            background: url("https://ambientesdigital.com/wp-content/uploads/2017/07/10-biblioteca-ciencias-ingenieria-arquitectura-pucp-foto-juan-solano-ojasi.jpg");
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            height: 100vh;
            bgcolor: "#800000";
        }
    </style>
</head>
<body>
<p></p>
<nav class="navbar navbar-expand-lg" style="background-color: #5f6694;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logopucp.png" alt="Logo" width="40" height="40" class="d-inline-block align-text-top"><b style="color:#FFFFFF"> GIGACONTROL</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/InicioUsuario" style="color:#FFFFFF">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/PerfilUsuario" style="color:#FFFFFF">Perfil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/NuevaIncidencia" style="color:#FFFFFF">Nueva Incidencia</a>
                </li>

            </ul>


            <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2"><b style="color:#211426"><%=userlogged.getNombre() + userlogged.getApellido()%></b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                </div>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u
                        style="color:#FFFFFF"><b>Cerrar sesion > </b></u></a>
            </form>
        </div>
    </div>
</nav>
<br><br>
<div class="d-flex justify-content-center">
    <div class="card">
        <div class="card-body">
            <div class="p-7 mb-2 bg-primary text-white" style="--bs-bg-opacity: .5;">
                <h4 style="text-align: center; color: white; font-family:'Times New Roman', Times, serif">MIS INCIDENCIAS</h4>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col"><center> Incidencia </center></th>
                            <th scope="col"><center> Tipo de Incidencia </center></th>
                            <th scope="col"><center> Estado </center></th>
                            <th scope="col"><center> Opciones </center></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(Incidencia incidencia : IncidenciasUsuario) { %>
                        <tr>
                            <td> <center> <%= incidencia.getNombreDeIncidencia() %> </center> </td>
                            <td> <center> <%= incidencia.getTipoDeIncidencia().getNombre() %> </center></td>
                            <td> <center><%= incidencia.getEstado().getNombre() %> </center></td>
                            <td> <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                <a href=<%=request.getContextPath()%>/VerIncidenciaUsuario class="btn btn-primary">Ver Mas</a>
                            </div></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
        </div>
    </div>
</div>
<br>
<div class="d-flex justify-content-center">
    <div class="card">
        <div class="card-body">
            <div class="p-7 mb-2 bg-primary text-white" style="--bs-bg-opacity: .5;">
                <h4 style="text-align: center; color: white; font-family:'Times New Roman', Times, serif">MIS INCIDENCIAS DESTACADAS</h4>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col"><center> Incidencia </center></th>
                            <th scope="col"><center> Usuario </center></th>
                            <th scope="col"><center> Tipo de Incidencia </center></th>
                            <th scope="col"><center> Estado </center></th>
                            <th scope="col"><center> Opciones </center></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(Incidencia incidencia : IncidenciasDestacadas) { %>
                        <tr>
                            <td><center> <%= incidencia.getNombreDeIncidencia() %></center></td>
                            <td><center> <%= incidencia.getUsuario().getNombre() %> <%=incidencia.getUsuario().getApellido()%> </center></td>
                            <td> <center><%= incidencia.getTipoDeIncidencia().getNombre() %> </center></td>
                            <td><center> <%= incidencia.getEstado().getNombre() %> </center></td>
                            <td><div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                <a href=<%=request.getContextPath()%>/VerIncidenciaUsuario class="btn btn-primary">Ver Mas</a>
                            </div></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
        </div>
    </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<br>
<a class="btn btn-primary" href="<%=request.getContextPath()%>/InicioUsuario" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
<br><br>
</body>

</html>