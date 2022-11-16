<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <title>Nueva Incidencia</title>
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
<nav class="navbar navbar-expand-lg" style="background-color: #458BCA;" aria-label="Eighth navbar example">
    <div class="container">
        <table>
            <tr>
                <th><a class="navbar-brand" href="InicioUsuario.jsp"><img src="resources/Images/logopucp.png" alt="Logo"
                                                                          width="40"
                                                                          height="40"
                                                                          class="d-inline-block align-text-top"><b
                        style="color:#FFFFFF"> GIGACONTROL</b></a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button></th>
            </tr>
            <tr>
                <td><ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="#" class="nav-link px-2"><b style="color:#1A3B85">CRISTIAN DOMINGUEZ CASTRO</b></a></li>
                    <div class="dropdown text-end">
                        <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                            <img src="resources/Images/userSeguridad.png" alt="mdo" width="32" height="32" class="rounded-circle">
                        </a>
                    </div>
                </ul></td>
                <td><div class="collapse navbar-collapse" id="navbarsExample07">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active"
                               href="<%=request.getContextPath()%>/InicioUsuario"
                               aria-current="page" href="#" style="color:#FFFFFF">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="<%=request.getContextPath()%>/PerfilUsuario"
                               aria-current="page" href="#" style="color:#FFFFFF">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active"
                               href="<%=request.getContextPath()%>/MisIncidencias"
                               aria-current="page" href="#" style="color:#FFFFFF">Mis Incidencias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active"
                               href="<%=request.getContextPath()%>/NuevaIncidencia" aria-current="page"
                               href="#" style="color:#FFFFFF">Nueva Incidencia</a>
                        </li>
                    </ul>
                </div></td>
                <td>                            </td>
                <td>                            </td>
                <td>                            </td>
                <td>           <div class="d-flex flex-wrap align-items-center justify-content-right justify-content-lg-start">
                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio"><u
                                style="color:#FFFFFF"><b>Cerrar sesión > </b></u></a>
                    </form>
                </div>
                </td>

            </tr>
        </table>

    </div>
</nav>
<br>
<%--
<header class="p-3 mb-3 border-bottom" style="background-color: #FFFFFF">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2"><b style="color:#1A3B85">ROSA A. SALAZAR CASTILLA</b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                </div>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <a class="dropdown-item" href=<%=request.getContextPath()%>/Index><u style="color:#1A3B85"> <b>Cerrar sesión > </b></u></a>
            </form>

        </div>
    </div>
</header>
--%>
<br>
<center>
<h3 style="color:#051D57; font-family:'Trebuchet MS',Helvetica, sans-serif"> <b> NUEVA INCIDENCIA </b> </h3>
</center>
<br><br>
<div class="d-flex justify-content-center">
    <table>
        <tr>
            <td>
                <div class="card">
                    <div class="card-body">
                        <table>
                            <tr>
                                <td>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="border-radius: 10%;">Nombre:</li>
                                    </ul>
                                    <br>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="border-radius: 10%;">Descripción:</li>
                                    </ul>
                                    <br>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="border-radius: 10%;">Zona PUCP:</li>
                                    </ul>
                                    <br>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="border-radius: 10%;">Ubicación:</li>
                                    </ul>
                                </td>
                                <td style="padding-left: 1rem;">
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
                                    <br>
                                    <ul class="list-group list-group-flush">
                                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="">
                                    </ul>
                                </td>
                                <td>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="border-radius: 10%;">Tipo de incidencia: </li>
                                    </ul>
                                    <br>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="border-radius: 10%;">Nivel de Urgencia:</li>
                                    </ul>
                                    <br>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="border-radius: 10%;">Insertar Foto:</li>
                                    </ul>
                                </td>
                                <td>
                                    <div class="input-group mb-3">
                                        <select class="form-select" id="inputGroupSelect01">
                                            <option selected>Seleccionar...</option>
                                            <option value="1">Robo</option>
                                            <option value="2">Objeto perdido</option>
                                            <option value="3">Infraestructura en mal estado</option>
                                            <option value="2">Ambulancia PUCP</option>
                                            <option value="3">Accidente</option>
                                            <option value="4">Otros...</option>
                                        </select>
                                    </div>
                                    <br>
                                    <div class="input-group mb-3">
                                        <select class="form-select" id="inputGroupSelect01">
                                            <option selected>Seleccionar...</option>
                                            <option value="1">Leve</option>
                                            <option value="2">Moderado</option>
                                            <option value="3">Crítico</option>
                                        </select>
                                    </div>
                                    <br>
                                    <ul class="list-group list-group-flush">
                                        <input type="file" id="imagen" class="btn btn-light">
                                    </ul>
                                </td>
                            <br>
                        </table>
                        <br>

                        <div class="d-flex justify-content-center">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color:#C91B1B">
                                Enviar
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Registro Completo</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="d-flex justify-content-center">
                                                <h3 style="color:#399934">Nueva Incidencia Registrada</h3>
                                                <img src="resources/Images/check-png.webp" class="rounded mx-auto d-block " alt="userphoto" height="37rem" width="50rem">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="d-flex justify-content-center">
                                                <a class="btn btn-primary" href=<%=request.getContextPath()%>/InicioUsuario role="button" style="margin-left: 0.5rem; background-color: grey; border: none;">Listo</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>