<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 26/10/2022
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session"
             class="com.example.gigacontrol_g2.beans.BUsuarios"/>


<%
    BUsuarios u = (BUsuarios) session.getAttribute("userlogged");

%>



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
                    <a class="nav-link active"  href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios" aria-current="page" href="#" style="color:#FFFFFF">Usuarios</a>
                </li>
            </ul>

            <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                <li><a class="nav-link px-2"><b
                        style="color:#FFFFFF"><%=userlogged.getNombre() + " " + userlogged.getApellido()%>
                </b></a></li>
                <div class="dropdown text-end">
                    <a class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="<%=u.getFotoPerfil()==null?"resources/Images/userSeguridad.png":(request.getContextPath()+"/ServletSeguridad?action=mostrarFoto")%>"
                             class="rounded mx-auto d-block " alt="mdo" width="32" height="32"
                             class="rounded-circle">
                    </a>
                </div>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u style="color:#FFFFFF"> <b>Cerrar sesi??n > </b></u></a>
            </form>
        </div>
    </div>
</nav>

<br><br>
<!--
        <div class="d-inline p-3" style="font-size: 1.5rem;background-color:#347199;"><b
                style="color:#FFFFFF; font-family:'Palatino Linotype','Book Antiqua',Palatino, serif"> REGISTRO</b>
        </div>
        <br><br><br>
-->

        <!--<div class="d-flex justify-content-center">
            <div class="col-3">
                <img src="resources/Images/usu.png" class="img-fluid">
                <%--<img src="Images/usu.png" class="rounded mx-auto d-block " alt="userphoto"
                     height="230rem"
                     width="230rem" alt="userphoto">--%>
            </div>
            <div class="col-6.5">
                <div class="card mb-3" style="max-width: 68rem;">
                    <div class="card-body">
                        <form action="<%=request.getContextPath()%>/ServletAdmin?action=guardar" method="post">
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="col-auto">
                                                <label for="inputName" class="col-form-label">Nombres:</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-auto">
                                                <input type="password" id="inputName" class="form-control"
                                                       aria-describedby="passwordHelpInline">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="row g-3 align-items-center">
                                                <div class="col-auto">
                                                    <label for="inputLastName" class="col-form-label">Apellidos:</label>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-auto">
                                                <input type="password" id="inputLastName" class="form-control"
                                                       aria-describedby="passwordHelpInline">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="col-auto">
                                                <label for="inputDNI" class="col-form-label">DNI:</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-auto">
                                                <input type="password" id="inputDNI" class="form-control"
                                                       aria-describedby="passwordHelpInline">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-auto">
                                                <label for="inputCel" class="col-form-label">Celular:</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-auto">
                                                <input type="password" id="inputCel" class="form-control"
                                                       aria-describedby="passwordHelpInline">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="col-auto">
                                                <label for="inputCodigoPUCP" class="col-form-label">C??digo PUCP:</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-auto">
                                                <input type="password" id="inputCodigoPUCP" class="form-control"
                                                       aria-describedby="passwordHelpInline">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-auto">
                                                <label for="inputCorreoPUCP" class="col-form-label">Correo PUCP:</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-auto">
                                                <input type="password" id="inputCorreoPUCP" class="form-control"
                                                       aria-describedby="passwordHelpInline">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="col-auto">
                                                <label for="categoria" class="col-form-label">Categor??a PUCP:</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="input-group mb-3">
                                                <select class="form-select" id="categoria" name="categoria">
                                                    <option selected>Elegir...</option>
                                                    <option value="1">Alumno</option>
                                                    <option value="2">Profesor</option>
                                                    <option value="3">Jefe de p??ctica</option>
                                                    <option value="4">Administrativo</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-auto">
                                                <label for="rolID" class="col-form-label">Rol:</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="input-group mb-3">
                                                <select class="form-select" id="rolID" name="rolID">
                                                    <option selected>Elegir...</option>
                                                    <option value="1">seguridad</option>
                                                    <option value="2">usuario pucp</option>
                                                    <option value="3">administrador</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="d-flex justify-content-center">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal">
                                    Validar Registro
                                </button>
                                 Modal -->
        <!--
                                <div class="modal fade" id="exampleModal" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Se crear??
                                                    un
                                                    nuevo usuario</h5>
                                                <button type="button" class="btn-close"
                                                        data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="d-flex justify-content-center">
                                                    <h3 style="color:#399934">??Desea Continuar?</h3>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="d-flex justify-content-center">
                                                    <button type="submit" class="btn btn-primary">
                                                        Confirmar
                                                        >
                                                    </button>
                                                    <br>
                                                    <a class="btn btn-primary"
                                                       href="<%=request.getContextPath()%>/ServletAdmin?action=nuevoUsuario"
                                                       role="button"
                                                       style="margin-left: 0rem; background-color:#D12C22 ; border: none;">
                                                        Cancelar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> -->

        <div class="container text-center">
            <div class="row justify-content-start">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="card-title" style="font-family: Georgia; color:#dca838">REGISTRO</h1>
                            <h6>Ingrese sus datos</h6>
                            <% if(session.getAttribute("err")!=null){%>
                            <div class="alert alert-danger" role="alert">
                                <%=session.getAttribute("err")%>
                            </div>
                            <% session.removeAttribute("err");%>
                            <%}%>
                            <form action="<%=request.getContextPath()%>/ServletAdmin?action=guardar" method="post">
                                <div class=" table-responsive">

                                    <table class="table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="col-auto">
                                                        <label for="nombre" class="col-form-label"><b style="color: #177e72">Nombres:</b></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-auto">
                                                        <input type="text" id="nombre" class="form-control nav-bar-cell1-rev"
                                                               aria-describedby="passwordHelpInline" name="nombre">
                                                    </div>
                                                </td>
                                                <td>

                                                   <div class="col-auto">
                                                        <label for="apellido"
                                                                   class="col-form-label"><b style="color: #177e72">Apellidos:</b></label>
                                                   </div>

                                                </td>
                                                <td>
                                                    <div class="col-auto">
                                                        <input type="text" id="apellido" class="form-control"
                                                               aria-describedby="passwordHelpInline" name="apellido">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="col-auto">
                                                        <label for="dni" class="col-form-label"><b style="color: #177e72">DNI:</b></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-auto">
                                                        <input type="text" id="dni" class="form-control"
                                                               aria-describedby="passwordHelpInline" name="dni">
                                                        <% if(session.getAttribute("msj")!=null){%>
                                                            <div class="alert alert-danger" role="alert">
                                                                <%=session.getAttribute("msj")%>
                                                            </div>
                                                        <% session.removeAttribute("msj");%>
                                                        <%}%>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-auto">
                                                        <label for="celular" class="col-form-label"><b style="color: #177e72">Celular:</b></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-auto">
                                                        <input type="text" id="celular" class="form-control"
                                                               aria-describedby="passwordHelpInline" name="celular">
                                                        <% if(session.getAttribute("msj3")!=null){%>
                                                        <div class="alert alert-danger" role="alert">
                                                            <%=session.getAttribute("msj3")%>
                                                        </div>
                                                        <% session.removeAttribute("msj3");%>
                                                        <%}%>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="col-auto">
                                                        <label for="codigo" class="col-form-label"><b style="color: #177e72">C??digo
                                                            PUCP:</b></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-auto">
                                                        <input type="text" id="codigo" class="form-control"
                                                               aria-describedby="passwordHelpInline" name="codigo">
                                                        <% if(session.getAttribute("msj2")!=null){%>
                                                        <div class="alert alert-danger" role="alert">
                                                            <%=session.getAttribute("msj2")%>
                                                        </div>
                                                        <% session.removeAttribute("msj2");%>
                                                        <%}%>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-auto">
                                                        <label for="correo" class="col-form-label"><b style="color: #177e72">Correo
                                                            PUCP:</b></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-auto">
                                                        <input type="text" id="correo" class="form-control"
                                                               aria-describedby="passwordHelpInline" name="correo">
                                                        <% if(session.getAttribute("msj4")!=null){%>
                                                        <div class="alert alert-danger" role="alert">
                                                            <%=session.getAttribute("msj4")%>
                                                        </div>
                                                        <% session.removeAttribute("msj4");%>
                                                        <%}%>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="col-auto">
                                                        <label for="categoria" class="col-form-label"><b style="color: #177e72">Categor??a
                                                            PUCP:</b></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group mb-3">
                                                        <select class="form-select" id="categoria" name="categoria">
                                                            <option selected value="">Elegir...</option>
                                                            <option value="Alumno">Alumno</option>
                                                            <option value="Profesor">Profesor</option>
                                                            <option value="Jefe de practica">Jefe de p??ctica</option>
                                                            <option value="Seguridad">Seguridad</option>
                                                            <option value="Administrador">Trabajador DTI</option>
                                                        </select>
                                                        <% if(session.getAttribute("msj5")!=null){%>
                                                        <div class="alert alert-danger" role="alert">
                                                            <%=session.getAttribute("msj5")%>
                                                        </div>
                                                        <% session.removeAttribute("msj5");%>
                                                        <%}%>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-auto">
                                                        <label for="rolID" class="col-form-label"><b style="color: #177e72">Rol:</b></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group mb-3">
                                                        <select class="form-select" id="rolID" name="rolID">
                                                            <option selected value="">Elegir...</option>
                                                            <option value="1">seguridad</option>
                                                            <option value="2">usuario pucp</option>
                                                            <option value="3">administrador</option>
                                                        </select>
                                                        <% if(session.getAttribute("msj6")!=null){%>
                                                        <div class="alert alert-danger" role="alert">
                                                            <%=session.getAttribute("msj6")%>
                                                        </div>
                                                        <% session.removeAttribute("msj6");%>
                                                        <%}%>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="d-flex justify-content-center">
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal">
                                            Validar Registro
                                        </button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Se crear??
                                                            un
                                                            nuevo usuario</h5>
                                                        <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="d-flex justify-content-center">
                                                            <h3 style="color:#399934">??Desea Continuar?</h3>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <div class="d-flex justify-content-center">
                                                            <button type="submit" class="btn btn-primary">
                                                                Confirmar
                                                                >
                                                            </button>
                                                            <br>
                                                            <a class="btn btn-primary"
                                                               href="<%=request.getContextPath()%>/ServletAdmin?action=nuevoUsuario"
                                                               role="button"
                                                               style="margin-left: 0rem; background-color:#D12C22 ; border: none;">
                                                                Cancelar</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

        </div>


        <br>
        <br><br>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>
    </body>
</html>