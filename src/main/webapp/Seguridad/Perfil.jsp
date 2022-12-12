<%@ page import="com.example.gigacontrol_g2.beans.BUsuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userlogged" type="com.example.gigacontrol_g2.beans.BUsuarios" scope="session" class="com.example.gigacontrol_g2.beans.BUsuarios"/>

<!doctype html>
<%BUsuarios u= (BUsuarios) session.getAttribute("userlogged");%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <title>Perfil Seguridad</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  <link href="styles.css" rel="stylesheet" />
  <script src="https://kit.fontawesome.com/46baa8e193.js" crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/46baa8e193.js" crossorigin="anonymous"></script>
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
    .main-container {
      width: 100%;
      min-height: 400px;
      margin-top: 10%;
      text-align: center;
    }

    .input-container {
      text-align: center;
      margin: 20px auto;
      padding: 20px;
      overflow: hidden;
      position: relative;
      color: white;
      cursor: pointer;
      border: 2px dashed white;
      border-radius: 20px;
      display: inline-block;
    }

    .input-container [type=file] {
      cursor: inherit;
      display: block;
      font-size: 999px;
      filter: alpha(opacity=0);
      min-height: 100%;
      min-width: 100%;
      opacity: 0;
      position: absolute;
      right: 0;
      text-align: right;
      top: 0;
    }

    .preview-container {
      margin: 0 auto;
      width: 200px;
      min-height: 200px;
      background-color: white;
      padding: 10px;
    }

    .preview-container > img {
      margin: 0;
      width: 100%;
    }

    input[type="file"] {
      display: none;
    }
    .custom-file-upload {
      border: 1px solid #ccc;
      display: inline-block;
      padding: 6px 12px;
      cursor: pointer;
      background-color: white;
    }

    .bottom{
      border-left: 1px;
      margin-left: 110px;
      background-color: white;
      border-radius: 20px;
    }
  </style>

</head>


<body>
<p></p>
<nav class="navbar navbar-expand-lg" style="background-color: #4C9978;" aria-label="Eighth navbar example">
  <div class="container">
    <a class="navbar-brand" ><img src="resources/Images/logo_blanco.png" alt="Logo" width="100"
                                          height="40" class="d-inline-block align-text-top img-fluid"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExample07">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="<%=request.getContextPath()%>/ServletSeguridad" aria-current="page" style="color:#FFFFFF">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="<%=request.getContextPath()%>/ServletSeguridad?action=perfil" aria-current="page" style="color:#FFFFFF">Perfil</a>
        </li>
      </ul>

      <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
        <a class="dropdown-item" href="<%=request.getContextPath()%>/ServletInicio?action=logout"><u
                style="color:#000000"><b>Cerrar sesion > </b></u></a>
      </form>
    </div>
  </div>
</nav>

<br><br>

<div class="container" style="max-width: 40rem;">
  <div class="abs-center">
    <!--
    <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" class="rounded mx-auto d-block " alt="userphoto" height="200rem" max-width="210rem" style="margin-top: 10px; margin-bottom:-35px">
    <td class="text-center"> -->
    <!-- <a type="button" class="btn btn-danger", style="background-color: #ffffff;border-color: #ffffff;border-radius: 60px 60px 60px 60px;margin-left: 270px; margin-bottom:25px" for="inputGroupFile01">
      <img src="https://img.icons8.com/metro/26/null/camera.png"/>
     </a> -->

    <center>
      <!--
      <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
      <label for="file-upload" class="custom-file-upload" style="margin-left: 5px; border-radius: 15px; margin-top: -500px"> -->
      <!--<input id="file-upload" type="file"/>
      <i class="fa fa-pencil-square-o"></i>-->
      <!-- <button type="file" name="" id="file-upload" >SELECCIONA ARCHIVO</button>
       <input type="file" name="" id="file-upload">
   </label> -->
      <!-- <input id="file-upload" type="file"/> -->
      <!-- <button>SELECCIONA ARCHIVO</button>
       <input type="file" name="" id="file-upload" hidden multiple>  -->
      <div class="abs-center">

        <img id="image" src="<%=u.getFotoPerfil()==null?"resources/Images/userSeguridad.png":(request.getContextPath()+"/ServletSeguridad?action=mostrarFoto")%>" class="rounded mx-auto d-block " alt="userphoto" height="240rem" width="210rem">

        <br>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>


        <!--<label for ="imagen" class="custom-file-upload btn btn-danger" title="Subir Foto" style="background-color: #5f6694; border-color: #5f6694" ><i class="fa fa-camera"></i> </label>
        <input id="imagen" class="d-none" type="file" name="imagen" onchange="mostrarimagen();" />-->

        <form method="post" class="text-center" action="<%=request.getContextPath()%>/PerfilUsuario?action=actualizarFoto" enctype="multipart/form-data">

          <label for="file-upload" class="custom-file-upload btn btn-danger" title="Subir Foto" style="background-color: #4C9978; border-color:#4C9978">
            <i class="fa fa-camera"></i>
          </label>
          <input id="file-upload" type="file" name="Newphoto"/>

          <button type="submit" class="btn btn-danger" title="Actualizar", style="background-color: #4C9978; border-color: #4C9978">
            <i class="fa-solid fa-check"></i>
          </button>

        </form>




        <!--<td class="text-center">
            <button class="btn btn-danger" onclick="changeImage()" title="Borrar Foto" style="background-color: #5f6694; border-color: #5f6694">
                <i class="fa-solid fa-trash"></i>
            </button>
            <script>
                    var image = document.querySelector('#image');

                    function changeImage() {
                        image.src = 'resources/Images/userSeguridad.png';
                    }
            </script>

        </td>-->

        </br>


        <br>
        <div class="card" style="background-color:#F2F2F3">
          <div class="card-body" >
            <div class="p-1 mb-8 text-white" style="background-color:#4C9978">
              <h4 style="text-align: center;"><% if(userlogged.getRolId() == 1) {%>
                <td class="text-center"> PERSONAL DE SEGURIDAD</td>
                <%} else if (userlogged.getRolId() == 2){%>
                <td class="text-center">USUARIO PUCP</td>
                <%} else{ %>
                <td class="text-center">ADMINISTRADOR</td>
                <%}%></h4>
            </div>
            <p></p>
            <blockquote class="blockquote mb-0">
              <h5 style="text-align: center;color:#21547D"><b><%=userlogged.getNombre() + " " + userlogged.getApellido()%></b></h5>
              <h6 style="text-align: center;"><%=userlogged.getCorreo()%></h6>
              <h6 style="text-align: center;"><%=userlogged.getCodigo()%></h6>
            </blockquote>

          </div>
        </div>
        </br>
      </div>
    </center>
  </div>

  <br><br>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  <br>
  <!-- AUN NO COLOCAR ATRÁS
<a class="btn btn-primary" href=<%=request.getContextPath()%>/InicioUsuario role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
-->
  <br><br>
</body>
</html>

