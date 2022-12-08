<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.Estado" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.gigacontrol_g2.beans.ComentarIncidencia" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Incidencia incidencia = (Incidencia) request.getAttribute("incidencia");
    ArrayList<Estado> listaEstados = (ArrayList<Estado>) request.getAttribute("ListaEstados");
    ArrayList<ComentarIncidencia> listaComentarios = (ArrayList<ComentarIncidencia>) request.getAttribute("ListaComentarios");
    ArrayList<Integer> listaDestacados = (ArrayList<Integer>) request.getAttribute("listaDestacados");
    HashMap<Integer, Integer> numDestacados = (HashMap<Integer, Integer>) request.getAttribute("numDestacados");
%>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Ver Incidencia</title>
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
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/PerfilUsuario" style="color:#FFFFFF">Perfil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/ServletUsuario?action=listaMisIncidencias" style="color:#FFFFFF">Mis Incidencias</a>
                </li>
                <!-- <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/MisIncidencias" style="color:#FFFFFF">Mis Incidencias</a>
                </li> -->
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/NuevaIncidencia" style="color:#FFFFFF">Nueva Incidencia</a>
                </li>


            </ul>


            <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2"><b style="color:#211426"><%=userlogged.getNombre() + " " + userlogged.getApellido()%></b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                </div>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u style="color:#FFFFFF"> <b>Cerrar sesión> </b></u></a>
            </form>
        </div>
    </div>
</nav>


<br><br>

<!-- AQUIIIIIIIIII -->

<main class="container">
    <div class="row g-5">

        <div class="col-md-8">

            <div class="p-4 p-md-5 mb-4" style="background-color: #f7eeff">
                <div class="px-0">
                    <h1 class="display-4 fst-italic" style="color:#2C3166"><b><%=incidencia.getNombreDeIncidencia()%></b></h1>
                    <p style="color: #af0f14"><b>ESTADO: <%=incidencia.getEstado().getNombre()%></b></p>
                    <div class="row">
                        <div class="col-lg-3">
                            <!-- IMAGEN -->
                            <img src="resources/Images/userSeguridad.png" class="rounded mx-auto d-block " alt="userphoto" height="60rem" width="60rem">
                        </div>
                        <div class="col-lg-3">
                            <p style="color: #2C3166"><%=incidencia.getUsuario().getApellido()%>, <%=incidencia.getUsuario().getNombre()%></p>
                        </div>
                        <div class="col-lg-3">
                            <p style="color: #B1120D"><%=incidencia.getUsuario().getCodigo()%></p>
                        </div>
                        <div class="col-lg-3">
                            <p style="color: #6a727e"><%=incidencia.getUsuario().getCategoria()%></p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4">
                            <p><b style="color:#2C3166">Tipo de Incidencia: </b> <%=incidencia.getTipoDeIncidencia().getNombre()%></p>
                        </div>
                        <div class="col-lg-4">
                            <p style="color: #F0C00D">★Destacados</p>
                        </div>
                        <div class="col-lg-4">
                            <p style="color: #B1120D">👤 15</p>
                        </div>
                    </div>
                    <h6 style="color:#0a7437"> <b>Comentarios: </b></h6>
                    <h6><%=incidencia.getDescripcion()%></h6>
                    <h6 style="color:#274362"><b>Zona PUCP:</b> <%=incidencia.getZonaPucp()%></h6>
                    <div class="container py-4">
                        <div class="row align-item-md-strech">
                            <div class="col-md-6">
                                <h3>Foto Incidencia</h3>
                                <img src="<%=request.getContextPath()%>/ServletUsuario?action=listarimg&id=<%=incidencia.getIdIncidencia()%>" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="215rem" style="padding-left: 2rem;">
                            </div>
                            <div class="col-md-6">
                                <h3>Ubicación</h3>
                                <img src="https://img.freepik.com/vector-premium/mapa-punto-ubicacion-destino_34645-957.jpg?w=2000" class="rounded float-start img-fluid " alt="userphoto" height="200rem" width="200rem">
                                <center><button class="btn btn-outline-danger" type="button">Ubicación</button></center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-md-4">
            <div class="card" style="margin-left:20px">
                <h5 class="card-header">Comentarios de Incidencia</h5>
                <div class="card-body">
                    <ul>
                        <% for(ComentarIncidencia comentario : listaComentarios){ %>
                        <li class="card-text" >
                            <% if (comentario.getIdUsuario()==incidencia.getUsuario().getIdUsuario()){ %>
                            <h5 style="color:#000000"><%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%></h5>
                            <h6>"Usuario PUCP"</h6>
                            <% }
                            else{ %>
                            <h5><%=userlogged.getNombre()%> <%=userlogged.getApellido()%></h5>
                            <h6>"Personal de Seguridad"</h6>
                            <% } %>
                            <p><%=comentario.getComentarioIncidencia()%></p>
                            <h6>Fecha de Comentario:</h6>
                            <p><%=comentario.getFechaDeComentario()%></p>
                        </li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</main>


<!-- TERMINAAAA -->

<br>
<div class="d-flex justify-content-center">
    <!--<button type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color:#C91B1B">
        Guardar cambios
    </button> -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Se guardaron los Cambios</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="d-flex justify-content-center">
                        <h3 style="color:#399934">Cambios correctamente guardados</h3>
                        <img src="resources/Images/check-png.webp" class="rounded mx-auto d-block " alt="userphoto" height="37rem" width="50rem">
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="d-flex justify-content-center">
                        <a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletSeguridad" role="button" style="margin-left: 0.5rem; background-color: grey; border: none;">SALIR</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<br><br><br><br><br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>
