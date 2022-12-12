<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    BUsuarios u = (BUsuarios) session.getAttribute("userlogged");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0);

%>



<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <title>Admin Inicio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <style>
            body {
                background: url("resources/Images/FONDOclaro.png");
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
</head>
<body>
    <p></p>

        <!-- nav -->
        <nav class="navbar navbar-expand-lg" style="background-color: #131950;" aria-label="Eighth navbar example">
            <div class="container">
                <a class="navbar-brand"><img src="resources/Images/logo_blanco.png" alt="Logo" width="100"
                                                      height="40" class="d-inline-block align-text-top img-fluid"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample07">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="<%=request.getContextPath()%>/ServletAdmin?action=Inicio" aria-current="page" style="color:#FFFFFF">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active"  href="<%=request.getContextPath()%>/ServletAdmin?action=ListaUsuarios" aria-current="page" href="#" style="color:#FFFFFF">Usuarios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="<%=request.getContextPath()%>/ServletAdmin?action=nuevoUsuario" aria-current="page" href="#" style="color:#FFFFFF">Registrar Usuario</a>
                        </li>
                    </ul>



                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u style="color:#FFFFFF"> <b>Cerrar sesión > </b></u></a>
                    </form>
                </div>
            </div>
        </nav>

<br><br>

    <div class="container" style="max-width: 40rem;">
            <div class="abs-center">
                <center>
                    <div class="abs-center">
                        <img src="<%=request.getContextPath()%>/ServletAdmin?action=mostrafoto&id=<%=userlogged.getIdUsuario()%>" class="rounded img-fluid" alt="userphoto" height="200rem" width="210rem">
                        <br>
                        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
                        <br>
                        <br>
                        <div class="card" style="max-width: 30rem;background-color:#F2F2F3">
                            <div class="card-body">
                                <div class="p-1 mb-8 text-white" style="background-color:#efd199">
                                    <h4 style="text-align: center; color: #9b5e2e; font-family:Giorgia, serif">
                                        <b><%=userlogged.getCategoria()%>
                                        </b></h4>
                                </div>

                                <p></p>
                                <blockquote class="blockquote mb-0">
                                    <h5 style="text-align: center;color:#21547D; font-family: 'Georgia'"><%=userlogged.getNombre() + " " + userlogged.getApellido()%>
                                    </h5>
                                    <h6 style="text-align: center;font-family: 'Georgia'"><%=userlogged.getCategoria()%>
                                    </h6>
                                    <h6 style="text-align: center;font-family: 'Georgia'"><%=userlogged.getCodigo()%>
                                    </h6>
                                </blockquote>
                            </div>
                        </div>
                        <br>
                    </div>
                </center>
            </div>

        </div>

        <br><br>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>
    </body>
</html>
