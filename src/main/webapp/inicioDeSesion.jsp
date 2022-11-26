<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
              crossorigin="anonymous">

        <title>Iniciar Sesión</title>
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

            @font-face {
                font-family: Decor;
                src: url(KrinkesRegularPERSONAL.ttf);
                font-style: italic;
            }

            p {
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
                <td><img src="resources/Images/logopucp.png" alt="Logo" width="40rem" height="40rem"
                         class="d-inline-block align-text-top"></td>
                <td><h6 style="color:#1F4375; font-family:Giorgia, serif"><b> GIGACONTROL</b><br style="color:#1F4375">
                    PUCP</h6></td>

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
                <p></p>
                <p></p>
                <h2 style="font-family: 'KrinkesDecorPERSONAL'; color:#E2FAFF" class="card-title"><b>INICIO DE
                    SESIÓN</b></h2>
                <center>
                    <img src="https://saludpublica.uchile.cl/dam/jcr:1e8f3e0a-5c5e-4087-b942-987580a7bb82/linea-celeste-final.png"
                         alt="linea" class="card-img" width="90%" height="10%">
                </center>
                <p></p>
                <p></p>
                <h5 style="font-family: 'Times New Roman', Times, serif; color:#C6D6F5" class="card-text"><b> Ingrese
                    sus DATOS </b></h5>
                <p></p>
                <form method="post" class="form-signin" action="<%=request.getContextPath()%>/ServletInicio">
                    <div class="d-grid gap-2 col-8 mx-auto form-floating mb-3">
                        <input type="numbers" class="form-control" id="codigo" placeholder="Código" name="codigo">
                        <label for="codigo">Código de Usuario</label>
                    </div>
                    <div class="d-grid gap-2 col-8 mx-auto form-floating">
                        <input type="password" class="form-control" id="contrasena" placeholder="Contraseña"
                               name="contrasena">
                        <label for="contrasena">Contraseña</label>
                    </div>
                    <p></p>
                    <p></p>
                    <% if (request.getParameter("error") != null) {%>
                    <div class="text-danger mb-2">Hubo un Error en su Codigo o Contraseña , Vuelva a Ingresar</div>
                    <% } %>
                    <!-- <a href="< %=request.getContextPath()%>/InicioSeguridad"><button class="d-grid gap-1 col-2 mx-auto btn btn-primary" type="button">Ingresar</button></a> -->
                    <div class="d-grid gap-2 col-3 mx-auto">
                        <button type="submit" class="btn btn-primary">
                            Ingresar
                        </button>
                    </div>
                    <a href="<%=request.getContextPath()%>/OlvidasteTuContraseña">¿Olvidaste tu Contraseña?</a>
                </form>
                <br>
            </div>
            </div>
        </center>
        <br>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletInicio" role="button"
           style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
                crossorigin="anonymous"></script>

    </body>

</html>