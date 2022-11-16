<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 26/10/2022
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session"/>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Registro de usuarios</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body style="background-image: url(resources/Images/background.jpg);
               background-repeat: no-repeat;
               background-position: center center;
               background-attachment: fixed;
               background-size: cover;">
<nav class="navbar navbar-expand-lg" style="background-color: #131950;" aria-label="Eighth navbar example">
  <div class="container">
    <a class="navbar-brand" href="/AdminInicio.jsp"><img src="resources/Images/logopucp.png" alt="Logo" width="40" height="40" class="d-inline-block align-text-top"><b style="color:#FFFFFF"> GIGACONTROL</b></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExample07">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="<%=request.getContextPath()%>/ServletAdmin?action=Inicio" aria-current="page" href="#" style="color:#FFFFFF">Inicio</a>
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
        <li><a href="<%=request.getContextPath()%>/ServletAdmin?action=Inicio" class="nav-link px-2"><b style="color:#1A3B85"><%=userlogged.getNombre().toUpperCase() + " " +userlogged.getApellido().toUpperCase()%></b></a></li>
        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
            <img src="resources/Images/usu.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
        </div>
      </ul>

      <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
        <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio"><u style="color:#1A3B85"> <b>Cerrar sesión > </b></u></a>
      </form>

    </div>
  </div>

</header>

<div class="d-inline p-3" style="font-size: 1.5rem;background-color:#347199;"><b style="color:#FFFFFF; font-family:'Palatino Linotype','Book Antiqua',Palatino, serif"> REGISTRO</b></div>
<br><br><br>
<div class="d-flex justify-content-center">

  <table>

    <tr>
      <td>
        <img src="resources/Images/usu.png" class="rounded mx-auto d-block " alt="userphoto" height="230rem" width="230rem">
      </td>
      <td><td><td><td><td><td>
      <td>
        <div class="card">
          <div class="card-body">
            <form method="post" action="<%=request.getContextPath()%>/ServletAdmin?action=guardar">
            <table>
              <tr>
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
                    <input type="text" class="form-control"   id="nombre" name="nombre"  value="">
                  </ul>
                  <br>
                  <ul class="list-group list-group-flush">
                    <input type="text" class="form-control"   id="apellido" name="apellido"  value=" ">
                  </ul>
                  <br>
                  <ul class="list-group list-group-flush">
                    <input type="text" class="form-control"   id="dni" name="dni"  value="">
                  </ul>
                  <br>
                  <ul class="list-group list-group-flush">
                    <input type="text" class="form-control"   id="celular" name="celular"  value="">
                  </ul>
                </td>
              </tr>
            </table>

            <table>
              <tr>
                <br>
                <td>
                <td>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item" style="border-radius: 10%;">Código PUCP:</li>
                  </ul>
                </td>
                </td>
                <td>
                <td>
                  <ul class="list-group list-group-flush">
                    <input type="text" class="form-control"   id="codigo" name="codigo"  value="">
                  </ul>
                </td>
                </td>
                <td>
                <td>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item" style="border-radius: 10%;">Correo PUCP:</li>
                  </ul>
                </td>
                </td>
                <td>
                <td>
                  <ul class="list-group list-group-flush">
                    <input type="text" class="form-control"   id="correo" name="correo"  value="">
                  </ul>
                </td>
                </td>
              </tr>
              <tr>
                <td>
                <td>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item" style="border-radius: 10%;">Categoria PUCP</li>
                  </ul>
                </td>
                </td>
                <td>
                <td>
                  <br>
                  <div class="input-group mb-3">
                    <select class="form-select" id="categoria" name="categoria">
                      <option selected>Elegir...</option>
                      <option value="1">Alumno</option>
                      <option value="2">Profesor</option>
                      <option value="3">Jefe de páctica</option>
                      <option value="4">Administrativo</option>
                    </select>
                  </div>
                </td>
                </td>
                <td>
                <td>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item" style="border-radius: 10%;">Rol:</li>
                  </ul>
                </td>
                </td>
                <td>
                <td>
                  <br>
                  <div class="input-group mb-3">
                    <select class="form-select" id="rolID" name="rolID">
                      <option selected>Elegir...</option>
                      <option value="1">seguridad</option>
                      <option value="2">usuario pucp</option>
                      <option value="3">administrador</option>
                    </select>
                  </div>
                </td>
                </td>
              </tr>
            </table>
            <div class="d-flex justify-content-center">
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Validar Registro
              </button>
              <!-- Modal -->
              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Se creará un nuevo usuario</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <div class="d-flex justify-content-center">
                        <h3 style="color:#399934">¿Desea Continuar?</h3>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary">Confirmar</button>
                        <br>
                        <a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletAdmin?action=nuevoUsuario" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> Cancelar </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
         </form>
        </div>
      </td>
    </tr>

  </table>
</div>
<br>
<br><br>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>