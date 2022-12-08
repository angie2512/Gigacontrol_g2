<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //ArrayList<Estado> listaEstados = (ArrayList <Estado>) request.getAttribute("ListaEstados");
    //ArrayList<TipoDeIncidencia> listaTipoDeIncidencias = (ArrayList <TipoDeIncidencia>) request.getAttribute("ListaTipoDeIncidencias");
    //ArrayList <NivelDeUrgencia> listaNivelesDeUrgencia =(ArrayList < NivelDeUrgencia>) request.getAttribute("ListaNivelesDeUrgencia");
    ArrayList<Incidencia> listaDeIncidencias = (ArrayList<Incidencia>) request.getAttribute("ListaDeIncidencias");
    ArrayList<Integer> listaDestacados = (ArrayList<Integer>) request.getAttribute("listaDestacados");
    BUsuarios u= (BUsuarios) session.getAttribute("userlogged");
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet"/>
    <meta name="theme-color" content="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <meta name="description" content="">
    <link href="blog.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/usuario.css">
    <script src="https://kit.fontawesome.com/46baa8e193.js" crossorigin="anonymous"></script>
    <title>Inicio Usuario</title>
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
        p{
            font-family: Decor;
        }

        @media (min-width: 468px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="p-3 m-0 border-0 bd-example">
 <!--   <nav class="navbar navbar-expand-lg" style="background-color: #5f6694; min-width: 53rem" aria-label="Eighth navbar example">
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
    </nav> -->

<!-- NAV -->
<nav class="navbar navbar-expand-lg" style="background-color: #5f6694;min-width: 53rem" aria-label="Eighth navbar example">
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
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/NuevaIncidencia" style="color:#FFFFFF">Nueva Incidencia</a>
                </li>
            </ul>
            <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2"><b style="color:#211426"><%=userlogged.getNombre() + " " + userlogged.getApellido()%></b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="<%=u.getFotoPerfil()==null?"resources/Images/userSeguridad.png":(request.getContextPath()+"/ServletSeguridad?action=mostrarFoto")%>" class="rounded mx-auto d-block " alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                </div>
              </ul>
            </div>
            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u
                        style="color:#000000"><b>Cerrar sesion > </b></u></a>
            </form>
        </div>
    </nav>



<%--
<header class="p-3 mb-3 border-bottom" style="background-color: #FFFFFF">
   <div class="container">
       <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
           <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
               <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
           </a>

           <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
               <li><a href="#" class="nav-link px-2"><b style="color:#1A3B85">CRISTIAN DOMINGUEZ CASTRO</b></a></li>
               <div class="dropdown text-end">
                   <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                       <img src="resources/Images/userSeguridad.png" alt="mdo" width="32" height="32" class="rounded-circle">
                   </a>
               </div>
           </ul>

           <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
               <a class="dropdown-item" href="<%=request.getContextPath()%>/Index"><u style="color:#1A3B85"> <b>Cerrar sesión > </b></u></a>
           </form>


       </div>
   </div>
</header>
--%>



<div class="container-xxl bd-gutter mt-3 my-md-4 bd-layout">

    <!--
    <aside class="bd-sidebar" style="max-width: 30px; max-height:30rem; background-color: rgba(95,102,148,0.93)">
        <div id="region-menu-box">
            <div class="d-flex flex-column flex-shrink-0 p-3">
                <center>
                    <br>
                    <h2 style="color:#d8f79a; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;"><b> BIENVENIDA/O </b> </h2>
                    <hr>
                    <h6 style="color:#b5daf8; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;"><b>PASOS PARA REGISTRAR</b> </h6>
                    <h6 style="color:#b5daf8; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;"><b>UNA INCIDENCIA </b></h6> </center>
                <hr>
                <p></p>
                <p></p>
                <center>
                    <h5 style="color:#FFFFFF; font-family:'Georgia'"><b>➀</b>    Dirígete a Nueva Incidencia</h5>
                    <p></p>
                    <h5 style="color:#FFFFFF; font-family:'Georgia'"><b>➁</b>    Ingresa los datos requeridos</h5>
                    <p></p>
                    <h5 style="color:#FFFFFF; font-family:'Georgia'"><b>➂</b>    Presiona enviar y ¡Listo!</h5>
                </center>
            </div>
        </div>
    </aside> -->

    <!-- prueba

    <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="max-width: 320px; height: 550px" >
        <h1>BIENVENIDO</h1>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li>
                <p>Pasos para registar</p>
            </li>
            <li>
                <p>una incidencia</p>
            </li>
            <li>
                <h5>➀ Dirígete a Nueva Incidencia</h5>
            </li>
            <li>
                <h5>➁ Ingresa los datos requeridos</h5>
            </li>
            <li>
                <h5>➂ Presiona enviar y ¡Listo!</h5>
            </li>
        </ul>
        <hr>
    </div> -->

    <!-- otra prueba de inicio -->
    <main class="container">
            <div class="row g-5">
                <div class="col-md-4">
                    <div class="d-flex flex-column flex-shrink-0 p-3 " style="max-width: 350px; height: 550px; background-color:#5f6694" >
                        <br><center>
                        <h2 style="font-family: 'Georgia'; color: #FFFFFF">BIENVENIDO</h2></center>
                        <p></p>
                        <hr>
                        <ul class="nav nav-pills flex-column mb-auto">
                            <center>
                            <li>
                                <p style="color:#FFFFFF; ">Pasos para registar</p>
                                <p style="color:#FFFFFF">una incidencia</p>
                            </li>
                                <p></p>
                                <p></p>
                            </center>
                            <br>
                            <li>
                                <h6 style="color:#FFFFFF; font-family: 'Georgia'">➀ Dirígete a Nueva Incidencia</h6>
                            </li>
                            <br>
                            <li>
                                <h6 style="color:#FFFFFF; font-family: 'Georgia'">➁ Ingresa los datos requeridos</h6>
                            </li>
                            <br>
                            <li>
                                <h6 style="color:#FFFFFF; font-family: 'Georgia'">➂ Presiona enviar y ¡Listo!</h6>
                            </li>
                        </ul>
                        <hr>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="my-3 p-3 bg-body rounded shadow-sm position-relative" style="width:53rem ;background-color: #051D57;" >
                        <h4 class="border-bottom pb-2 mb-2" style="background-color:#051D57;color:#FFFFFF;"><center><b style="font-family: 'Trebuchet MS',Helvetica, sans-serif;">TODAS LAS INCIDENCIAS </b></center></h4>
                        <p></p>
                        <form class="d-flex" role="search" method="post" action="<%=request.getContextPath()%>/ServletUsuario?action=buscar">
                            <input class="form-control me-2" type="search" name="searchText" placeholder="Buscar" aria-label="Buscar">
                            <button class="btn btn-outline-primary" type="submit">Buscar</button>
                        </form>


                        <div class="card" style="margin-top:5px">
                            <div class="card-body">
                                <div class="d-flex position-relative">
                                    <div>

                                        <%for(Incidencia incidencia : listaDeIncidencias) { %>
                                        <div class="card-body" style="display:flex">
                                            <div class="d-flex position-relative" style="top: 50px;right: 15px;">
                                                <img src="<%=request.getContextPath()%>/ServletUsuario?action=listarimg&id=<%=incidencia.getIdIncidencia()%>" class="flex-shrink-0 me-3" alt="..." width="140" height="140">
                                            </div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <h4><b style="color:#10274D; font-family:'Trebuchet MS', Helvetica, sans-serifzzz;"><%=incidencia.getNombreDeIncidencia()%></b></h4>
                                                    </td>
                                                    <td>
                                                        <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                                                            <a href="<%=request.getContextPath()%>/ServletUsuario?action=verIncidencia&id=<%=incidencia.getIdIncidencia()%>" class="btn btn-danger">Ver Más</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h6 style="color:#585151; font-family:Georgia, serif"><b>NOMBRE Y APELLIDO: <%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%></b> </h6>
                                                    <td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <p style="color:#D62525"><b>Código: <%=incidencia.getUsuario().getCodigo()%></b></p>
                                                    </td>
                                                    <td>
                                                        <p class="text-end"><b>Tipo de Incidencia:</b> <%=incidencia.getTipoDeIncidencia().getNombre()%></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <p><b>Descripción:</b></p>
                                                    </td>
                                                    <td>
                                                        <p class="text-end"><b>Nivel de Urgencia:</b> <%=incidencia.getNivelDeUrgencia().getNombre()%></p>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td>
                                                        <p><%=incidencia.getDescripcion()%></p>
                                                    </td>
                                                </tr>
                                            <td>
                                                 <td>
                                                    <div class="d-flex flex-row-reverse">
                                                        <div class="p-2"><b style="color:#DCBA38 ">Estado:<%=incidencia.getEstado().getNombre()%></b></div>
                                                        <% if(numDestacados.get(incidencia.getIdIncidencia())!=null){%>
                                                        <div class="p-2"><b>👤 <%=numDestacados.get(incidencia.getIdIncidencia())%></b></div>
                                                        <%}else{%>
                                                        <div class="p-2"><b>👤 0</b></div>
                                                        <%}%>
                                                        <%if(listaDestacados.contains(incidencia.getIdIncidencia())){ %>
                                                        <div class="p-2">
                                                            <a href="<%=request.getContextPath()%>/ServletUsuario?action=quitardestacado&idi=<%=incidencia.getIdIncidencia()%>" style="color:#F0C00D">★ Destacar</a>
                                                        </div>
                                                        <% }else{ %>
                                                        <div class="p-2">
                                                            <a href="<%=request.getContextPath()%>/ServletUsuario?action=destacar&idi=<%=incidencia.getIdIncidencia()%>" style="color:rgba(93,131,196,0.38)">★ Destacar</a>
                                                        </div>
                                                        <%}%>
                                                    </div>
                                                   </td>
                                                </tr>
                                            </table>
                                            <hr class="border border-black border-2 opacity-60">
                                        </div>
                                        <% } %>
                                    </div>

                                </div>

                            </div>

                        </div>

                  </div>
                    <!-- ES MEJOR PAGINACION -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>

            </div>
    </main>





<!--
    <center>
        <div class="container-xxl bd-gutter mt-3 my-md-4 bd-layout; overflow-auto">
            <main class ="bd-main order-1;overflow-auto" style="width: 820px; height:1650px; background-color: #FFFFFF99">
                <div class="my-3 p-3 bg-body rounded shadow-sm position-relative" style="width: 820px; height:3500px; background-color: #051D57;" >
                    <h4 class="border-bottom pb-2 mb-2" style="background-color:#051D57;color:#FFFFFF;"><center><b style="font-family: 'Trebuchet MS',Helvetica, sans-serif;">TODAS LAS INCIDENCIAS </b></center></h4>
                    <p></p>
                    <form class="d-flex" role="search" method="post" action="<%=request.getContextPath()%>/ServletUsuario?action=buscar">
                        <input class="form-control me-2" type="search" name="searchText" placeholder="Buscar" aria-label="Buscar">
                        <button class="btn btn-outline-primary" type="submit">Buscar</button>
                    </form>


                    <div class="card" style="margin-top:10px">
                        <div class="card-body">
                            <div class="d-flex position-relative">
                                <div>

                                    <%for(Incidencia incidencia : listaDeIncidencias) { %>
                                    <div class="card-body">
                                        <table>
                                            <tr>
                                                <td>
                                                    <h4><b style="color:#10274D; font-family:'Trebuchet MS', Helvetica, sans-serifzzz;"><%=incidencia.getNombreDeIncidencia()%></b></h4>
                                                </td>
                                                <td>
                                                    <div class="card-body d-flex align-items-right"  aria-label="Basic mixed styles example" style="padding-final: 3rem; margin-left: 200px;">
                                                        <a href="<%=request.getContextPath()%>/ServletUsuario?action=verIncidencia&id=<%=incidencia.getIdIncidencia()%>" class="btn btn-danger">Ver Más</a>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <h6 style="color:#585151; font-family:Georgia, serif"><b>NOMBRE Y APELLIDO: <%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%></b> </h6>
                                                <td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p style="color:#D62525"><b>Código: <%=incidencia.getUsuario().getCodigo()%></b></p>
                                                </td>
                                                <td>
                                                    <p class="text-end"><b>Tipo de Incidencia:</b> <%=incidencia.getTipoDeIncidencia().getNombre()%></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p><b>Descripción:</b></p>
                                                </td>
                                                <td>
                                                    <p class="text-end"><b>Nivel de Urgencia:</b> <%=incidencia.getNivelDeUrgencia().getNombre()%></p>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <p><%=incidencia.getDescripcion()%></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img src="<%=request.getContextPath()%>/ServletUsuario?action=listarimg&id=<%=incidencia.getIdIncidencia()%>" style="margin-left: 50px; width: 300px; height: 200px">
                                                <td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <div class="d-flex flex-row-reverse">
                                                    <div class="p-2"><b style="color:#DCBA38 ">Estado:<%=incidencia.getEstado().getNombre()%></b></div>
                                                    <% if(numDestacados.get(incidencia.getIdIncidencia())!=null){%>
                                                    <div class="p-2"><b>👤 <%=numDestacados.get(incidencia.getIdIncidencia())%></b></div>
                                                    <%}else{%>
                                                    <div class="p-2"><b>👤 0</b></div>
                                                    <%}%>
                                                    <%if(listaDestacados.contains(incidencia.getIdIncidencia())){ %>
                                                    <div class="p-2">
                                                        <a href="<%=request.getContextPath()%>/ServletUsuario?action=quitardestacado&idi=<%=incidencia.getIdIncidencia()%>" style="color:#F0C00D">★ Destacar</a>
                                                    </div>
                                                    <% }else{ %>
                                                    <div class="p-2">
                                                        <a href="<%=request.getContextPath()%>/ServletUsuario?action=destacar&idi=<%=incidencia.getIdIncidencia()%>" style="color:rgba(93,131,196,0.38)">★ Destacar</a>
                                                    </div>
                                                    <%}%>
                                                </div>
                                            </tr>
                                        </table>
                                    </div>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </center>
    -->
</div>
  </body>
</html>