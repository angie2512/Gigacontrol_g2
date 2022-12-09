<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>
<%
    BUsuarios u= (BUsuarios) session.getAttribute("userlogged");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Nueva Incidencia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <style>
        body {
            background-image: url("https://ambientesdigital.com/wp-content/uploads/2017/07/10-biblioteca-ciencias-ingenieria-arquitectura-pucp-foto-juan-solano-ojasi.jpg");
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            background-size: cover;" class="p-3 m-0 border-0 bd-example"

        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p></p>
<nav class="navbar navbar-expand-lg" style="background-color: #5f6694;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logopucp.png" alt="Logo" width="40" height="40" class="d-inline-block align-text-top"><b style="color:#FFFFFF"> GIGACONTROL</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/ServletUsuario" style="color:#FFFFFF">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/PerfilUsuario" style="color:#FFFFFF">Perfil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/ServletUsuario?action=listaMisIncidencias" style="color:#FFFFFF">Mis Incidencias</a>
                </li>
            </ul>
            <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2"><b style="color:#211426"><%=userlogged.getNombre() + " " + userlogged.getApellido()%></b></a></li>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="<%=u.getFotoPerfil()==null?"resources/Images/userSeguridad.png":(request.getContextPath()+"/ServletSeguridad?action=mostrarFoto")%>" class="rounded mx-auto d-block " alt="mdo" width="32" height="32" class="rounded-circle">
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
<br>
<br>
<div class="d-flex justify-content-center">
    <div class="col-8">
        <div class="card">
            <div class="card-body" style="max-width: 35rem">
                <center> <h5 class="card-title">INGRESE NUEVA INCIDENCIA</h5></center>
                <form action="<%=request.getContextPath()%>/ServletUsuario?action=registroIncidencia" method="post">
                    <div class=" table-responsive">

                        <div class="input-group mb-3">
                            <span for="inputName" class="input-group-text" id="basic-addon1">Nombre:</span>
                            <input type="text" id="inputName" class="form-control" placeholder="Nombre" name="nombre" aria-describedby="passwordHelpInline">
                        </div>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="inputDescripcion" placeholder="Descripción" name="description" aria-describedby="passwordHelpInline">
                            <span for="inputDescripcion" class="input-group-text" id="basic-addon1">:Descripción</span>
                        </div>
                        <div class="input-group mb-3">
                            <span for="inputZonaPucp" class="input-group-text" id="basic-addon1">Zona PUCP:</span>
                            <input type="text" id="inputZonaPucp" class="form-control" placeholder="zonaPucp" name="zonaPucp" aria-describedby="passwordHelpInline">
                        </div>
                        <div class="input-group mb-3">
                            <input type="text" id="inputUbica" class="form-control" placeholder="Ubicacion" name="Ubicacion" aria-describedby="passwordHelpInline">
                            <span for="inputUbica" class="input-group-text" id="basic-addon1">:Ubicación</span>
                        </div>

                        <div class="input-group mb-3">
                            <label for="tipoIncidencia" class="input-group-text" >Tipo de incidencia</label>
                            <select class="form-select" id="tipoIncidencia" name="tipoIncidenciaID">
                                <option selected>Seleccionar...</option>
                                <option value="1">Robo</option>
                                <option value="2">Objeto perdido</option>
                                <option value="3">Infraestructura en mal estado</option>
                                <option value="4">Ambulancia PUCP</option>
                                <option value="5">Accidente</option>
                                <option value="6">Otros...</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <select class="form-select" id="nivelUrgencia" name="nivelUrgenciaID">
                                <option selected>Seleccionar...</option>
                                <option value="1">Leve</option>
                                <option value="2">Moderado</option>
                                <option value="3">Crítico</option>
                            </select>
                            <label class="input-group-text" for="nivelUrgencia">Nivel de Urgencia</label>
                        </div>


                        <div class="col-auto">
                            <label for="imagen" class="col-form-label">Insertar Foto:</label>
                        </div>
                            <div class="input-group mb-3" style="max-width: 20rem">
                                <label class="input-group-text" for="imagen"><img src="https://img.icons8.com/metro/26/null/camera.png"/></label>
                                <input type="file" class="form-control" id="imagen">
                            </div>


                        <div class="d-flex justify-content-center">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">Enviar
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Se registrará una nueva Incidencia</h5>
                                            <button type="button" class="btn-close"
                                                    data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="d-flex justify-content-center">
                                                <h3 style="color:#5397DF">¿Desea Continuar?</h3>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="d-flex justify-content-center">
                                                <button type="submit" class="btn btn-primary">Confirmar</button>
                                                <br><a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletUsuario?action=nuevaIncidencia"
                                                       role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;">
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
<!-- Modal
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
                                                <a class="btn btn-primary" href="<%=request.getContextPath()%>/InicioUsuario" role="button" style="margin-left: 0.5rem; background-color: grey; border: none;">Listo</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

-->

</body>

</html>