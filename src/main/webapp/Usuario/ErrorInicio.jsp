<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <title>Error</title>
    <style>
        body {
            background: url("https://s3.amazonaws.com/files.pucp.edu.pe/puntoedu/wp-content/uploads/2021/03/31184656/campus-pucp-cia-letras-2020_03-1920x1080-1-1536x864.jpg");
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

    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>


</head>

<body>
<table>
    <tr>
    <tr>
    <tr>
    <tr>
        <td>
        <td>
        <td>
        <td>
        <td><img src="Images/logopucp.png" alt="Logo" width="47" height="47" class="d-inline-block align-text-top"></td>
        <td><h6 style="color:#051D57; font-family:Giorgia, serif"><b> GIGACONTROL</b><br style="color:#051D57"> <strong>PUCP </strong></h6></td>
        </p>
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
    <div class="card" style="width: 48rem; background-color:#00000090">
        <p></p>
        <p></p>
        <h1 style="font-family: 'KrinkesDecorPERSONAL'; color:#E2FAFF" class="card-title"><b>INICIO DE SESIÓN</b></h1>
        <center>
            <img src="https://pngimage.net/wp-content/uploads/2018/05/cuadrado-azul-png-5.png" alt="linea" width="520" height="6">
        </center>
        <p></p>
        <p></p>
        <h4 style="font-family: 'Times New Roman', Times, serif; color:#78BBFD" class="card-text"><b> Ingrese sus DATOS </b></h4>
        <p></p>
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
            <symbol id="exclamation-triangle-fill" viewBox="0 0 16 16">
                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
            </symbol>
        </svg>
        <div class="alert alert-danger d-flex align-items-center d-grid gap-0 col-7 mx-auto" role="alert">
            <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"></use></svg>
            <div>
                <b>ERROR</b> al ingresar, ingrese de nuevo sus datos
            </div>
        </div>
        <div class="d-grid gap-2 col-8 mx-auto form-floating mb-3">
            <input type="numbers" class="form-control" id="floatingInput" placeholder="20203589">
            <label for="floatingInput">Código de Usuario</label>
        </div>
        <div class="d-grid gap-2 col-8 mx-auto form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Contraseña</label>
        </div>
        <p></p>
        <p></p>
        <button class="d-grid gap-1 col-2 mx-auto btn btn-primary" type="button">Ingresar</button>
        <p></p>
    </div>
    </div>
</center>
</body>

</html>