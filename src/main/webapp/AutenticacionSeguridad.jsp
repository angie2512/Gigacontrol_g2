<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String codigoAutenticacion = (String) request.getAttribute("Codigo"); %>
<!--< jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>
-->

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

        <title>Autenticación Seguridad</title>
        <style>
            body {
                background: url("resources/Images/fondoOscuro.png");
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
        <!-- <table>
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
                <h2 style="font-family: 'KrinkesDecorPERSONAL'; color:#E2FAFF" class="card-title"><b>AUTENTICACIÓN DE USUARIO SEGURIDAD</b></h2>
                <center>
                    <img src="https://saludpublica.uchile.cl/dam/jcr:1e8f3e0a-5c5e-4087-b942-987580a7bb82/linea-celeste-final.png"
                         alt="linea" class="card-img" width="90%" height="10%">
                </center>
                <p></p>
                <p></p>
                <h5 style="font-family: 'Times New Roman', Times, serif; color:#C6D6F5" class="card-text"><b> Ingrese el Código de Autenticación Enviado a su Correo
                     </b></h5>
                <p></p>
                <form method="post" class="form-signin" action="<%=request.getContextPath()%>/ServletInicio?action=autenticacionSeguridad">
                    <div class="d-grid gap-2 col-8 mx-auto form-floating mb-3">
                        <input type="hidden" name="codigoAutenticacion" value="<%=codigoAutenticacion%>">
                        <input type="numbers" class="form-control" id="codigoAutenticacionIngresado" placeholder="Código de Autenticación" name="codigoAutenticacionIngresado">
                        <label for="codigoAutenticacionIngresado">Código de Autenticación</label>
                    </div>
                    <p></p>
                    <p></p>
                    <% if (session.getAttribute("error2") != null) {%>
                    <div class="text-danger mb-2"><%=session.getAttribute("error2")%></div>
                    <% session.removeAttribute("error2"); %>
                    <% } %>
                    <div class="d-grid gap-2 col-3 mx-auto">
                        <button type="submit" class="btn btn-primary">
                            Ingresar
                        </button>
                    </div>
                    <p></p>
                </form>
                <br>
            </div>
            </div>
        </center>
        <br> -->
       <!-- <a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletInicio" role="button"
           style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a> -->


        <!-- PREUBA -->
        <center>
            <div class="card mb-3" style="max-width:40rem ;background-color:rgba(61,58,58,0.7);  top: 50%; left: 50%; transform: translateY(-50%) translateX(-50%); position: absolute">
                <div class="card-header">
                    <img src="resources/Images/logo_blanco.png" alt="Logo" width="145rem;" height="48rem"
                         class="rounded float-start img-fluid">
                </div>
                <div class="card-body">
                    <center>
                        <h3 style="font-family: 'Georgia' " class="card-title"><b style="color:#e5d29c;">AUTENTICACIÓN DE USUARIO SEGURIDAD</b></h3>
                        <h6 style="color:#b6d58f" class="card-subtitle mb-2">Ingrese el Código de Autenticación Enviado a su Correo</h6>
                        <br>
                        <div class="d-grid gap-2 mx-auto">
                            <form method="post" class="form-signin" action="<%=request.getContextPath()%>/ServletInicio?action=autenticacionSeguridad">
                                <div class="d-grid gap-2 col-8 mx-auto form-floating mb-3">
                                    <input type="hidden" name="codigoAutenticacion" value="<%=codigoAutenticacion%>">
                                    <input type="numbers" class="form-control" id="codigoAutenticacionIngresado" placeholder="Código de Autenticación" name="codigoAutenticacionIngresado">
                                    <label for="codigoAutenticacionIngresado">Código de Autenticación</label>
                                </div>
                                <p></p>
                                <p></p>
                                <% if (session.getAttribute("error2") != null) {%>
                                <div class="text-danger mb-2"><%=session.getAttribute("error2")%></div>
                                <% session.removeAttribute("error2"); %>
                                <% } %>
                               <!-- <div class="d-grid gap-2 col-3 mx-auto">
                                    <button type="submit" class="btn btn-primary">
                                        Ingresar
                                    </button>
                                </div> -->
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                    <button type="submit" class="btn btn-primary">
                                        Ingresar
                                    </button>
                                    <a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletInicio" role="button"
                                       style="margin-left: 0rem; background-color:#D12C22 ; border: none;">Atrás </a>
                                </div>
                                <p></p>
                            </form>
                        </div>
                    </center>
                </div>
            </div>
        </center>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
                crossorigin="anonymous"></script>

    </body>

</html>