<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 26/10/2022
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Admin Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/46baa8e193.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/46baa8e193.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/usuario.css">
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


<!-- termina nav -->
<br><br>

<!--
        <div class="table-responsive">
            <div class="container">
                <div class="d-flex justify-content-center">
                    <table>
                        <tr>
                            <td><img src="resources/Images/usu.png" class="img-fluid" alt="userphoto"
                                     height="200rem" width="200rem"></td>
<%--                            "rounded mx-auto d-block "--%>

                            <td style="padding-left: 2rem;">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><b>Nombres:</b></li>
                                </ul>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><b>Apellidos:</b></li>
                                </ul>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><b>Correo:</b></li>
                                </ul>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><b>DNI:</b></li>
                                </ul>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><b>Celular:</b></li>
                                </ul>
                            </td>
                            <td style="padding-left: 2rem;">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><%=userlogged.getNombre()%>
                                    </li>
                                </ul>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><%=userlogged.getApellido()%>
                                    </li>
                                </ul>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><%=userlogged.getCorreo()%>
                                    </li>
                                </ul>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><%=userlogged.getDni()%>
                                    </li>
                                </ul>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="border-radius: 10%;"><%=userlogged.getCelular()%>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        -->

<!--
        <center>
            <div class="card mb-3 d-flex " style="max-width: 60rem;background-color: #FFFFFF90">
                <div class="row g-0">
                    <div class="col-md-4">
                        <br>
                        <img src="resources/Images/usu.png" class="img-fluid rounded-start" alt="FotoPerfil">

                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <form>
                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label" style="border-radius: 10%;background-color: #FFFFFF"><b>Nombre:</b></label>
                                    <div class="col-sm-10">
                                        <li class="list-group-item" style="border-radius: 10%; background-color: #A2DAE2"><%=userlogged.getNombre()%>
                                        </li>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label" style="border-radius: 10%;background-color: #FFFFFF"><b>Apellidos:</b></label>
                                    <div class="col-sm-10">
                                        <li class="list-group-item" style="border-radius: 10%; background-color: #A2DAE2"><%=userlogged.getApellido()%>
                                        </li>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label" style="border-radius: 10%;background-color: #FFFFFF"><b>Correo:</b></label>
                                    <div class="col-sm-10">
                                        <li class="list-group-item" style="border-radius: 10%;  background-color: #A2DAE2"><%=userlogged.getCorreo()%>
                                        </li>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label" style="border-radius: 10%;background-color: #FFFFFF"><b>DNI:</b></label>
                                    <div class="col-sm-10">
                                        <li class="list-group-item" style="border-radius: 10%; background-color: #A2DAE2"><%=userlogged.getDni()%>
                                        </li>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label" style="border-radius: 10%;background-color: #FFFFFF"><b>Celular:</b></label>
                                    <div class="col-sm-10">
                                        <li class="list-group-item" style="border-radius: 10%; background-color: #A2DAE2"><%=userlogged.getCelular()%>
                                        </li>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </center -->

<!-- otro perfil PRUEBA -->

<main class="container">

       <!-- <div class="row mb-2">
            <div class="col-md-6">
                    <img src="<%=request.getContextPath()%>/ServletAdmin?action=mostrafoto&id=<%=userlogged.getIdUsuario()%>" class="img-fluid rounded float-end" alt="FotoPerfil" style="width: 16rem">
                    <blockquote class="blockquote mb-0">
                        <form method="post" action="<%=request.getContextPath()%>/ServletAdmin?action=actualizarFoto" enctype="multipart/form-data">
                            <input type="file" name="photo">
                            <button type="submit">actualizar</button>
                        </form>
                    </blockquote>
            </div>
            <div class="col-md-6" style="border:none">
                <div class="md-250 position-relative">
                    <div class="col p-4 d-flex flex-column position-static">
                        <h1 class="mb-0"><b style="color:#f8f8f8"><%=userlogged.getNombre()%></b></h1>
                        <h2 class="mb-0"><b style="color:#e1f1eb"><%=userlogged.getApellido()%></b></h2>
                    </div>
                </div>
            </div>

        </div>
    <br>
    <center>
        <div class="card-body" style="max-width: 30rem;">

            <blockquote class="blockquote mb-0">
                <form method="post" action="<%=request.getContextPath()%>/ServletAdmin?action=actualizarFoto" enctype="multipart/form-data">
                    <input type="file" name="photo">
                    <button type="submit">actualizar</button>
                </form>
            </blockquote>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" style="background-color: #FFFFFF"><b>Correo:</b></label>
                    <div class="col-sm-10">
                        <li class="list-group-item" style="background-color: rgba(162,218,226,0.44); color:#FFFFFF"><%=userlogged.getCorreo()%>
                        </li>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" style="background-color: #FFFFFF"><b>DNI:</b></label>
                    <div class="col-sm-10">
                        <li class="list-group-item" style="background-color: rgba(162,218,226,0.44); color:#FFFFFF"><%=userlogged.getDni()%>
                        </li>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" style="background-color: #FFFFFF"><b>Celular:</b></label>
                    <div class="col-sm-10">
                        <li class="list-group-item" style="background-color: rgba(162,218,226,0.44); color:#FFFFFF"><%=userlogged.getCelular()%>
                        </li>
                    </div>
                </div>
        </div>
    </center> -->

    <!-- CARD -->
<center>
    <div class="card " style="max-width: 50rem; background-color:rgba(255,255,255,0.88); border-color: #0b2479;">

        <div class="row g-5">
            <div class="col-md-8">
                <br>
                <center>
                    <!-- IMAGEN DE AQUÍ -->
                    <img src="<%=request.getContextPath()%>/ServletAdmin?action=mostrafoto&id=<%=userlogged.getIdUsuario()%>" class="img-fluid rounded float-end" alt="FotoPerfil" style="max-width: 26rem">
                </center>
            </div>
            <div class="col-md-4">
                <br>
                <p class="display-4 text-start" style="font-family: 'Georgia';color:#233a70;"><b><%=userlogged.getNombre()%></b><b style="color: rgba(0,0,0,0)">..</b></p>
                <h2 class="mb-0"><b style="color:#206181; font-family: 'Felix Titling'"><b style="color: rgba(0,0,0,0)">..</b><%=userlogged.getApellido()%></b><b style="color: rgba(0,0,0,0)">..</b></h2>
                <br>
                <br>
                <h5 style="color: #316F54; font-family: 'Decor'" class="text-start"><b style="color: rgba(0,0,0,0)">..</b><b>Correo</b></h5>
                <p class="text-start"><b style="color: rgba(0,0,0,0); font-family: 'Georgia'">......</b><%=userlogged.getCorreo()%></p>
                <br>
                <h5 style="color: #316F54; font-family: 'Decor'" class="text-start"><b style="color: rgba(0,0,0,0)">..</b><b>DNI</b></h5>
                <p class="text-start"><b style="color: rgba(0,0,0,0); font-family: 'Georgia'">......</b><%=userlogged.getDni()%></p>
                <br>
                <h5 style="color: #316F54; font-family: 'Decor'" class="text-start"><b style="color: rgba(0,0,0,0)">..</b><b>Celular</b></h5>
                <p class="text-start"><b style="color: rgba(0,0,0,0); font-family: 'Georgia'">......</b><%=userlogged.getCelular()%></p>
                <br>
            </div>
        </div>
    </div>
    <!-- FIN CARD -->
</center>
</main>
<br><br>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>
    </body>
</html>