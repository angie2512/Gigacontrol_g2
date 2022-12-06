<%--
  Created by IntelliJ IDEA.
  User: Angie
  Date: 31/10/2022
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <title>Inicie Sesión</title>
  <style>
    body {
      background: url("resources/Images/fondoProyecto_1.png");
      background-position: center center;
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      margin: 0;
      height: 100vh;
      bgcolor = "#800000";
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
    .btn-1{
      display: inline-block;
      background: #749FFA;
      text-decoration: none;
      font-size: 18px;
      padding: 15px 25px;
      color:#305767;
      border-radius: 30px;
      border: none;
    }
    .btn-2{
      display: inline-block;
      background: #CEF8A8;
      text-decoration: none;
      font-size: 18px;
      padding: 15px 25px;
      color:#305767;
      border-radius: 30px;
      border: none;
    }
    @media(min-width: 768px){
      .btn-1{
        padding: 15px 105px;
        background-color: #E3F3FA;
      }
      .btn-2{
        padding: 15px 105px;
        background-color: #E3F3FA;
      }
    }
  </style>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>


</head>

<body class="p-3 m-0 border-0 bd-example">
<table>
  <tr>
  <tr>
  <tr>
  <tr>
    <td>
    <td>
    <td>
    <td>
    <td><img src="resources/Images/logopucp.png" alt="Logo" width="40rem" height="40rem" class="d-inline-block align-text-top"></td>
    <td><h6 style="color:#1F4375; font-family:Giorgia, serif"><b> GIGACONTROL</b><br style="color:#1F4375"> PUCP</h6></td>
    </td>
    </td>
    </td>
    </td>
  </tr>
  </tr>
  </tr>
  </tr>
</table>
<p></p>
<p></p>
<p></p>
<p></p>
<p></p>
<center>
  <div class="card mb-3" style="max-width: 58rem; background-color:#00000090">
    <br>
    <h1 style="font-family: 'KrinkesDecorPERSONAL'; color:#E2FAFF" class="card-title"><b>CREAR CUENTA NUEVA</b></h1>
    <center>
      <img src="https://saludpublica.uchile.cl/dam/jcr:1e8f3e0a-5c5e-4087-b942-987580a7bb82/linea-celeste-final.png" alt="linea" class="card-img" width="90%" height="10%">
    </center>
    <p></p>
    <p></p>
    <h4 style="font-family: 'Times New Roman', Times, serif; color:#78BBFD" class="card-text"><b> Elige una OPCIÓN </b></h4>
    <p></p>
    <!--<div class="d-grid gap-2 col-8 mx-auto mb-2">
      <a href="<%=request.getContextPath()%>/ServletInicio?action=Registrousuario" style="color: rgb(141, 15, 15);"><button class="btn btn-light" type="button" class="btn btn-secondary" style="color:#686B6E;width: 18rem; font-size: 15px"><b>Usuario PUCP</b></button></a>
      <p></p>
      <a href="<%=request.getContextPath()%>/ServletInicio?action=Registroseguridad" style="color: rgb(141, 15, 15);"><button class="btn btn-light" type="button" style="color:#686B6E; width: 18rem; font-size: 15px"><b>Seguridad</b></button></a>
      <p></p>
    </div>-->
    <div class="d-grid gap-2 col-6 mx-auto">
      <a href="<%=request.getContextPath()%>/ServletInicio?action=Registrousuario"><button class="btn-1" type="button" >Usuario PUCP</button></a>
      <a href="<%=request.getContextPath()%>/ServletInicio?action=Registroseguridad"><button class="btn-2" type="button">Seguridad</button></a>
      <br>
    </div>
  </div>
  </div>
</center>
<br></br>
<a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletInicio" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>

</html>