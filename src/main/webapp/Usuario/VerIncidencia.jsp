<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Ver incidencia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
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
            src: url( KrinkesDecorPERSONAL.ttf);
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
                <li><a href="#" class="nav-link px-2"><b style="color:#1A3B85">ROSA A. SALAZAR CASTILLA</b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                </div>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u
                        style="color:#FFFFFF"><b>Cerrar sesion > </b></u></a>
            </form>
        </div>
    </div>
</nav>
<br>

<div class="d-inline p-3" style="font-size: 1.5rem;background-color:#347199;"><b style="color:#FFFFFF; font-family:'Palatino Linotype','Book Antiqua',Palatino, serif"> MI INCIDENCIA</b></div>
<br><br><br>
<div class="d-flex justify-content-center">

    <table>
        <tr>
            <td>
                <div class="card" style="width: 50rem">
                    <br>
                    <div class="card-body">
                        <center><h3>Dejé mi laptop y desaparecio</h3></center>
                        <br>
                        <table>
                            <tr>

                                <td>
                                        <td>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item" style="border-radius: 10%;">Nombres:</li>
                                            </ul>
                                            <br>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item" style="border-radius: 10%;">Apellidos:</li>
                                            </ul>
                                            <br>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item" style="border-radius: 10%;">DNI:</li>
                                            </ul>
                                            <br>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item" style="border-radius: 10%;">Celular:</li>
                                            </ul>

                                        </td>
                                        <td style="padding-left: 1rem;">
                                            <ul class="list-group list-group-flush">
                                                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="">
                                            </ul>
                                            <br>
                                            <ul class="list-group list-group-flush">
                                                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value=" ">
                                            </ul>
                                            <br>
                                            <ul class="list-group list-group-flush">
                                                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="">
                                            </ul>
                                            <br>
                                            <ul class="list-group list-group-flush">
                                                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="">
                                            </ul>
                                        </td>
                                </td>
                                    <td style="padding-left: 2rem;">
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>Nivel de Urgencia</option>
                                            <option value="1">Leve</option>
                                            <option value="2">Moderado</option>
                                            <option value="3">Critico</option>
                                        </select>

                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item" style="border-radius: 10%;">Estado:</li>
                                            <input class="form-control" type="text" placeholder="Atendido" aria-label="Disabled input example" disabled>
                                        </ul>

                                        <br>
                                            <div class="card">
                                                <div class="card-body">
                                                    El problema fue atendido siguiendo las normas de la universidad
                                                </div>
                                            </div>
                                        <br>
                                        <div class="card">
                                            <div class="card-body">
                                                ¿Está de acuerdo con el estado de la incidencia?
                                            </div>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                De acuerdo
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                                Desacuerdo
                                            </label>
                                        </div>
                                        <br>
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
                                            <label for="floatingTextarea">Escribir un comentario...</label>
                                        </div>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <center><button type="button" class="btn btn-danger">Enviar</button></center>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<br>
<a class="btn btn-primary" href="<%=request.getContextPath()%>/InicioUsuario" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
<br><br>

</body>
</html>