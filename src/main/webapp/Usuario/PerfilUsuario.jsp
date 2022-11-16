<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Perfil USUARIO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/46baa8e193.js" crossorigin="anonymous"></script>
</head>


<body style="background-image: url(resources/Images/background.jpg);
               background-repeat: no-repeat;
               background-position: center center;
               background-attachment: fixed;
               background-size: cover;" class="p-3 m-0 border-0 bd-example">

<nav class="navbar navbar-expand-lg" style="background-color: #458BCA;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logopucp.png" alt="Logo" width="40" height="40" class="d-inline-block align-text-top"><b style="color:#FFFFFF"> GIGACONTROL</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/NuevaIncidencia" style="color:#FFFFFF">Nueva Incidencia</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/MisIncidencias" style="color:#FFFFFF">Mis Incidencias</a>
                </li>
            </ul>
            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/Index"><u style="color:#1A3B85"> <b>Cerrar sesión > </b></u></a>
            </form>
        </div>
    </div>
</nav>

<br><br>

<div class="container" style="max-width: 40rem;">
    <div class="abs-center">
        <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="210rem" style="margin-top: 10px; margin-bottom:-35px">
        <td class="text-center">
            <a type="button" class="btn btn-danger", style="background-color: #ffffff;border-color: #ffffff;border-radius: 60px 60px 60px 60px;margin-left: 270px; margin-bottom:25px">
             <img src="https://img.icons8.com/metro/26/null/camera.png"/>
            </a>
        </td>
        <br>
        <div class="card"style="background-color:#F2F2F3">
            <div class="card-body" >
                <div class="p-1 mb-8 text-white" style="background-color:#47AAB4">
                    <h4 style="text-align: center; color: white; font-family:Giorgia, serif"><b>USUARIO PUCP</b></h4>
                </div>

                <p></p>
                <blockquote class="blockquote mb-0">
                    <h5 style="text-align: center;color:#21547D"><b>ROSA A. SALAZAR CASTILLA</b></h5>
                    <h6 style="text-align: center;">ALUMNO</h6>
                    <h6 style="text-align: center;"><I>Ciencias e Ingeniería</I></h6>
                    <h6 style="text-align: center;">20203368</h6>
                </blockquote>
            </div>
        </div>
    </div>
</div>

<br><br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<br>
<a class="btn btn-primary" href=<%=request.getContextPath()%>/InicioUsuario role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
<br><br>
</body>
</html>