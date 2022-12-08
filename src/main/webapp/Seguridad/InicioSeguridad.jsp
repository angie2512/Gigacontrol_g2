<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.TipoDeIncidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.NivelDeUrgencia" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>
<!--Con "userlogged" en teoria podemos imprimir el nombre y apellido del usuario seguridad" -->
<%
  //String searchText = (String) request.getAttribute("searchText");
  ArrayList<Incidencia> listaDeIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
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
        background: url("https://ambientesdigital.com/wp-content/uploads/2017/07/10-biblioteca-ciencias-ingenieria-arquitectura-pucp-foto-juan-solano-ojasi.jpg");
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
      .btn-1{
        display: inline-block;
        background: #00000010;
        text-decoration: none;
        font-size: 18px;
        padding: 10px 25px;
        color:#FFFFFF;
        border-radius: 5px;
        border-color: #FFFFFF;
      }
      @media(min-width: 768px){
        .btn-1{
          padding: 10px 35px;
          background-color: #00000010;
        }
      }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

  </head>

<body class="p-3 m-0 border-0 bd-example">
      <nav class="navbar navbar-expand-lg" style="background-color: #4C9978;" aria-label="Eighth navbar example">
        <div class="container">
          <a class="navbar-brand" href="#"><img src="resources/Images/logopucp.png" alt="Logo" width="40" height="40" class="d-inline-block align-text-top"><b style="color:#FFFFFF"> GIGACONTROL</b></a>
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
              <li><a href="#" class="nav-link px-2"><b style="color:white"><%=userlogged.getNombre() + userlogged.getApellido()%></b></a></li>
              <div class="dropdown text-end">
                <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                  <!--img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" alt="mdo" width="32" height="32" class="rounded-circle"--->
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
      <main class ="bd-main order-1;overflow-auto" style="width: 820px; background-color: #FFFFFF99">
        <div class="my-3 p-3 bg-body rounded shadow-sm position-relative" style="width: 820px; background-color: #8CC67A;" >
          <h4 class="border-bottom pb-2 mb-2" style="background-color:#6FCE92;color:#18542E;"><center><b style="font-family: 'Trebuchet MS',Helvetica, sans-serif;">INCIDENCIAS REPORTADAS</b  ></center></h4>
          <p></p>

          <!--Se colocará el div que contenga botón para descargar pdf--->
          <button>Descargar PDF</button>


          <div class="card" style="margin-top:10px">
            <div class="card-body">
              <!--<div class="d-flex position-relative">
                <img src="https://elcomercio.pe/resizer/hE0dXgCo-KfAjkgGRXLIlDayLYo=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/JRZOEF5WCRCCPO32AV7OYXXNCU.jpg" class="flex-shrink-0 me-3" alt="..." width="140" height="140">
                <div> -->


                  <form action="/search" method="get" id="views-exposed-form-dkan-datasets-panel-pane-1" accept-charset="UTF-8" role="form"><div><div class="views-exposed-form">
                    <div class="views-exposed-widgets clearfix">

                      <div class="views-exposed-widget views-widget-sort-by">
                        <div class="form-item form-type-select form-item-sort-by form-group">
                          <label for="edit-sort-by">Nivel de Urgencia </label>
                          <select class="form-control form-select" id="edit-sort-by" name="sort_by"><option value="changed" selected="selected">Leve</option><option value="title">Moderado</option><option value="title">Critico</option></select>
                        </div>
                      </div>
                    </div>
                  </div>
                  </div>
                  </form>


                      <%
                        for(Incidencia incidencia : listaDeIncidencias) {
                      %>
                  <div class="card-body" style="display:flex">
                    <div class="d-flex position-relative">
                      <img src="<%=request.getContextPath()%>/ServletUsuario?action=listarimg&id=<%=incidencia.getIdIncidencia()%>" class="flex-shrink-0 me-3" alt="..." width="140" height="140">
                    </div>
                      <table>
                        <tr>
                          <td>
                            <h4><b style="color:#10274D; font-family:'Trebuchet MS', Helvetica, sans-serifzzz;"><%=incidencia.getNombreDeIncidencia()%></b></h4>
                          </td>
                          <td>
                            <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                              <a href="<%=request.getContextPath()%>/ServletSeguridad?action=verIncidencia&id=<%=incidencia.getIdIncidencia()%>" class="btn btn-danger">Ver Más</a>
                              <!--a href="< %=request.getContextPath()%>/ServletSeguridad?action=reporte&id=<%=incidencia.getIdIncidencia()%>" class="btn btn-primary">Descargar</a> --->
                            </div>
                          </td>
                        </tr>
                        <tr>

                          <td>
                            <h6 style="color:#585151; font-family:Georgia, serif"><b>Nombre y Apellidos: <%=incidencia.getUsuario().getNombre()%> <%=incidencia.getUsuario().getApellido()%></b> </h6>
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
                          <div class="d-flex flex-row-reverse">
                            <div class="p-2"><b style="color:#DCBA38 ">Estado:<%=incidencia.getEstado().getNombre()%></b></div>
                            <div class="p-2"><b>👤 15</b></div>
                            <div class="p-2"><b style="color:#F0C00D">★ Destacados</b></div>
                          </div>
                          </td>
                        </tr>
                      </table>
                      <!--<table>
                        <tr>
                          <div class="d-flex flex-row-reverse">
                            <div class="p-2"><b style="color:#DCBA38 ">Estado:< %=incidencia.getEstado().getNombre()%></b></div>
                            <div class="p-2"><b>👤 15</b></div>
                            <div class="p-2"><b style="color:#F0C00D">★ Destacados</b></div>
                          </div>
                        </tr>
                      </table>-->
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
