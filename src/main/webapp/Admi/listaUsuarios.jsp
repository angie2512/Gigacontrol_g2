<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    String searchText = (String) request.getAttribute("parameter");
%>

<%
    int maxPag2 = (int) request.getAttribute("maxPag2");
    int regMin = (int) request.getAttribute("regMin");
    int regMax = (int) request.getAttribute("regMax");
    int valor_pagina = (int) request.getAttribute("valor_pagina");
%>


<jsp:useBean id="lista" scope="request" type="java.util.ArrayList<com.example.gigacontrol_g2.beans.BUsuarios>"/>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Admin Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
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
</head>
<body>
<p></p>

<!-- nav -->
<nav class="navbar navbar-expand-lg" style="background-color: #131950;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logo_blanco.png" alt="Logo" width="100"
                                              height="40" class="d-inline-block align-text-top img-fluid"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath()%>/ServletAdmin?action=Inicio" aria-current="page" style="color:#FFFFFF">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath()%>/ServletAdmin?action=Perfil" aria-current="page" href="#" style="color:#FFFFFF">Perfil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active"  href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios" aria-current="page" href="#" style="color:#FFFFFF">Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath()%>/ServletAdmin?action=nuevoUsuario" aria-current="page" href="#" style="color:#FFFFFF">Registrar Usuario</a>
                </li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u style="color:#FFFFFF"> <b>Cerrar sesión > </b></u></a>
            </form>
        </div>
    </div>
</nav>
        <br>
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
                                <div class="input-group mb-3 col-9">
                                    <select class="form-select" aria-label="Default select example" name="tipoBusqueda" id="tipoBusqueda" placeholder="TIPO">
                                        <option selected disabled>Seleccionar Criterio de busqueda</option>
                                        <option value="Nombre">Nombre</option>
                                        <option value="Apellido">Apellido</option>
                                        <option value="Codigo">Codigo</option>
                                    </select>
                                    <input type="text" class="form-control" aria-label="Text input with dropdown button"
                                           value="<%=searchText!=null?searchText:""%>" id="parameter" name="parameter" placeholder="Buscar Usuario">
                                    <a href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios"
                                           class="btn btn-secondary">borrar</a>
                                </div>
                            </form>

                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table">
                            <%System.out.println("lista? " + lista.size());%>
                            <%if(lista.size()!=0){%>
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
                                <%
                                    for (int i = regMin; i < regMax; i++) {
                                        BUsuarios usuario = lista.get(i); %>
                                <tr>
                                    <th><%=i+1%>
                                    </th>

                                    <td>
                                        <%if(usuario.getFotoPerfil()!=null){%>
                                        <img src="<%=request.getContextPath()%>/ServletAdmin?action=mostrafoto&id=<%=usuario.getIdUsuario()%>" height="60rem" width="60rem">
                                        <%}
                                        else{%>
                                        <img src="resources/Images/usu.png" height="60rem" width="60rem">
                                        <%}%>
                                    </td>
                                    <td class="card-text">
                                        <%=usuario.getApellido().toUpperCase() + ", " + usuario.getNombre()%>
                                        <% if(usuario.getEstado()==2){%>
                                            <p style="color:red;">"El usuario ha sido dado de baja"</p>
                                        <%}
                                        else if(usuario.getEstado()==1){%>
                                        <p style="color:green;">"El usuario se encuentra registrado en la web"</p>
                                        <%}
                                        else if(usuario.getEstado()==3){%>
                                        <p style="color:blue;">"El usuario aun no se registra en la web"</p>
                                        <%}
                                        else if (usuario.getEstado()==4){%>
                                        <p style="color:blue;">"El usuario aun no establece su contraseña"</p>
                                        <%}
                                        else {%>
                                        <p style="color:red;">"El usuario ha sido bloqueado"</p>
                                        <%}%>

                                    </td>
                                    <th style="color:#B1120D;"><%=usuario.getCodigo()%>
                                    </th>
                                    <td style="color:#C0C4C7;"><%=usuario.getCategoria()%>
                                    </td>
                                    <td style="padding-left: 2rem;"><a
                                            href="<%=request.getContextPath()%>/ServletAdmin?action=Editar&id=<%=usuario.getIdUsuario()%>"
                                            class="btn btn-primary">Editar</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            <%}
                            else{%>
                                <div class="d-flex justify-content-center">
                                    <h1>Usuarios no encontrados</h1>
                                </div>
                                <%}%>
                            </tbody>
                        </table>

                    </div>

                </div>

                <%
                    if (maxPag2 >= 1 && lista.size()!=0) {

                %>

                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">

                                    <%if (valor_pagina != 1) {%>
                                    <li class="page-item">
                                        <a class="page-link" href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios&pg=<%=valor_pagina-1%>"
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
                                        <a class="page-link" href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios&pg=<%=i+1%>">
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


                        <%if (valor_pagina != maxPag2 && lista.size()!=0) { %>

                        <li class="page-item">
                            <a class="page-link" href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios&pg=<%=valor_pagina+1%>"
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

        <br><br><br><br><br>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>
    </body>












</html>