<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 26/10/2022
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String searchText = (String) request.getAttribute("searchText");
%>

<jsp:useBean id="lista" scope="request" type="java.util.ArrayList<com.example.gigacontrol_g2.beans.BUsuarios>"/>
<%
    BUsuarios userLog = new BUsuarios();
    for (BUsuarios u : lista) {
        if (u.getRolId() == 3) {
            userLog = u;
        }
    }
%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <title>Admin-ListaUsuarios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
              crossorigin="anonymous">
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
    <body class="p-3 m-0 border-0 bd-example">


        <%--        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="<%=request.getContextPath()%>/ServletAdmin?action=Inicio" class="nav-link px-2"><b
                            style="color:#1A3B85"><%=userlogged.getNombre().toUpperCase() + " " + userlogged.getApellido().toUpperCase()%>
                    </b></a></li>
                    <div class="dropdown text-end">
                        <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                            <img src="resources/Images/usu.png" alt="mdo" width="32" height="32"
                                 class="rounded-circle">
                        </a>
                    </div>
                </ul>--%>


        <nav class="navbar navbar-expand-lg" style="background-color: #131950;" aria-label="Eighth navbar example">
            <div class="container">
                <a class="navbar-brand" href="/AdminInicio.jsp"><img src="resources/Images/logopucp.png" alt="Logo" width="40"  height="40" class="d-inline-block align-text-top"><b style="color:#FFFFFF"> GIGACONTROL</b></a>


                <%--<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                            <use xlink:href="#bootstrap"></use>
                        </svg>
                    </a>

                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="<%=request.getContextPath()%>/ServletAdmin?action=Inicio" class="nav-link px-2"><b
                                style="color:#FFFFFF">SEBASTIAN G. SEGURA ABANTO</b></a></li>
                        <div class="dropdown text-end">
                            <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                                <img src="Images/usu.png" alt="mdo" width="32" height="32" class="rounded-circle">
                            </a>
                        </div>
                    </ul>
                </div>--%>


                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false"
                        aria-label="Toggle navigation">


                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample07">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="<%=request.getContextPath()%>/ServletAdmin?action=Inicio"
                               aria-current="page" href="#" style="color:#FFFFFF">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="<%=request.getContextPath()%>/ServletAdmin?action=Perfil"
                               aria-current="page" href="#" style="color:#FFFFFF">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active"
                               href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios"
                               aria-current="page" href="#" style="color:#FFFFFF">Usuarios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active"
                               href="<%=request.getContextPath()%>/ServletAdmin?action=nuevoUsuario" aria-current="page"
                               href="#" style="color:#FFFFFF">Registrar Usuario</a>
                        </li>
                    </ul>
                </div>

                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio"><u
                            style="color:#FFFFFF"><b>Cerrar sesión > </b></u></a>
                </form>
            </div>
        </nav>


        <div class="d-flex justify-content-center">
            <div class="card">
                <div class="card-body">
                    <div class="p-7 mb-2 bg-primary text-white" style="--bs-bg-opacity: .5;">
                        <h4 style="text-align: center; color: white; font-family:'Times New Roman', Times, serif">
                            LISTA DE USUARIOS</h4>
                    </div>


                    <div class="row align-items-center">
                        <div class="col-10">
                            <form method="post" action="<%=request.getContextPath()%>/ServletAdmin?action=buscar">
                                <div class="col-auto">
                                    <label for="floatingInput" class="col-form-label">Buscar:</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" name="searchText" class="form-control" id="floatingInput"
                                           placeholder="Buscar Usuario" value="<%=searchText!=null?searchText:""%>">
                                </div>
                            </form>
                            <div class="col-2">
                                <a href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios"
                                   class="btn btn-secondary">borrar</a>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col"></th>
                                    <th scope="col"></th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Codigo</th>
                                    <th scope="col">Categoria</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% int i = 1;
                                    for (BUsuarios usuario : lista) { %>
                                <tr>
                                    <th><%=i%>
                                    </th>
                                    <td><img src="resources/Images/usu.png" class="rounded mx-auto d-block "
                                             alt="userphoto" height="60rem" width="60rem"></td>
                                    <td class="card-text"><%=usuario.getApellido().toUpperCase() + ", " + usuario.getNombre()%>
                                    </td>
                                    <th style="color:#B1120D;"><%=usuario.getCodigo()%>
                                    </th>
                                    <td style="color:#C0C4C7;"><%=usuario.getCategoria()%>
                                    </td>
                                    <td style="padding-left: 2rem;"><a
                                            href="<%=request.getContextPath()%>/ServletAdmin?action=Editar&id=<%=usuario.getIdUsuario()%>"
                                            class="btn btn-primary">Editar</a></td>
                                </tr>
                                <%
                                        i++;
                                    }
                                %>
                            </tbody>
                        </table>

                    </div>


                </div>


                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
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

        <br><br><br><br><br>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>
    </body>
</html>