<%--
  Created by IntelliJ IDEA.
  User: Angie
  Date: 26/10/2022
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin-Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body style="background-image: url(Images/background.jpg);
               background-repeat: no-repeat;
               background-position: center center;
               background-attachment: fixed;
               background-size: cover;">
<nav class="navbar navbar-expand-lg" style="background-color: #131950;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="Images/logopucp.png" alt="Logo" width="40" height="40" class="d-inline-block align-text-top"><b style="color:#FFFFFF"> GIGACONTROL</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="InicioAdmi.jsp" aria-current="page" href="#" style="color:#FFFFFF">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="perfil.jsp" aria-current="page" href="#" style="color:#FFFFFF">Perfil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active"  href="usuarios.jsp" aria-current="page" href="#" style="color:#FFFFFF">Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="registroAdmi.jsp" aria-current="page" href="#" style="color:#FFFFFF">Registrar Usuario</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br>
<header class="p-3 mb-3 border-bottom" style="background-color: #FFFFFF">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2"><b style="color:#1A3B85">SEBASTIAN G. SEGURA ABANTO</b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="Images/usu.png" alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                </div>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href="Inicio.html"><u style="color:#1A3B85"> <b>Cerrar sesión > </b></u></a>
            </form>

        </div>
    </div>

</header>
<br><br><br>
<div class="d-flex justify-content-center">
    <div class="card">
        <div class="card-body">
            <table>
                <tr>
                    <td><img src="https://i.pinimg.com/236x/9a/d5/13/9ad5135b8df800a80f61a92a5afe158f.jpg" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="200rem">
                        <br>
                        <div class="d-flex justify-content-center">
                            <button type="button" class="btn btn-danger">Eliminar Usuario</button>
                        </div>
                    </td>
                    <td style="padding-left: 2rem;">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:#346A99"><b>Nombres:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:#346A99"><b>Apellidos:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:#346A99"><b>DNI:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:#346A99"><b>Codigo PUCP:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:#346A99"><b>Correo PUCP:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:#346A99"><b>Categoria PUCP:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:#346A99"><b>Rol:</b></li>
                        </ul>
                    </td>
                    <td style="padding-left: 2rem;">
                        <ul class="list-group list-group-flush">
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="Lucía">
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="Segura Abanto">
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="72622878">
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="20203368">
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="a20203368@pucp.edu.pe">
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="Estudiante">
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="Usuario PUCP">
                        </ul>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<br></br>
<a class="btn btn-primary" href="usuarios.html" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
<br><br>
</body>
</html>
