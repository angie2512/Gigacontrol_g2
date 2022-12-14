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
    <link rel="stylesheet" type="text/css" href="estilos.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Ver Incidencia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script>
        let map;
        let marker;
        function initMap(){
            const coord = {lat:-12.0680766 ,lng: -77.0794255};
            map = new google.maps.Map(document.getElementById('map'),{
                zoom: 17,
                center: coord
            });
            marker = new google.maps.Marker({
                position: coord,
                map: map
            });
            marker.setPosition(coord);
        }
        window.initMap = initMap;
    </script>
    <style type="text/css">
        #map{
            height: 100%;
        }
        html,
        #map-container{
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <style>
        body {
            background: url("resources/Images/FONDOclaro.png");
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            height: 100vh;
            bgcolor: "#800000";
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

    <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYO577C0s-mTgU94RJbr7HZ6sTL41Uobg&callback=initMap&v=weekly"></script>
</head>
<body>
<br>
<nav class="navbar navbar-expand-lg" style="background-color: #4C9978;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" ><img src="resources/Images/logo_blanco.png" alt="Logo" width="100" height="40" class="d-inline-block align-text-top img-fluid"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath()%>/ServletSeguridad" aria-current="page" style="color:#FFFFFF">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath()%>/ServletSeguridad?action=perfil" aria-current="page" style="color:#FFFFFF">Perfil</a>
                </li>
            </ul>

            <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                <li><a class="nav-link px-2"><b style="color:white"><%=userlogged.getNombre()%> <%=userlogged.getApellido()%></b></a></li>
                <div class="dropdown text-end">
                    <a class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="<%=userlogged.getFotoPerfil()==null?"resources/Images/userSeguridad.png":(request.getContextPath()+"/ServletSeguridad?action=mostrarFoto")%>"
                             class="rounded mx-auto d-block " alt="mdo" width="32" height="32"
                             class="rounded-circle">
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

<!-- AQUI EMPIEZA -->
<!-- <main class="container">
    <div class="row mb-2">
            <div class="col-md-8">
                <div class="p-4 p-md-5 mb-4" style="background-color: white">
                    <div class="px-0">
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
                                <br> -->

                                <!-- <table style="display:flex; justify-content: space-around">
                                    <tr>
                                        <td><h6 class="card-text" style="color:#B1120D"><b>ESTADO: <%=incidencia.getEstado().getNombre()%></b></h6>
                                        </td>
                                        <td></td>
                                        <td style="background-color:#DAD9BA"><h6>Nivel de urgencia: <b><%=incidencia.getNivelDeUrgencia().getNombre()%></b></h6> </td>
                                        <td>
                                            <form id="myform" method="post" action="<%=request.getContextPath()%>/ServletSeguridad?action=actualizarIncidencia">
                                            <div class="btn btn-primary" >
                                                    <select class="form-select" id="estado" name="estado" required>
                                                        <option value="<%=incidencia.getEstado().getIdEstado()%>" selected>Actualizar Estado</option>
                                                        <option value="<%=listaEstados.get(2).getIdEstado()%>"><%=listaEstados.get(2).getNombre()%>
                                                        </option>
                                                        <option value="<%=listaEstados.get(3).getIdEstado()%>"><%=listaEstados.get(3).getNombre()%>
                                                        </option>
                                                    </select>
                                            </div>
                                            </form>
                                        </td>
                                    </tr>
                                </table> -->
                              <!--  <div style="display:flex ; justify-items: auto; padding-bottom:5px;">
                                    <h6 class="card-text" style="color:#B1120D"><b>ESTADO: <%=incidencia.getEstado().getNombre()%></b></h6>
                                    <b style="color:darkblue;padding-left: 110px;">Nivel de Urgencia: <%=incidencia.getNivelDeUrgencia().getNombre()%></b>
                                    <form id="myform" method="post" action="<%=request.getContextPath()%>/ServletSeguridad?action=actualizarIncidencia">
                                        <div class="btn btn-primary" style="margin-left:110px">
                                            <select class="form-select" id="estado" name="estado" required>
                                                <option value="<%=incidencia.getEstado().getIdEstado()%>" selected>Actualizar Estado</option>
                                                <option value="<%=listaEstados.get(2).getIdEstado()%>"><%=listaEstados.get(2).getNombre()%>
                                                </option>
                                                <option value="<%=listaEstados.get(3).getIdEstado()%>"><%=listaEstados.get(3).getNombre()%>
                                                </option>
                                            </select>
                                        </div>
                                    </form>
                                </div>

                                <br> -->
                                <!--  style="display: flex ; justify-content: space-evenly" -->
                               <!-- <div style="display:flex ; justify-items: auto; padding-bottom:5px;">
                                    <b><%=incidencia.getUsuario().getCategoria()%>: <%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%> </b>
                                    <b style="color:#B1120D;padding-left: 2rem;">C??digo: <%=incidencia.getUsuario().getCodigo()%></b>
                                    <b style="color:#B1120D;margin-left:180px;">Redacte su Comentario Aqui:</b>
                                </div> -->

                                 <!--
                                <table>
                                    <tr style="display: flex ; justify-content: space-evenly">

                                        <td style="padding-left: 2rem; color:#2C3166">
                                            <b>< %=incidencia.getUsuario().getApellido()%>, < %=incidencia.getUsuario().getNombre()%> </b>
                                            <b style="color:#B1120D; padding-left: 2rem;">< %=incidencia.getUsuario().getCodigo()%></b>
                                            <b style="color:#C0C4C7; padding-left: 2rem;">< %=incidencia.getUsuario().getCategoria()%></b>
                                            <b style="color:#B1120D;">Redacte su Comentario Aqui:</b>

                                        </td>

                                    </tr>

                                </table> -->
                               <!-- <br>

                                <div style="display:flex ; justify-items: auto; padding-bottom:10px;" >
                                    <div>

                                        <div>
                                            <div class="row">


                                                <div class="col-6">
                                                    <b style="color:#B1120D;">Zona PUCP:</b>
                                                </div>

                                                <div class="col-6">
                                                    <b style="color:#B1120D;">Ubicaci??n:</b>
                                                </div>


                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-6">
                                                    <h6><%=incidencia.getDescripcion()%></h6>
                                                </div>
                                                <div class="col-6">
                                                    <h6><%=incidencia.getZonaPucp()%></h6>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <table style="display:flex ; justify-items: center">
                                            <tr>
                                                <td style="padding-left: 0rem; color:#2C3166"><p class="card-text"><b>Tipo de Incidencia: </b> <%=incidencia.getTipoDeIncidencia().getNombre()%></p> -->
                                                    <!--<b style="color:#F0C00D; padding-left: 8rem;">??? Destacados</b>
                                                    <b style="padding-left: 3rem;">???? 15 </b></p> --></td>
                                         <!--   </tr>

                                        </table>
                                        <br>
                                        <div>
                                            <div class="row">
                                                <div class="col-6"><p style="padding-left: 2rem;color:#274362"><b> Foto de Incidencia </b></p>
                                                </div>

                                                <div class="col-6">
                                                    <p style="padding-left: 4rem;color:#274362"><b> Ubicaci??n:</b></p> -->
                                                    <!-- (Haga Click en las 2 rayitas encima del Mu??eco Amarillo Para Agrandar el Mapa) -->
                                                <!-- </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-6">
                                                    <img src="<%=request.getContextPath()%>/ServletUsuario?action=listarimg&id=<%=incidencia.getIdIncidencia()%>" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="215rem" style="padding-left: 2rem;">
                                                </div>

                                                <div class="col-6">
                                                    <div id="map-container">
                                                        <div id="map"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <form method="post" action="< %=request.getContextPath()%>/ServletSeguridad?action=guardarComentario">
                                    <div style="margin-left:40px">
                                        <input form="myform" type="hidden" name="idIncidencia" value="<%=incidencia.getIdIncidencia()%>">
                                        <div class="form-floating"> -->
                                            <!--<input form="myform" style="height:424px;width:260px" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="resolucionIncidencia" > -->
                                            <!-- <textarea name="resolucionIncidencia" form="myform" style="height:424px;width:260px" class="form-control"></textarea> -->
                                            <!--<label for="floatingTextarea2">Redacte su Comentario Aqu??...</label> -->
                                       <!-- </div>
                                        <button style="margin-left:50px;margin-top:10px" form="myform" type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color:darkred">
                                            Guardar Cambios
                                        </button>
                                    </div>
                                    </form>
                                </div>
                                <br>
                            </div>
                        <br>
                    </div>
                </div>
            </div> -->
                <!-- INICIO COMENTARIOS  -->
              <!--  <div class="col-md-4">
                    <div class="card" style="margin-left:20px">
                        <h5 class="card-header">Comentarios de Incidencia</h5>
                        <div class="card-body" style="overflow: auto">
                            <ul>
                                <% for(ComentarIncidencia comentario : listaComentarios){ %>
                                <li class="card-text" >
                                    <% if (comentario.getUsuario().getIdUsuario()==incidencia.getUsuario().getIdUsuario()){ %>
                                    <h5><%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%></h5>
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
                </div> -->
                <!-- FIN INICIO COMENTARIOS  -->


   <!-- </div>
</main>

<br> -->

<!-- CUADROSSSS -->

<main class="container">

    <div class="row mb-2">
        <div class="col-md-8">
            <div class="p-4 p-md-5 mb-4" style="background-color: white">
                <div class="px-0">
                    <h1 class="card-text"><b style="color:#2C3166"><%=incidencia.getNombreDeIncidencia()%></b></h1>
                    <h6 class="card-text" style="color:#B1120D"><b>ESTADO: <%=incidencia.getEstado().getNombre()%></b></h6>

                    <br>
                    <!-- ESTADO, NIVEL DE URGENCIA, ACTUALIZAR -->
                    <div class="row">
                        <div class="col-lg-3">

                            <img src="<%=request.getContextPath()%>/ServletUsuario?action=listarimg&id=<%=incidencia.getIdIncidencia()%>" class="rounded mx-auto d-block img-fluid" alt="userphoto" style="width: 240px">
                        </div>
                        <div class="col-lg-3">
                            <h6 style="color: #0b2479"> <b><%=incidencia.getUsuario().getNombre()%>,</b> <%=incidencia.getUsuario().getApellido()%> </h6>
                            <p style="color: #030c2c"> <b><%=incidencia.getUsuario().getCategoria()%></b></p>
                        </div>
                        <div class="col-lg-3">
                            <h6 style="color:#276706"><b style="color:#276706">C??digo:</b><%= incidencia.getUsuario().getCodigo()%></h6>
                        </div>
                        <div class="col-lg-3">
                            <form id="myform" method="post" action="<%=request.getContextPath()%>/ServletSeguridad?action=actualizarIncidencia">
                                    <select class="form-select" id="estado" name="estado" required>
                                        <option value="<%=incidencia.getEstado().getIdEstado()%>" selected>Actualizar Estado</option>
                                        <option value="<%=listaEstados.get(2).getIdEstado()%>"><%=listaEstados.get(2).getNombre()%>
                                        </option>
                                        <option value="<%=listaEstados.get(3).getIdEstado()%>"><%=listaEstados.get(3).getNombre()%>
                                        </option>
                                    </select>
                            </form>
                        </div>
                    </div>
                    <!-- FIN ESTADO, NIVEL DE URGENCIA, ACTUALIZAR -->
                    <br>
                    <br>
                    <!-- NIVEL DE URGENCIA,  ZONA PUCP, UBIICACION, UBICACION-->
                    <div class="row">
                        <div class="col-lg-3">
                            <h6><b style="color:#0b2479;">Nivel de Urgencia:</b></h6>
                            <p><%=incidencia.getNivelDeUrgencia().getNombre()%></p>
                        </div>
                        <div class="col-lg-3">
                            <h6><b style="color:#0b2479">Descripci??n: </b></h6>
                            <p><%=incidencia.getDescripcion()%></p>
                        </div>
                        <div class="col-lg-3">
                            <h6><b style="color:#0b2479">Zona PUCP: </b></h6>
                            <p><%=incidencia.getZonaPucp()%></p>
                        </div>
                        <div class="col-lg-3">
                            <h6><b style="color:#0b2479">Ubicaci??n: </b></h6>
                            <div id="map-container">
                                <div id="map"></div>
                            </div>
                        </div>
                    </div>
                    <!-- FIN NIVEL DE URGENCIA,  ZONA PUCP, UBIICACION, UBICACION-->

                    <!-- TIPO INCIDENCIA, REDACTAR INCIDENCIA, TEXT AREA -->
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-lg-4">
                            <p class="card-text"><b style="color:#274362">Tipo de Incidencia: </b> <%=incidencia.getTipoDeIncidencia().getNombre()%></p>
                        </div>
                        <div class="col-lg-2">
                            <p style="color:#732c2c"><b>Redacte su comentario:</b></p>
                        </div>
                        <div class="col-lg-6">
                            <form method="post" action="< %=request.getContextPath()%>/ServletSeguridad?action=guardarComentario">
                                <div style="margin-left:40px">
                                    <input form="myform" type="hidden" name="idIncidencia" value="<%=incidencia.getIdIncidencia()%>">
                                    <div class="form-floating">
                                        <!--<input form="myform" style="height:424px;width:260px" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="resolucionIncidencia" > -->
                                        <textarea name="resolucionIncidencia" form="myform"  class="form-control" style="height: 150px"></textarea>
                                        <!--<label for="floatingTextarea2">Redacte su Comentario Aqu??...</label> -->
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- FIN TIPO INCIDENCIA, REDACTAR INCIDENCIA, TEXT AREA -->
                </div>
               <center> <button style="margin-left:50px;margin-top:10px" form="myform" type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color:darkred">
                    Guardar Cambios
            </button> </center>
            </div>
        </div>
        <div class="col-md-4">
                <div class="card" style="margin-left:20px">
                    <h5 class="card-header">Comentarios de Incidencia</h5>
                    <div class="card-body" style="overflow: auto">
                        <ul>
                            <% for(ComentarIncidencia comentario : listaComentarios){ %>
                            <li class="card-text" >
                                <% if (comentario.getUsuario().getIdUsuario()==incidencia.getUsuario().getIdUsuario()){ %>
                                <h5><%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%></h5>
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


<!-- FIN CUADROSSSS -->

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
                        <a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletSeguridad?action=listarIncidencia" role="button" style="margin-left: 0.5rem; background-color: grey; border: none;">SALIR</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<br><br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
    $( document ).ready(function() {
        initMap();
    });
</script>
</body>
</html>
