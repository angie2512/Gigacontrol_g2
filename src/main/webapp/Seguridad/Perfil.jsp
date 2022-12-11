<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Perfil Seguridad</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <style>
      body {
        background: url("https://ambientesdigital.com/wp-content/uploads/2017/07/10-biblioteca-ciencias-ingenieria-arquitectura-pucp-foto-juan-solano-ojasi.jpg");
        background-position: center center;
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        margin: 0;
        height: 100vh;
        bgcolor: "#800000";
      }
      p {
        font-family: Decor;
      }
      .btn-1{
        display: inline-block;
        background: #00000010;
        text-decoration: none;
        font-size: 18px;
        padding: 10px 25px;
        color:#FFFFFF;
        border-radius: 5px;
        border-color: #FFFFFF;
      }
      @media(min-width: 768px){
        .btn-1{
          padding: 10px 35px;
          background-color: #00000010;
        }
      }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

  </head>
  <body class="p-3 m-0 border-0 bd-example">

    <nav class="navbar navbar-expand-lg" style="background-color: #4C9978;" aria-label="Eighth navbar example">
      <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logo_blanco.png" alt="Logo" width="100"
                                              height="40" class="d-inline-block align-text-top img-fluid"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" href="<%=request.getContextPath()%>/ServletSeguridad" aria-current="page" style="color:#FFFFFF">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="<%=request.getContextPath()%>/ServletSeguridad?action=perfil" aria-current="page" style="color:#FFFFFF">Perfil</a>
            </li>
          </ul>

          <ul class="nav col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 justify-content-center mb-md-0">
            <li><a href="#" class="nav-link px-2"><b style="color:white"><%=userlogged.getNombre()%> <%=userlogged.getApellido()%></b></a></li>
            <div class="dropdown text-end">
              <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                <img src="<%=userlogged.getFotoPerfil()==null?"resources/Images/userSeguridad.png":(request.getContextPath()+"/ServletSeguridad?action=mostrarFoto")%>"
                     class="rounded mx-auto d-block " alt="mdo" width="32" height="32"
                     class="rounded-circle">
              </a>
            </div>

          </ul>

        </div>
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u
                  style="color:#FFFFFF"><b>Cerrar sesion > </b></u></a>
        </form>
      </div>
    </nav>

    <br><br>

    <div class="container" style="max-width: 40rem;">
      <div class="abs-center">
        <img src="<%=userlogged.getFotoPerfil()==null?"resources/Images/userSeguridad.png":(request.getContextPath()+"/ServletSeguridad?action=mostrarFoto")%>" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="210rem">
        <br>

        <div class="card"style="background-color:#F2F2F3">
          <div class="card-body" >
            <div class="p-1 mb-8 text-white" style="background-color:#4C9978">
              <h4 style="text-align: center; color: white; font-family:Giorgia, serif"><b>PERSONAL DE SEGURIDAD</b></h4>
            </div>

            <p></p>
            <blockquote class="blockquote mb-0">
              <form method="post" action="<%=request.getContextPath()%>/PerfilUsuario?action=actualizarFoto" enctype="multipart/form-data">
              <h5 style="text-align: center;color:#316F54"><b><%=userlogged.getNombre()%> <%=userlogged.getApellido()%></b></h5>
              <h6 style="text-align: center;"><%=userlogged.getCorreo()%></h6>
              <h6 style="text-align: center;"><%=userlogged.getCodigo()%></h6>
              <input type="file" name="Newphoto">
                <button type="submit">actualizar</button>
            </form>
            </blockquote>
          </div>
        </div>
      </div>
    </div>

    <br><br>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>