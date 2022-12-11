<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.TipoDeIncidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.Estado" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%
    ArrayList<Incidencia> IncidenciasUsuario = (ArrayList<Incidencia>) request.getAttribute("ListaDeIncidenciasDelUsuario");
    ArrayList<Incidencia> IncidenciasDestacadas = (ArrayList<Incidencia>) request.getAttribute("ListaDeIncidenciasDestacadas");
    BUsuarios u = (BUsuarios) session.getAttribute("userlogged");
%>

<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session"
             class="com.example.gigacontrol_g2.beans.BUsuarios"/>


<%
    int maxPag4 = (int) request.getAttribute("maxPag4");
    int regMin2 = (int) request.getAttribute("regMin2");
    int regMax2 = (int) request.getAttribute("regMax2");
    int valor_pagina2 = (int) request.getAttribute("valor_pagina2");
%>


<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <title>Mis Incidencias</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
              crossorigin="anonymous">
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

            header {
                background: #8caeea;
                color: white;
                border: 1px solid #8caeea;
            }

            table {
                border-collapse: collapse;
            }

            td, th {
                padding: 5px 10px;
                border: 0px solid grey;
            }

            main {
                padding: 1em 2em;
            }

            @media (max-width: 30em) {
                table {
                    width: 100%;
                }

                table tr {
                    display: flex;
                    flex-direction: column;
                    border: 0px solid grey;
                    padding: 1em;
                    margin-bottom: 1em;
                }

                table td[data-titulo] {
                    display: flex;
                }

                table td, table th {
                    border: none;
                }

                table td[data-titulo]::before {
                    content: attr(data-titulo);
                    width: 90px;
                    color: silver;
                    font-weight: bold;
                }

                table thead {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <p></p>
        <nav class="navbar navbar-expand-lg" style="background-color: #5f6694;" aria-label="Eighth navbar example">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="resources/Images/logo_blanco.png" alt="Logo" width="100"
                                                      height="40" class="d-inline-block align-text-top img-fluid"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample07">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                               href="<%=request.getContextPath()%>/ServletUsuario" style="color:#FFFFFF">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                               href="<%=request.getContextPath()%>/PerfilUsuario" style="color:#FFFFFF">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                               href="<%=request.getContextPath()%>/NuevaIncidencia" style="color:#FFFFFF">Nueva
                                Incidencia</a>
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
        <div class="d-flex justify-content-center">
            <div class="card">
                <div class="card-body">
                    <div class="p-7 mb-2 bg-primary text-white" style="--bs-bg-opacity: .5;">
                        <h4 style="text-align: center; color: white; font-family:'Times New Roman', Times, serif">MIS
                            INCIDENCIAS</h4>
                    </div>
                    <br>

                    <div class="card-body" style="height: 150px; overflow: auto">
                        <table>
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <center> Incidencia</center>
                                    </th>
                                    <th scope="col">
                                        <center> Tipo de Incidencia</center>
                                    </th>
                                    <th scope="col">
                                        <center> Estado</center>
                                    </th>
                                    <th scope="col">
                                        <center> Opciones</center>
                                    </th>
                                </tr>
                            </thead>

                            <tbody>
                                <%for (Incidencia incidencia2 : IncidenciasUsuario) { %>
                                <tr>
                                    <td>
                                        <center><%= incidencia2.getNombreDeIncidencia() %>
                                        </center>
                                    </td>
                                    <td>
                                        <center><%= incidencia2.getTipoDeIncidencia().getNombre() %>
                                        </center>
                                    </td>
                                    <td>
                                        <center><%= incidencia2.getEstado().getNombre() %>
                                        </center>
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                            <a href=<%=request.getContextPath()%>/VerIncidenciaUsuario
                                               class="btn btn-primary">Ver Mas</a>
                                        </div>
                                    </td>
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
                    <header>
                        <h3 style="font-family: 'Georgia'">
                            <center>MIS INCIDENCIAS DESTACADAS</center>
                        </h3>
                    </header>
                    <br>
                    <div class="card">
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Incidencia</th>
                                        <th>Usuario</th>
                                        <th>Tipo de Incidencia</th>
                                        <th>Estado</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    for (int i = regMin2; i < regMax2; i++) {
                                        if (IncidenciasDestacadas == null) {
                                            break;
                                        } else {
                                            Incidencia incidencia = IncidenciasDestacadas.get(i);%>
                                    <tr>
                                        <td data-titulo="Incidencia"><%= incidencia.getNombreDeIncidencia() %>
                                        </td>
                                        <td data-titulo="Usuario"><%= incidencia.getUsuario().getNombre() %> <%=incidencia.getUsuario().getApellido()%>
                                        </td>
                                        <td data-titulo="Tipo Incidencia"><%= incidencia.getTipoDeIncidencia().getNombre() %>
                                        </td>
                                        <td data-titulo="Estado"><%= incidencia.getEstado().getNombre() %>
                                        </td>
                                        <td>
                                            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                                <a href=<%=request.getContextPath()%>/VerIncidenciaUsuario
                                                   class="btn btn-danger">Ver Mas</a>
                                            </div>
                                        </td>
                                    </tr>


                                    <% } %>

                                    <% } %>


                                </tbody>
                            </table>

                            <%
                                if (maxPag4 >= 1) {

                            %>

                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">

                                    <%if (valor_pagina2 != 1) {%>
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="<%=request.getContextPath()%>/ServletUsuario?action=listaMisIncidencias&pg1=<%=valor_pagina2-1%>"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <%}%>
                                    <%

                                        for (int i = 0; i < maxPag4; i++) {
                                            if (i + 1 == valor_pagina2) {
                                    %>

                                    <li class="page-item active" aria-current="page">
                                        <span class="page-link"><%=i + 1%></span>
                                    </li>


                                    <% } else {%>


                                    <li class="page-item">
                                        <a class="page-link"
                                           href="<%=request.getContextPath()%>/ServletUsuario?action=listaMisIncidencias&pg1=<%=i+1%>">
                                            <span aria-hidden="true"><%=i + 1%></span>
                                        </a>
                                    </li>


                                    <%
                                        }
                                    %>


                                    <%
                                            }
                                        }
                                    %>


                                    <%if (valor_pagina2 != maxPag4) { %>

                                    <li class="page-item">
                                        <a class="page-link"
                                           href="<%=request.getContextPath()%>/ServletUsuario?action=listaMisIncidencias&pg1=<%=valor_pagina2+1%>"
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
                    <br>
                </div>
            </div>
        </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>
        <br>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/InicioUsuario" role="button"
           style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
        <br><br>
    </body>

</html>