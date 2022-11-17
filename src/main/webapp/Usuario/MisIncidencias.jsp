<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>

<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Incidencia> listaDeIncidencias = (ArrayList<Incidencia>) request.getAttribute("ListaDeIncidencias");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Mis Incidencias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body style="background-image: url(resources/Images/background.jpg);
               background-repeat: no-repeat;
               background-position: center center;
               background-attachment: fixed;
               background-size: cover;" class="p-3 m-0 border-0 bd-example" >
<nav class="navbar navbar-expand-lg" style="background-color: #458BCA;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logopucp.png" alt="Logo" width="40" height="40" class="d-inline-block align-text-top"><b style="color:#FFFFFF"> GIGACONTROL</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/PerfilUsuario" style="color:#FFFFFF">Perfil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/NuevaIncidencia" style="color:#FFFFFF">Nueva Incidencia</a>
                </li>

            </ul>


            <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2"><b style="color:#1A3B85"><%=userlogged.getNombre()+userlogged.getApellido()%></b></a></li>
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
                    <table>
                        <tr>
                            <td><img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" class="rounded mx-auto d-block " alt="userphoto" height="60rem" width="60rem"></td>
                            <td style="padding-left: 2rem;"><p class="card-text"><b>ROJAS MEDINA, Sebastian </b>
                                <b style="color:#B1120D; padding-left: 2rem;">20203368</b>
                                <b style="color:#C0C4C7; padding-left: 2rem;">Estudiante </b></p></td>

                            <td>
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                                    <a href=<%=request.getContextPath()%>/EditarIncidencia class="btn btn-danger">Editar</a>
                                    <a href=<%=request.getContextPath()%>/VerIncidenciaUsuario class="btn btn-primary">Ver</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <table>
                        <tr>
                            <td><img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" class="rounded mx-auto d-block " alt="userphoto" height="60rem" width="60rem"></td>
                            <td style="padding-left: 2rem;"><p class="card-text"><b>ROJAS MEDINA, Sebastian </b>
                                <b style="color:#B1120D; padding-left: 2rem;">20203368</b>
                                <b style="color:#C0C4C7; padding-left: 2rem;">Estudiante </b></p></td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                                    <a href="editarIncidencias.html" class="btn btn-danger">Editar</a>
                                    <a href="verIncidencia.html" class="btn btn-primary">Ver</a>
                                </div>

                        </tr>
                    </table>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <table>
                        <tr>
                            <td><img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" class="rounded mx-auto d-block " alt="userphoto" height="60rem" width="60rem"></td>
                            <td style="padding-left: 2rem;"><p class="card-text"><b>ROJAS MEDINA, Sebastian </b>
                                <b style="color:#B1120D; padding-left: 2rem;">20203368</b>
                                <b style="color:#C0C4C7; padding-left: 2rem;">Estudiante </b></p></td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                                    <a href="editarIncidencias.html" class="btn btn-danger">Editar</a>
                                    <a href="verIncidencia.html" class="btn btn-primary">Ver</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <table>
                        <tr>
                            <td><img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" class="rounded mx-auto d-block " alt="userphoto" height="60rem" width="60rem"></td>
                            <td style="padding-left: 2rem;"><p class="card-text"><b>ROJAS MEDINA, Sebastian </b>
                                <b style="color:#B1120D; padding-left: 2rem;">20203368</b>
                                <b style="color:#C0C4C7; padding-left: 2rem;">Estudiante </b></p></td>

                            <td>
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                                    <a href="editarIncidencias.html" class="btn btn-danger">Editar</a>
                                    <a href="verIncidencia.html" class="btn btn-primary">Ver</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <table>
                        <tr>
                            <td><img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" class="rounded mx-auto d-block " alt="userphoto" height="60rem" width="60rem"></td>
                            <td style="padding-left: 2rem;"><p class="card-text"><b>ROJAS MEDINA, Sebastian </b>
                                <b style="color:#B1120D; padding-left: 2rem;">20203368</b>
                                <b style="color:#C0C4C7; padding-left: 2rem;">Estudiante </b></p></td>

                            <td>
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                                    <a href="editarIncidencias.html" class="btn btn-danger">Editar</a>
                                    <a href="verIncidencia.html" class="btn btn-primary">Ver</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <table>
                        <tr>
                            <td><img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" class="rounded mx-auto d-block " alt="userphoto" height="60rem" width="60rem"></td>
                            <td style="padding-left: 2rem;"><p class="card-text"><b>ROJAS MEDINA, Sebastian </b>
                                <b style="color:#B1120D; padding-left: 2rem;">20203368</b>
                                <b style="color:#C0C4C7; padding-left: 2rem;">Estudiante </b></p></td>

                            <td>
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                                    <a href="editarIncidencias.html" class="btn btn-danger">Editar</a>
                                    <a href="verIncidencia.html" class="btn btn-primary">Ver</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
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