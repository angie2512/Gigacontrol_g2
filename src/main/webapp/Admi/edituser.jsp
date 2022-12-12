<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 26/10/2022
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="request"/>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>
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
        <li class="nav-item">
          <a class="nav-link active" href="<%=request.getContextPath()%>/ServletAdmin?action=nuevoUsuario" aria-current="page" href="#" style="color:#FFFFFF">Registrar Usuario</a>
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
        <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u style="color:#FFFFFF"> <b>Cerrar sesión > </b></u></a>
      </form>
    </div>
  </div>
</nav>

<br>
<br>


<!-- CARD RESPONSIVE  -->

<main class="container">
    <div class="d-flex justify-content-center">
      <div class="card">
        <div class="card-body">
          <div class="row g-5">
          <!-- IMAGEN -->
          <div class="col-md-4">
            <%if(user.getFotoPerfil()!=null){%>
            <img src="<%=request.getContextPath()%>/ServletAdmin?action=mostrafoto&id=<%=user.getIdUsuario()%>" class="rounded mx-auto d-block img-fluid"  height="200rem" width="200rem">
            <%}
            else{%>
            <img src="resources/Images/usu.png" class="rounded mx-auto d-block img-fluid"  height="200rem" width="200rem">
            <%}%>
            <br>
            <div class="d-flex justify-content-center">
              <% if(user.getEstado()==5){%>
              <a type="button" class="btn btn-success"
                 onclick="return confirm('¿Estas seguro(a) que deseas reactivar este usuario?')"
                 href="<%=request.getContextPath()%>/ServletAdmin?action=reactivar&id=<%=user.getIdUsuario()%>">Reactivar Usuario
              </a>
              <%}
              else if(user.getEstado()==1 || user.getEstado()==4){%>
              <a type="button" class="btn btn-warning"
                 onclick="return confirm('¿Estas seguro(a) que deseas desbloquear este usuario?')"
                 href="<%=request.getContextPath()%>/ServletAdmin?action=banear&id=<%=user.getIdUsuario()%>">Bloquear
              </a>
              <a type="button" class="btn btn-info"
                 onclick="return confirm('¿Estas seguro(a) que deseas borrar este usuario?')"
                 href="<%=request.getContextPath()%>/ServletAdmin?action=borrar&id=<%=user.getIdUsuario()%>">Eliminar
              </a>
              <%}%>

              <% if(user.getRolId()==3 && user.getEstado()==9){%>
              <a type="button" class="btn btn-success"
                 href="<%=request.getContextPath()%>/ServletAdmin?action=HabilitarAdmin&id=<%=user.getIdUsuario()%>">Habilitar Admin
              </a>
              <%}%>


            </div>
          </div>
          <!-- IMAGEN -->


          <div class="col-md-8">
            <form method="post" action="<%=request.getContextPath()%>/ServletAdmin?action=actualizar">

              <div class="mb-3 row">
                  <input type="text" class="form-control"   id="id" name="id"  value="<%=user.getIdUsuario()%>" hidden>
              </div>


              <div class="mb-3 row">
                <label for="nombre" class="col-sm-5 col-form-label">Nombre</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control"   id="nombre" name="nombre"  value="<%=user.getNombre()%>">
                </div>
              </div>

              <div class="mb-3 row">
                <label for="apellido" class="col-sm-5 col-form-label">Apellido</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control"   id="apellido" name="apellido" value="<%=user.getApellido()%>">
                </div>
              </div>

              <div class="mb-3 row">
                <label for="dni" class="col-sm-5 col-form-label">DNI</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control"  id="dni" name="dni"  value="<%=user.getDni()%>">
                </div>
              </div>

              <div class="mb-3 row">
                <label for="codigo" class="col-sm-5 col-form-label">Código PUCP</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control"  id="codigo" name="codigo"  value="<%=user.getCodigo()%>">
                </div>
              </div>

              <div class="mb-3 row">
                <label for="correo" class="col-sm-5 col-form-label">Correo PUCP</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control"   id="correo" name="correo"  value="<%=user.getCorreo()%>">
                </div>
              </div>

              <div class="mb-3 row">
                <label for="categoria" class="col-sm-5 col-form-label">Categoría PUCP</label>
                <div class="col-sm-7">
                  <ul class="list-group list-group-flush">
                    <select class="form-select" id="categoria" name="categoria" title="MUUU">
                      <option selected ><%=user.getCategoria()%></option>
                      <option value="Alumno">Alumno</option>
                      <option value="Profesor">Profesor</option>
                      <option value="Jefe de páctica">Jefe de páctica</option>
                      <option value="Seguridad">Seguridad</option>
                      <option value="Trabajador DTI">Trabajador DTI</option>
                    </select>
                  </ul>
                </div>
              </div>

              <div class="mb-3 row">
                <label for="rolID" class="col-sm-5 col-form-label">Rol</label>
                <div class="col-sm-7">
                  <ul class="list-group list-group-flush">
                    <select class="form-select" id="rolID" name="rolID">
                      <%String i;
                        if(user.getRolId()==1){
                          i="Seguridad";
                        }
                        else if(user.getRolId()==2){
                          i="Usuario Pucp";
                        }
                        else{
                          i="Administrador";
                        }%>
                      <option selected value="<%=user.getRolId()%>">
                        <%=i%>
                      </option>
                      <option value="1">seguridad</option>
                      <option value="2">usuario pucp</option>
                      <option value="3">administrador</option>
                    </select>

                  </ul>
                </div>
              </div>
              <button type="submit" class="btn btn-primary">Actualizar</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<br>
<a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
<br><br>
</body>
</html>