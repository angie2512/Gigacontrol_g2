<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Crear Nueva Cuenta</title>
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
        <td><img src="../resources/Images/logopucp.png" alt="Logo" width="47" height="47" class="d-inline-block align-text-top"></td>
        <td><h6 style="color:#051D57; font-family:Giorgia, serif"><b> GIGACONTROL</b><br style="color:#051D57"> <strong>PUCP </strong> </h6></td>
        <td width="1200px" ></td>
        <td><a class="dropdown-item" href=<%=request.getContextPath()%>/Registro><u style="color:#1A3B85"> <b> Volver </b></u></a></td>
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
    <div class="card" style="width: 40rem; background-color:#00000090">
        <p></p>
        <p></p>
        <h2 style="font-family: 'KrinkesDecorPERSONAL'; color:#FFFFFF" class="card-title"><b>CREAR CUENTA NUEVA</b></h2>
        <h6 style="font-family: 'Candara', cursive, sans-serif; color:#e7de71" class="card-subtitle"><b>SEGURIDAD</b></h6>
        <center>
            <img src="https://pngimage.net/wp-content/uploads/2018/05/cuadrado-azul-png-5.png" alt="linea" width="520" height="6">
        </center>
        <p></p>
        <p></p>
        <form>
            <div class="mb-3 d-grid gap-2 col- mx-auto" >
                <div class="mb-3 d-grid gap-2 col-8 mx-auto" >
                    <label align= "left" for="exampleInputEmail1" class="form-label" style="color:#FFFFFF">Correo </label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="seguridad@hotmail.com" style="color:#686B6E; width: 28rem; font-size: 15px">
                </div>
                <div class="d-flex justify-content-center">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Enviar
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Registro Completo</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="d-flex justify-content-center">
                                        <table>
                                            <td>
                                                <h1 style="font-family: 'Times New Roman', Times, serif; color:#4fe474" class="card-title" align="center"><font size= 7><b>LISTO!</b></font></h1>
                                                <h4 style="font-family: 'Comic Sans MS', cursive, sans-serif; color:#e68750" class="card-subtitle" align="center"><b>Ya falta poco...</b></h4>
                                                <p></p>
                                                <h6 style="font-family: 'Times New Roman', Times, serif; color:#000000" class="card-subtitle" align="center">Como último paso, ingrese al Link</h6>
                                                <h6 style="font-family: 'Times New Roman', Times, serif; color:#000000" class="card-subtitle" align="center">enviado a su correo electronico </h6>
                                                <h6 style="font-family: 'Times New Roman', Times, serifS; color:#000000" class="card-subtitle" align="center">y establezca su nueva contraseña.</h6>
                                            <td>
                                            <td>
                                                <img src="https://www.seguridad111.com/images/d.png" alt="Logo Paideia" width="200" lign="right">
                                            </td>
                                        </table>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="d-flex justify-content-center">
                                        <a class="btn btn-primary" href=<%=request.getContextPath()%>/Index role="button" style="margin-left: 0.5rem; background-color: rgb(62, 181, 228); border: none;">OK</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </div>
    </div>

    </form>
    </div>
    </div>
</center>
<br></br>

</body>

</html>