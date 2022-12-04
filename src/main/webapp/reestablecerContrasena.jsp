<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/12/2022
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <title>Recuperar contraseña</title>
  <style>
    body {
      background: url("https://brandemia.org/contenido/subidas/2021/07/01-pucp-peru-imagenes-brandemia-web.jpg");
      background-position: center center;
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      margin: 0;
      height: 100vh;
      bgcolor : "#800000";
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
<body>
<center>
  <br>
  <br>
  <br>
  <div class="card mb-3" style="max-width: 53rem; background-color:#2C53A9">
    <p></p>
    <p></p>
    <h2 style="font-family: 'KrinkesDecorPERSONAL'; color:#E7F8F0" class="card-title"><b>Restablecer la contraseña</b></h2>
    <h6 style="font-family: 'Candara', cursive, sans-serif; color:#e7de71" class="card-subtitle"><b>Por favor, ingrese su nueva contraseña. Esta debe de tener un tamaño de mínimo 8 y máximo 32 caracteres.</b></h6>
      <h6 style="font-family: 'Candara', cursive, sans-serif; color:#e7de71" class="card-subtitle"><b>  Puede sutilizar letras, números y detrminados caracteres especiales o una combinación de ellos.</b></h6>
    <h6 style="font-family: 'Candara', cursive, sans-serif; color:#e7de71" class="card-subtitle"><b>No use el espacio en blanco.</b></h6>
    <br>
    <div class="mb-3 row" align="center">
      <label for="inputPassword" class="col-sm-4 col-form-label">Contraseña Nueva</label>
      <div class="col-sm-10" style="max-width: 33rem">
        <input type="password" class="form-control" id="inputPassword">
      </div>
    </div>
    <div class="mb-3 row" >
      <label for="inputPassword" class="col-sm-4 col-form-label">Confirmar Contraseña Nueva</label>
      <div class="col-sm-10" style="max-width: 33rem">
        <input type="password" class="form-control" id="inputPassword">
      </div>
    </div>
  </div>
  <!-- Button trigger modal -->
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Aceptar
  </button>

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Restablecer Contraseña</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Su contrasña ha sido restablecida correctamente.
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary">Cambios guardados</button>
        </div>
      </div>
    </div>
  </div>
</center>
<br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>