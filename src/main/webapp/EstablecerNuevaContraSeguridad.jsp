
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>
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

    <title>Establecer Nueva Contraseña</title>
    <style>
      body {
        background: url("https://files.pucp.education/puntoedu/wp-content/uploads/2020/04/17221616/explanada-cia-2.jpg");
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

    <br>
    <center>
      <div class="card mb-3" style="max-width: 58rem; background-color:rgba(0,0,0,0.1);top: 50%; left: 50%; transform: translateY(-50%) translateX(-50%); position: absolute">
        <br>
        <img src="resources/Images/logo_vertical.png" alt="Logo" width="155rem;" height="178rem" class="rounded mx-auto d-block">
        <br>
        <h2 style="font-family: 'Times New Roman', Times, serif; color:#E2FAFF" class="card-title"><b>ESTABLECER NUEVA CONTRASEÑA</b></h2>
        <br>
        <h6 style="font-family: 'Times New Roman', Times, serif; color:#C6D6F5" class="card-text"><b> Ingrese
          Su Nueva Contraseña </b></h6>
        <h6 style="font-family: 'Times New Roman', Times, serif; color:darkblue" class="card-text"><b> "Se Recomienda Que Su Nueva Contraseña Sea De Minimo 8 Caracteres en donde Utilize Numeros,Letras,Mayusculas y Simbolos" </b></h6>
        <p></p>
        <form method="post" class="form-signin" action="<%=request.getContextPath()%>/ServletInicio?action=establecernuevacontraseg">
          <div class="d-grid gap-2 col-12 mx-auto form-floating">
            <input type="hidden" name="idUsuarioLog" value="<%=userlogged.getIdUsuario()%>">
            <input type="password" class="form-control" id="contrasena" placeholder="Contraseña"
                   name="contrasena1">
            <label for="contrasena" style="font-family: 'Georgia'">Contraseña</label>
          </div>
          <p></p>
          <p></p>
          <p></p>
          <div class="d-grid gap-2 col-12 mx-auto form-floating">
            <input type="password" class="form-control" id="contrasena" placeholder="Confirmar Contraseña"
                   name="contrasena2">
            <label for="contrasena" style="font-family: 'Georgia'">Confirmar Contraseña</label>
          </div>
          <br>
          <p></p>
          <% if (session.getAttribute("errorSeg2") != null) {%>
          <div class="text-danger mb-2"><%=session.getAttribute("errorSeg2")%></div>
          <% session.removeAttribute("errorSeg2"); %>
          <% } %>
          <br>
          <div class="d-grid gap-2 col-8 mx-auto">
            <button type="submit" class="btn-1" style="font-family: 'Georgia'">
              <h6>Ingresar</h6>
            </button>
          </div>
          <p></p>
        </form>
        <br>
      </div>

      </div>
    </center>

    <!--<a class="btn btn-primary" href="< %=request.getContextPath()%>/ServletInicio" role="button"
           style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>


  </body>

</html>