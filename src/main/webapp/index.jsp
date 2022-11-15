<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bienvenid@ GigaControl</title>
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
        <td><img src="resources/Images/logopucp.png" alt="Logo" width="40rem;" height="40rem" class="d-inline-block align-text-top"></td>
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
            <h1 style="font-family: 'KrinkesDecorPERSONAL'; color:#E2FAFF" class="card-title"><b>BIENVENID@ A GIGACONTROL</b></h1>
            <h6 style="font-family: 'Comic Sans MS', cursive, sans-serif; color:#FFFFFF" class="card-subtitle mb-2 text-muted">Servicio de ayuda a incidencias en la comunidad PUCP</h6>
            <center>
                <img src="https://saludpublica.uchile.cl/dam/jcr:1e8f3e0a-5c5e-4087-b942-987580a7bb82/linea-celeste-final.png" alt="linea" class="card-img" width="90%" height="10%">
            </center>
            <p></p>
            <p></p>
            <h4 style="font-family: 'Times New Roman', Times, serif; color:#78BBFD" class="card-text"><b> SELECCIONE LA OPCIÓN </b></h4>
            <br>
            <div class="d-grid gap-2 col-6 mx-auto">
                <a href=<%=request.getContextPath()%>/InicioDeSesion style="color: rgb(141, 15, 15);"><button class="btn btn-light btn-lg" type="button" style="color:#686B6E; font-size:16px">Iniciar Sesión</button></a>
                <a href=<%=request.getContextPath()%>/Registro style="color: rgb(141, 15, 15);"><button class="btn btn-light btn-lg" type="button" style="color:#686B6E; font-size: 17px;">Registrarse</button></a>
                <br>
            </div>
        </div>
    </div>
<center>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>

</html>
