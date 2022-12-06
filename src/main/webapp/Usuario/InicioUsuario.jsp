<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //ArrayList<Estado> listaEstados = (ArrayList <Estado>) request.getAttribute("ListaEstados");
    //ArrayList<TipoDeIncidencia> listaTipoDeIncidencias = (ArrayList <TipoDeIncidencia>) request.getAttribute("ListaTipoDeIncidencias");
    //ArrayList <NivelDeUrgencia> listaNivelesDeUrgencia =(ArrayList < NivelDeUrgencia>) request.getAttribute("ListaNivelesDeUrgencia");
    ArrayList<Incidencia> listaDeIncidencias = (ArrayList<Incidencia>) request.getAttribute("ListaDeIncidencias");
    ArrayList<Integer> listaDestacados = (ArrayList<Integer>) request.getAttribute("listaDestacados");
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
    <title>Inicio Usuario</title>
    <style>
        body {
            background: url("https://s3.amazonaws.com/files.pucp.edu.pe/puntoedu/wp-content/uploads/2021/03/31184656/campus-pucp-cia-letras-2020_03-1920x1080-1-1536x864.jpg");
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            height: 100vh;
            bgcolor: "#800000";

        }
        @font-face {
            font-family: Decor;
            src: url(KrinkesDecorPERSONAL.ttf);
        }
        @font-face{
            font-family: Decor;
            src: url(KrinkesRegularPERSONAL.ttf);
            font-style: italic;
        }
        p{
            font-family: Decor;
        }

    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
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
                        <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/MisIncidencias" style="color:#FFFFFF">Mis Incidencias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/NuevaIncidencia" style="color:#FFFFFF">Nueva Incidencia</a>
                    </li>

                </ul>


                <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                    <li><a href="#" class="nav-link px-2"><b style="color:#1A3B85"><%=userlogged.getNombre() + userlogged.getApellido()%></b></a></li>
                    <div class="dropdown text-end">
                        <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                            <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" alt="mdo" width="32" height="32" class="rounded-circle">
                        </a>
                    </div>
                </ul>

                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u style="color:rgb(35,30,30)"> <b>Cerrar sesión> </b></u></a>
                </form>
            </div>
        </div>
    </nav>




<p></p>
<p></p>
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
    <aside class="bd-sidebar" style="width: 380px; height:400px; background-color: #11559290">
        <div id="region-menu-box">
            <div class="d-flex flex-column flex-shrink-0 p-3">
                <center>
                    <br>
                    <h2 style="color:#FFFFFF; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;"><b> BIENVENIDA/O </b> </h2>
                    <hr>
                    <h6 style="color:#0A321E; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;"><b>PASOS PARA REGISTRAR</b> </h6>
                    <h6 style="color:#0A321E; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;"><b>UNA INCIDENCIA </b></h6> </center>
                <hr>
                <p></p>
                <p></p>
                <center>
                    <h5 style="color:#FFFFFF; font-family:'Berlin Sans FB', cursive, sans-serif;"><b>➀</b>    Dirígete a Nueva Incidencia</h5>
                    <p></p>
                    <h5 style="color:#FFFFFF; font-family:'Berlin Sans FB', cursive, sans-serif;"><b>➁</b>    Ingresa los datos requeridos</h5>
                    <p></p>
                    <h5 style="color:#FFFFFF; font-family:'Berlin Sans FB', cursive, sans-serif;"><b>➂</b>    Presiona enviar y ¡Listo!</h5>
                </center>
            </div>
        </div>
    </aside>
    <center>
        <div class="container-xxl bd-gutter mt-3 my-md-4 bd-layout; overflow-auto">
            <main class ="bd-main order-1;overflow-auto" style="width: 820px; height:1650px; background-color: #FFFFFF99">
                <div class="my-3 p-3 bg-body rounded shadow-sm position-relative" style="width: 820px; height:3500px; background-color: #051D57;" >
                    <h4 class="border-bottom pb-2 mb-2" style="background-color:#051D57;color:#FFFFFF;"><center><b style="font-family: 'Trebuchet MS',Helvetica, sans-serif;">TODAS LAS INCIDENCIAS </b></center></h4>
                    <p></p>
                    <form class="d-flex" role="search" method="post" action="<%=request.getContextPath()%>/InicioUsuario?action=buscar">
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
                                                    <img src="<%=request.getContextPath()%>/InicioUsuario?action=listarimg&id=<%=incidencia.getIdIncidencia()%>" height = "60rem" width="60 rem">
                                                <td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <div class="d-flex flex-row-reverse">
                                                    <div class="p-2"><b style="color:#DCBA38 ">Estado:<%=incidencia.getEstado().getNombre()%></b></div>
                                                    <div class="p-2"><b>👤 15</b></div>
                                                    <% if(listaDestacados.contains(incidencia.getIdIncidencia())){ %>
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
</div>
  </body>
</html>