<%--
  Created by IntelliJ IDEA.
  User: Anais
  Date: 26/11/2022
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
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
            background: url("resources/Images/fondoOscuro.png");
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
<main class="container">
        <center>
            <br>
            <br>
            <br>
            <div class="card mb-3" style="max-width: 58rem; background-color:#00000090; top: 50%; left: 50%; transform: translateY(-50%) translateX(-50%); position: absolute">
                <p></p>
                <p></p>
                <h2 style="font-family: 'KrinkesDecorPERSONAL'; color:#FFFFFF" class="card-title"><b>¿No recuerdas tu contraseña?</b></h2>
                <h6 style="font-family: 'Candara', cursive, sans-serif; color:#e7de71" class="card-subtitle"><b>No te preocupes, nos sucede a todos. Ingresa tu Email y te ayudaremos.</b></h6>
                <br>
                <form>
                    <div class="mb-3 d-grid gap-2 col-8 mx-auto" >
                        <label align= "left" for="exampleInputEmail1" class="form-label" style="color:#FFFFFF">Correo </label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="usuariopucp@pucp.edu.pe">
                    </div>
                    <br>
                    <center><button type="button" class="btn btn-primary">Enviar</button></center>
                </form>
                <a href="<%=request.getContextPath()%>/reestablecerContrasena.jsp">Reestablecer contraseña</a>
            </div>

        </center>
</main>
<br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>
