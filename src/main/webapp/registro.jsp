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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <title>Inicie Sesión</title>
  <style>
    body {
      background: url("https://files.pucp.education/puntoedu/wp-content/uploads/2021/03/31184656/campus-pucp-cia-letras-2020_03-1920x1080-1.jpg");
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
<!--<table>
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
<p></p> -->
<center>
  <div class="card mb-3" style="max-width: 58rem; background-color:rgba(255,255,255,0.70); top: 50%; left: 50%; transform: translateY(-50%) translateX(-50%); position: absolute">
    <div class="card-header">
      <img src="resources/Images/LOGO_azul.png" alt="Logo" width="145rem;" height="48rem" class="rounded float-start img-fluid">
    </div>
    <div class="card-body">
      <h1 style="font-family: 'KrinkesDecorPERSONAL'; color:#488ca2" class="card-title"><b>CREAR CUENTA NUEVA</b></h1>
      <br>
      <h6 style="font-family: 'Georgia'">Elige la opción que desees realizar</h6>
      <p></p>
      <!--<div class="d-grid gap-2 col-8 mx-auto mb-2">
        <a href="<%=request.getContextPath()%>/ServletInicio?action=Registrousuario" style="color: rgb(141, 15, 15);"><button class="btn btn-light" type="button" class="btn btn-secondary" style="color:#686B6E;width: 18rem; font-size: 15px"><b>Usuario PUCP</b></button></a>
        <p></p>
        <a href="<%=request.getContextPath()%>/ServletInicio?action=Registroseguridad" style="color: rgb(141, 15, 15);"><button class="btn btn-light" type="button" style="color:#686B6E; width: 18rem; font-size: 15px"><b>Seguridad</b></button></a>
        <p></p>
      </div>-->
      <div class="d-grid gap-2 mx-auto">
        <a href="<%=request.getContextPath()%>/ServletInicio?action=Registrousuario"><button class="btn-1" type="button" >Usuario PUCP</button></a>
        <a href="<%=request.getContextPath()%>/ServletInicio?action=Registroseguridad"><button class="btn-2" type="button">Seguridad</button></a>
        <br>
      </div>
    </div>
  </div>
</center>
<br>
<!--<a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletInicio" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>

</html>