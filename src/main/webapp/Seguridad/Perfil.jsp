<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <nav class="navbar navbar-expand-lg" style="background-color: #4C9978;" aria-label="Eighth navbar example">
      <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logopucp.png" alt="Logo" width="40" height="40" class="d-inline-block align-text-top"><b style="color:#FFFFFF"> GIGACONTROL</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" href="<%=request.getContextPath()%>/ServletSeguridad?action=listarIncidencia" aria-current="page" style="color:#FFFFFF">Inicio</a>
            </li>
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
        <img src="resources/Images/userSeguridad.png" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="210rem">
        <br>
        <div class="card"style="background-color:#F2F2F3">
          <div class="card-body" >
            <div class="p-1 mb-8 text-white" style="background-color:#4C9978">
              <h4 style="text-align: center; color: white; font-family:Giorgia, serif"><b>PERSONAL DE SEGURIDAD</b></h4>
            </div>

            <p></p>
            <blockquote class="blockquote mb-0">
              <h5 style="text-align: center;color:#316F54"><b>CRISTIAN DOMINGUEZ CASTRO</b></h5>
              <h6 style="text-align: center;">cristian_dc29@outlook.es</h6>
              <h6 style="text-align: center;">20172238</h6>
            </blockquote>
          </div>
        </div>
      </div>
    </div>

    <br><br>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>