<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.TipoDeIncidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.NivelDeUrgencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session"
             class="com.example.gigacontrol_g2.beans.BUsuarios"/>

<jsp:useBean id="listaIncidencias" scope="request" type="java.util.ArrayList<com.example.gigacontrol_g2.beans.BUsuarios>"/>


<!--Con "userlogged" en teoria podemos imprimir el nombre y apellido del usuario seguridad" -->
<%
    String searchText = (String) request.getAttribute("searchText");
    ArrayList<Incidencia> listaDeIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
    ArrayList<Integer> listaDestacados = (ArrayList<Integer>) request.getAttribute("listaDestacados");
    HashMap<Integer, Integer> numDestacados = (HashMap<Integer, Integer>) request.getAttribute("numDestacados");
%>


<%
    int maxPag2 = (int) request.getAttribute("maxPag2");
    int regMin = (int) request.getAttribute("regMin");
    int regMax = (int) request.getAttribute("regMax");
    int valor_pagina = (int) request.getAttribute("valor_pagina");
%>

<!doctype html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Inicio</title>
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

        p {
            font-family: Decor;
        }

        .btn-1 {
            display: inline-block;
            background: #00000010;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 25px;
            color: #FFFFFF;
            border-radius: 5px;
            border-color: #FFFFFF;
        }

        @media (min-width: 768px) {
            .btn-1 {
                padding: 10px 35px;
                background-color: #00000010;
            }
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body>
<br>
<nav class="navbar navbar-expand-lg" style="background-color: #4C9978;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logo_blanco.png" alt="Logo" width="100" height="40" class="d-inline-block align-text-top img-fluid"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath()%>/ServletSeguridad"
                       aria-current="page" style="color:#FFFFFF">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active"
                       href="<%=request.getContextPath()%>/ServletSeguridad?action=perfil" aria-current="page"
                       style="color:#FFFFFF">Perfil</a>
                </li>
            </ul>

            <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2"><b
                        style="color:white"><%=userlogged.getNombre()%>  <%=userlogged.getApellido()%>
                </b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="<%=userlogged.getFotoPerfil()==null?"resources/Images/userSeguridad.png":(request.getContextPath()+"/ServletSeguridad?action=mostrarFoto")%>"
                             class="rounded mx-auto d-block " alt="mdo" width="32" height="32"
                             class="rounded-circle">
                    </a>
                </div>
            </ul>
        </div>
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
            <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u
                    style="color:#FFFFFF"><b>Cerrar sesion > </b></u></a>
        </form>
    </div>
</nav>

<br>

<center>

            <div class="container-xxl bd-gutter mt-3 my-md-4 bd-layout; overflow-auto">
                <main class="bd-main order-1;overflow-auto" style="width: 820px; background-color: rgba(255,255,255,0)">
                    <div class="my-3 p-3 bg-body rounded shadow-sm position-relative"
                         style="width: 820px; background-color: #8CC67A;">
                        <h4 class="border-bottom pb-2 mb-2" style="background-color:#6FCE92;color:#18542E;">
                            <center><b style="font-family: 'Trebuchet MS',Helvetica, sans-serif;">INCIDENCIAS REPORTADAS</b></center>
                        </h4>
                        <p></p>

                <div class="card" style="margin-top:10px">
                    <div class="card-body">
                        <!--<div class="d-flex position-relative">
                          <img src="https://elcomercio.pe/resizer/hE0dXgCo-KfAjkgGRXLIlDayLYo=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/JRZOEF5WCRCCPO32AV7OYXXNCU.jpg" class="flex-shrink-0 me-3" alt="..." width="140" height="140">
                          <div> -->

                        <!--      <form class="d-flex" role="search" method="post"
                                    action="< %=request.getContextPath()%>/ServletSeguridad?action=buscarIncidencia">
                                  <input class="form-control me-2" type="search" name="searchText" placeholder="Buscar"
                                         aria-label="Buscar">
                                  <button class="btn btn-outline-primary" type="submit">Buscar</button>
                              </form> -->

                        <form class="row gx-3 gy-2 align-items-center" method="post" id="views-exposed-form-dkan-datasets-panel-pane-1"
                              accept-charset="UTF-8" role="form"
                              action="<%=request.getContextPath()%>/ServletSeguridad?action=buscarIncidencia">
                            <div class="col-sm-6">
                                <label for="edit-sort-by" class="card-text" style="color:#264587; font-size: x-small"><h6>Buscar incidencia</h6></label>
                                <input class="form-control me-2" type="search" name="searchText" placeholder="Ingrese el Nombre o Palabra Clave de Incidencia"
                                       aria-label="Buscar">
                            </div>
                            <div class="col-sm-3">
                                <label for="edit-sort-by" class="card-text" style="color:#264587;font-size: x-small"><h6>Estado Incidencia</h6></label>
                                <select class="form-control form-select" id="edit-sort-by" name="estado">
                                    <option value="1" selected="selected">Todos</option>
                                    <option value="Registrado">Registrado</option>
                                    <option value="Atendido">Atendido</option>
                                    <option value="Resuelto">Resuelto</option>
                                    <option value="En Proceso">En Proceso</option>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <label for="edit-sort-by" class="card-text" style="color:#264587; font-size: x-small"><h6>Nivel Urgencia</h6></label>
                                <select class="form-control form-select" id="edit-sort-order" name="nivelurg">
                                    <option value="1" selected>Todos</option>
                                    <option value="Leve">Leve</option>
                                    <option value="Moderado">Moderado</option>
                                    <option value="Critico">Critico</option>
                                </select>
                            </div>
                            <center>
                                <div class="col-auto">
                                    <button type="submit" id="edit-submit-dkan-datasets" value="Consultar" class="form-submit btn btn-default btn-primary">Buscar</button>
                                    <a href="<%=request.getContextPath()%>/ServletSeguridad?action=descargarExcel" class="btn btn-primary">Descargar Reporte</a>
                                </div>
                            </center>
                        </form>
                        <br>

                        <%  if(!(listaDeIncidencias.size()==1 && listaDeIncidencias.get(0).getIdIncidencia()==0)){
                            for (int i = regMin; i < regMax; i++) {
                                Incidencia incidencia = listaDeIncidencias.get(i); %>
                        <div class="card-body" style="display:flex">
                            <div class="d-flex position-relative">
                                <img src="<%=request.getContextPath()%>/ServletUsuario?action=listarimg&id=<%=incidencia.getIdIncidencia()%>"
                                     class="flex-shrink-0 me-3" alt="..." width="140" height="140">
                            </div>
                            <table class="table responsive">
                                <thead>
                                <tr>
                                    <td class="col-sm-9">
                                        <h4>
                                            <b style="color:#10274D; font-family:'Trebuchet MS', Helvetica, sans-serifzzz;"><%=incidencia.getNombreDeIncidencia()%>
                                            </b></h4>
                                    </td>
                                    <td class="col-sm-3">
                                        <a href="<%=request.getContextPath()%>/ServletSeguridad?action=verIncidencia&id=<%=incidencia.getIdIncidencia()%>"
                                           class="btn btn-danger order-last">Ver Más</a>
                                        <%--<div class="btn-group" role="group"
                                             aria-label="Basic mixed styles example"
                                             style="padding-left: 3rem;">
                                            <a href="<%=request.getContextPath()%>/ServletSeguridad?action=verIncidencia&id=<%=incidencia.getIdIncidencia()%>"
                                               class="btn btn-danger">Ver Más</a>
                                            <a href="< %=request.getContextPath()%>/ServletSeguridad?action=reporte&id=<%=incidencia.getIdIncidencia()%>" class="btn btn-primary">Descargar</a>
                                        </div>--%>
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td >
                                        <h6 style="color:#000000; font-family:Georgia, serif"><b>Nombre y Apellidos:</b> <%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%>
                                        </h6>
                                    </td >
                                    <td>
                                        <p style="color:#0d1673"><b>Código: <%=incidencia.getUsuario().getCodigo()%></b></p>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <p style="color:#000000; font-family:Georgia, serif"><b>Descripción:</b> <%=incidencia.getDescripcion()%> </p>
                                    </td>
                                    <td>
                                        <!--
                                        <p class="text-end"><b>Tipo de Incidencia:</b> < %=incidencia.getTipoDeIncidencia().getNombre()%>
                                        </p> -->
                                        <p style="color: #000000">
                                            <b style="color:#0b2479">Tipo de Incidencia:</b> <%=incidencia.getTipoDeIncidencia().getNombre()%>
                                        </p>
                                        <!--<p class="text-end"><b>Nivel de Urgencia:</b> < %=incidencia.getNivelDeUrgencia().getNombre()%>
                                        </p> -->
                                    </td>
                                </tr>

                                <!--style="display: flex;justify-content:space-around" -->
                                <tr>
                                    <td>
                                        <div class="p-2">
                                            <h6><b style="color:#276706 ">Estado: <%=incidencia.getEstado().getNombre()%></b></h6>
                                        </div>
                                    </td>

                                    <td class="col-sm-3">
                                        <p style="color:#000000">
                                            <b style="color:#0b2479">Nivel de Urgencia:</b> <%=incidencia.getNivelDeUrgencia().getNombre()%>
                                        </p>

                                            </td>
                                        </tr>

                                        <td>
                                            <div class="d-flex flex-row-reverse">

                                                    <div class="col-lg-3">
                                                        <% if (numDestacados.get(incidencia.getIdIncidencia()) != null) {%>

                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="p-2">
                                                            <b>👤 <%=numDestacados.get(incidencia.getIdIncidencia())%>
                                                            </b></div>
                                                        <%} else {%>
                                                        <div class="p-2"><b>👤 0</b></div>
                                                        <%}%>
                                                    </div>

                                                    <div class="p-2">
                                                        <b style="color:#b9940a">★ Destacados</b>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                                <% }}else{ %>
                                    <h3>No se encontraron incidencias</h3>
                                <%}%>


                        <%
                            if (maxPag2 >= 1) {

                        %>

                        <!-- PAGINACION -->

                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">

                                <%if (valor_pagina != 1) {%>
                                <li class="page-item">
                                    <a class="page-link" href="<%=request.getContextPath()%>/ServletSeguridad?action=listarIncidencia&pg=<%=valor_pagina-1%>"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <%}%>
                                <%

                                    for (int i = 0; i < maxPag2; i++) {
                                        if (i + 1 == valor_pagina) {
                                %>

                                <li class="page-item active" aria-current="page">
                                    <span class="page-link"><%=i + 1%></span>
                                </li>


                                <% }
                                else {%>



                                <li class="page-item">
                                    <a class="page-link" href="<%=request.getContextPath()%>/ServletSeguridad?action=listarIncidencia&pg=<%=i+1%>">
                                        <span aria-hidden="true"><%=i+1%></span>
                                    </a>
                                </li>


                                <%
                                    }
                                %>


                                <%
                                        }
                                    }
                                %>


                                <%if (valor_pagina != maxPag2) { %>

                                <li class="page-item">
                                    <a class="page-link" href="<%=request.getContextPath()%>/ServletSeguridad?action=listarIncidencia&pg=<%=valor_pagina+1%>"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>

                                <%
                                    }
                                %>

                            </ul>
                        </nav>

                    </div>
                </div>
            </div>


        </main>
    </div>

</center>
</div>
<br>
</body>
</html>
