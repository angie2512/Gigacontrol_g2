<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.Estado" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.gigacontrol_g2.beans.ComentarIncidencia" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Incidencia incidencia = (Incidencia) request.getAttribute("incidencia");
    ArrayList<Estado> listaEstados = (ArrayList<Estado>) request.getAttribute("ListaEstados");
    ArrayList<ComentarIncidencia> listaComentarios = (ArrayList<ComentarIncidencia>) request.getAttribute("ListaComentarios");
    ArrayList<Integer> listaDestacados = (ArrayList<Integer>) request.getAttribute("listaDestacados");
    HashMap<Integer, Integer> numDestacados = (HashMap<Integer, Integer>) request.getAttribute("numDestacados");
    BUsuarios u = (BUsuarios) session.getAttribute("userlogged");

%>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Ver Mis Incidencia</title>
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
<p></p>
<nav class="navbar navbar-expand-lg" style="background-color: #5f6694;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logo_blanco.png" alt="Logo" width="100"
                                              height="40" class="d-inline-block align-text-top img-fluid"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/ServletUsuario" style="color:#FFFFFF">Inicio</a>
                </li>

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
                <li><a href="#" class="nav-link px-2"><b
                        style="color:#211426"><%=userlogged.getNombre() + " " + userlogged.getApellido()%>
                </b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="<%=u.getFotoPerfil()==null?"resources/Images/userSeguridad.png":(request.getContextPath()+"/ServletSeguridad?action=mostrarFoto")%>"
                             class="rounded mx-auto d-block " alt="mdo" width="32" height="32"
                             class="rounded-circle">
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

<!-- AQUIIIIIIIIII -->

<main class="container">
    <div class="row mb-2">

        <div class="col-md-8">

            <div class="p-4 p-md-5 mb-4" style="background-color: white">
                <div class="px-0">
                    <!-- nombre de la card -->
                    <h1 class="card-text" style="color:#2C3166"><b><%=incidencia.getNombreDeIncidencia()%></b></h1>
                    <p style="color: #af0f14"><b>ESTADO: <%=incidencia.getEstado().getNombre()%></b></p>
                    <br>
                    <!-- IMAGEN, NOMBRE, CODIGO, USUARIO -->
                    <div class="row">
                        <div class="col-lg-3">
                            <!-- IMAGEN -->
                            <img src="<%=request.getContextPath()%>/ServletUsuario?action=listarimgPerfil&idp=<%=incidencia.getUsuario().getIdUsuario()%>" class="rounded mx-auto d-block img-fluid" alt="userphoto" style="width: 140px">
                        </div>
                        <div class="col-lg-3">
                            <h5 style="color: #2C3166"><b><%=incidencia.getUsuario().getApellido()%>,</b> <%=incidencia.getUsuario().getNombre()%></h5>
                        </div>
                        <div class="col-lg-3">
                            <h6 style="color: #B1120D"><b><%=incidencia.getUsuario().getCodigo()%> </b></h6>
                        </div>
                        <div class="col-lg-3">
                            <p style="color: #6a727e"><%=incidencia.getUsuario().getCategoria()%></p>
                        </div>
                    </div>

                    <!-- FIN IMAGEN, NOMBRE, CODIGO, USUARIO -->
                    <br><p></p>
                    <!-- TIPO, ESTADO, PERSNA, DESTACADO -->
                    <div class="row">
                        <div class="col-lg-3">
                            <h6><b style="color:#2C3166">Tipo de Incidencia: </b> <%=incidencia.getTipoDeIncidencia().getNombre()%></h6>
                        </div>
                       <!-- <div class="col-lg-3">
                            <% if (numDestacados.get(incidencia.getIdIncidencia()) != null) {%>
                            <div class="p-2"><b
                                    style="color:#DCBA38 ">Estado:<%=incidencia.getEstado().getNombre()%>
                            </b></div>
                            <div class="p-2">
                                <b>👤 <%=numDestacados.get(incidencia.getIdIncidencia())%>
                                </b></div>
                            <%} else {%>
                            <div class="p-2"><b>👤 0</b></div>
                            <%}%>
                            <%if (listaDestacados.contains(incidencia.getIdIncidencia())) { %>
                            <div class="p-2">
                                <a href="<%=request.getContextPath()%>/ServletUsuario?action=quitardestacadoIncVer&idi=<%=incidencia.getIdIncidencia()%>"
                                   style="color:#F0C00D">★ Destacar</a>
                            </div>
                            <% } else { %>
                            <div class="p-2">
                                <a href="<%=request.getContextPath()%>/ServletUsuario?action=destacarIncVer&idi=<%=incidencia.getIdIncidencia()%>"
                                   style="color:rgba(93,131,196,0.38)">★Destacar</a>
                            </div>
                            <%}%>
                        </div> -->
                        <div class="col-lg-3">
                            <% if (numDestacados.get(incidencia.getIdIncidencia()) != null) {%>
                            <div class="p-2"><b
                                    style="color:#dc8238 ">Estado:</b> <b style="color:#cc6540 "><%=incidencia.getEstado().getNombre()%> </b></h5>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="p-2">
                                <b>👤 <%=numDestacados.get(incidencia.getIdIncidencia())%>
                                </b></div>
                            <%} else {%>
                            <div class="p-2"><b>👤 0</b></div>
                            <%}%>
                        </div>

                        <div class="col-lg-3">
                            <%if (listaDestacados.contains(incidencia.getIdIncidencia())) { %>
                            <div class="col-lg-3">
                                <a href="<%=request.getContextPath()%>/ServletUsuario?action=quitardestacadoIncVerMis&idi=<%=incidencia.getIdIncidencia()%>"
                                   style="color:#F0C00D"><b>★Destacar</b></a>
                            </div>
                            <% } else { %>
                            <div class="col-lg-3">
                                <a href="<%=request.getContextPath()%>/ServletUsuario?action=destacarIncVerMis&idi=<%=incidencia.getIdIncidencia()%>"
                                   style="color:rgba(93,131,196,0.38)"><b>★Destacar</b></a>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <!-- FIN TIPO, ESTADO, PERSNA, DESTACADO -->
                    <br>
                    <h6 style="color:#0a7437"> <b> Descripción: </b></h6>
                    <p><%=incidencia.getDescripcion()%></p>
                    <h6 style="color:#274362"><b>Zona PUCP:</b> <%=incidencia.getZonaPucp()%></h6>
                    <!-- FOTO DE LA INCIDENCIA Y UBIICACION -->
                    <div class="container py-4">
                        <div class="row align-item-md-strech">
                            <div class="col-md-6">
                                <h5>Foto Incidencia</h5>
                                <img src="<%=request.getContextPath()%>/ServletUsuario?action=listarimg&id=<%=incidencia.getIdIncidencia()%>" class="rounded mx-auto d-block img-fluid" alt="userphoto" height="300rem" width="315rem" style="padding-left: 2rem;">
                            </div>
                                <div class="col-6">
                                    <h5>Ubicación</h5>
                                    <div id="map-container">
                                        <div id="map"></div>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <!-- FIN FOTO DE LA INCIDENCIA Y UBIICACION -->
                </div>
            </div>

        </div>

        <div class="col-md-4">
            <div class="card" style="margin-left:20px">
                <h5 class="card-header">Comentarios Incidencia</h5>
                <div class="card-body" style="height: 500px; overflow: auto">
                    <ul>
                        <% for(ComentarIncidencia comentario : listaComentarios){ %>
                        <li class="card-text" >
                            <% if (comentario.getUsuario().getIdUsuario()==incidencia.getUsuario().getIdUsuario()){ %>
                            <h5 style="color:#000000"><%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%></h5>
                            <h6>"Usuario PUCP"</h6>
                            <% }
                            else{ %>
                            <h5><%=comentario.getUsuario().getNombre()%> <%=comentario.getUsuario().getApellido()%></h5>
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

<br><br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
    $( document ).ready(function() {
        initMap();
    });
</script>
<br>
<a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletUsuario" role="button"
   style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
<br><br>
</body>
</html>
