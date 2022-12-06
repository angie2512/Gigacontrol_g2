<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.Estado" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.gigacontrol_g2.beans.ComentarIncidencia" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Incidencia incidencia = (Incidencia) request.getAttribute("incidencia");
    ArrayList<Estado> listaEstados = (ArrayList<Estado>) request.getAttribute("ListaEstados");
    ArrayList<ComentarIncidencia> listaComentarios = (ArrayList<ComentarIncidencia>) request.getAttribute("ListaComentarios");
%>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Ver Mas Incidencias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <style>
        body {
            background-image: url(resources/Images/background.jpg);
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            background-size: cover;" class="p-3 m-0 border-0 bd-example"
        }
    </style>
</head>
<body >
<nav class="navbar navbar-expand-lg" style="background-color: #458BCA;" aria-label="Eighth navbar example">
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
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/MisIncidencias" style="color:#FFFFFF">Mis Incidencias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/NuevaIncidencia" style="color:#FFFFFF">Mis Incidencias</a>
                </li>
            </ul>

            <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2"><b style="color:#1A3B85"><%=userlogged.getNombre() + " " + userlogged.getApellido()%></b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                </div>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u
                        style="color:#000000"><b>Cerrar sesion > </b></u></a>
            </form>
        </div>
    </div>
</nav>
<br><br>
<div style="display:flex; justify-content:space-around">
    <div style="display:flex; justify-content:space-around">
        <div class="card">
            <div class="card-body">
                <div class="card" style="width:850px">
                    <div class="card-body">
                        <table style="display: flex; justify-items:auto">
                            <tbody>
                            <tr>
                                <td>
                                    <h2 class="card-text"><b style="color:#2C3166"><%=incidencia.getNombreDeIncidencia()%></b></h2>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <br>
                        <table style="display:flex; justify-items: center">
                            <tr>
                                <td><h6 class="card-text" style="color:#B1120D;padding-right: 5rem;margin-right:40px"><b>ESTADO: <%=incidencia.getEstado().getNombre()%></b></h6>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        <br>
                        <table style="display:flex ; justify-items: center">
                            <tr style="justify-items: center">
                                <td><img src="resources/Images/userSeguridad.png" class="rounded mx-auto d-block " alt="userphoto" height="60rem" width="60rem"></td>
                                <td style="padding-left: 2rem; color:#2C3166"><p class="card-text"><b><%=incidencia.getUsuario().getApellido()%>, <%=incidencia.getUsuario().getNombre()%> </b>
                                    <b style="color:#B1120D; padding-left: 2rem;"><%=incidencia.getUsuario().getCodigo()%></b>
                                    <b style="color:#C0C4C7; padding-left: 2rem;"><%=incidencia.getUsuario().getCategoria()%></b></p>
                                </td>
                            </tr>

                        </table>
                        <br>
                        <div style="display:flex ; justify-items: auto">
                            <div>
                                <table style="display:flex ; justify-items: center">
                                    <tr>
                                        <td style="padding-left: 0rem; color:#2C3166"><p class="card-text"><b>Tipo de Incidencia: </b> <%=incidencia.getTipoDeIncidencia().getNombre()%>
                                            <b style="color:#F0C00D; padding-left: 8rem;">★ Destacados</b>
                                            <b style="padding-left: 3rem;">👤 15 </b></p></td>
                                    </tr>

                                </table>
                                <br>
                                <table>
                                    <tr>
                                        <td>
                                            <h6><%=incidencia.getDescripcion()%></h6>
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <table>
                                    <tr><td><h6 style="color:#274362"><b>Zona PUCP:</b> <%=incidencia.getZonaPucp()%></h6></td></tr>
                                </table>
                                <br>
                                <table>
                                    <tr>
                                        <td>
                                            <p style="padding-left: 2rem;color:#274362"><b> Foto de Incidencia </b></p>
                                        </td>
                                        <td>
                                            <p style="padding-left: 4rem;color:#274362"><b> Ubicación:</b></p>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-warning" style="margin-left:5px;margin-bottom:10px">Haga Click Aquí</button>
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td>
                                            <img src="https://files.pucp.education/puntoedu/wp-content/uploads/2021/02/23074448/espacios-de-estudio-005-5000x3333.jpg" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="200rem" style="padding-left: 2rem;">

                                        </td>
                                        <td>
                                            <img src="https://img.freepik.com/vector-premium/mapa-punto-ubicacion-destino_34645-957.jpg?w=2000" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="200rem"style="padding-left: 2rem;">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <!-- <form method="post" action="< %=request.getContextPath()%>/ServletSeguridad?action=guardarComentario"> -->
                            </form>
                        </div>
                        <br>

                        <!--<table>
                            <br>
                            <div class="card">
                                <h5 class="card-header">Comentario Actual del Usuario</h5>
                                <div class="card-body">
                                    <p class="card-text">Ok conforme</p>
                                </div>
                            </div>
                            <br>

                            <div class="accordion" id="accordionExample" height="200rem" width="200rem">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Comentarios Anteriores
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <ol>
                                                <li>
                                                    <p>No estoy de acuerdo</p>
                                                </li>
                                                <li>
                                                    <p>Aun no estoy de acuerdo</p>
                                                </li>
                                                <li>
                                                    <p>Tampoco estoy de acuerdo</p>
                                                </li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </table> -->
                    </div>
                </div>
                <br>

            </div>
        </div>
        <div class="card" style="width:350px;margin-left:20px">
            <h5 class="card-header">Comentarios de Incidencia</h5>
            <div class="card-body">
                <ul>
                    <% for(ComentarIncidencia comentario : listaComentarios){ %>
                    <li class="card-text" >
                        <% if (comentario.getIdUsuario()==incidencia.getUsuario().getIdUsuario()){ %>
                        <h5 style="color:"><%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%></h5>
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
