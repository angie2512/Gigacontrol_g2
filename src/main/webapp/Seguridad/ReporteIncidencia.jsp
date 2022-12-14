<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page import="com.example.gigacontrol_g2.beans.Incidencia" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Incidencia incidencia = (Incidencia) request.getAttribute("incidencia2");%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Reporte Incidencia</title>
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
      p {
        font-family: Decor;
      }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>


  </head>
  <body>
  <br>
    <nav class="navbar navbar-expand-lg" style="background-color: #434644;" aria-label="Eighth navbar example">

      <div class="collapse navbar-collapse" id="navbarsExample07">
        <div id="center"><viewer-page-selector style="--page-length-digits:2;"></viewer-page-selector>
          <span class="vertical-separator"></span><span id="zoom-controls">
			<cr-icon-button iron-icon="pdf:remove" title="Reducir" aria-label="Reducir" aria-disabled="false" role="button" tabindex="0">
			</cr-icon-button><input type="text" value="100%" aria-label="Nivel de zoom">
			<cr-icon-button iron-icon="pdf:add" title="Acercar" aria-label="Acercar" aria-disabled="false" role="button" tabindex="0">
			</cr-icon-button></span><span class="vertical-separator"></span>
          <cr-icon-button id="fit" aria-label="Ajustar a p??gina" title="Ajustar a p??gina" aria-disabled="false" role="button" tabindex="0" iron-icon="pdf:fit-to-height"></cr-icon-button><cr-icon-button iron-icon="pdf:rotate-left" dir="ltr" aria-label="Girar hacia la izquierda" title="Girar hacia la izquierda" aria-disabled="false" role="button" tabindex="0"></cr-icon-button></div>
      </div>
    </nav>
    <div class="d-flex justify-content-center">
      <div class="card">
        <div class="card-body">
          <div class="card" style="width:850px">
            <div class="card-body">
              <table style="display: flex">
                <tbody>
                  <tr>
                    <td>
                      <h2 class="card-text"><b style="color:#2C3166"><%=incidencia.getNombreDeIncidencia()%></b></h2>
                    </td>
                  </tr>
                </tbody>
              </table>
              <br>
              <table style="display:flex">
                <tr>
                  <td><h6 class="card-text" style="color:#B1120D;padding-right: 5rem;margin-right:40px"><b>ESTADO: <%=incidencia.getEstado().getNombre()%></b></h6>
                  </td>
                  <td style="background-color:#DAD9BA"><h6>Nivel de urgencia: <b><%=incidencia.getNivelDeUrgencia().getNombre()%></b></h6>
                  </td>
                </tr>
              </table>
              <br>
              <table>
                <tr>
                  <td><img src="resources/Images/userSeguridad.png" class="rounded mx-auto d-block " alt="userphoto" height="60rem" width="60rem"></td>
                  <td style="padding-left: 2rem; color:#2C3166"><p class="card-text"><b><%=incidencia.getUsuario().getApellido()%>, <%=incidencia.getUsuario().getNombre()%> </b>
                    <b style="color:#B1120D; padding-left: 2rem;"><%=incidencia.getUsuario().getCodigo()%></b>
                    <b style="color:#C0C4C7; padding-left: 2rem;"><%=incidencia.getUsuario().getCategoria()%></b></p>
                  </td>
                  <td>
                    <b style="color:#B1120D; padding-left: 4.2rem;">Resoluci??n de Incidencia:</b>
                  </td>
                </tr>

              </table>
              <form method="post" action="<%=request.getContextPath()%>/subirfoto" enctype="multipart/form-data">
                <input type="file" name="foto">
                <button type="btn" name="">Subir foto</button>
              </form>
              <br>
              <div style="display:flex">
                <div>
                  <table>
                    <tr>
                      <td style="padding-left: 0rem; color:#2C3166"><p class="card-text"><b>Tipo de Incidencia: </b> <%=incidencia.getTipoDeIncidencia().getNombre()%>
                        <b style="color:#F0C00D; padding-left: 8rem;">??? Destacados</b>
                        <b style="padding-left: 3rem;">???? 15 </b></p></td>
                    </tr>

                  </table>
                  <br>
                  <table>
                    <tr>
                      <td>
                        <h6><%=incidencia.getDescripcion()%></h6>
                      </td>
                    </tr>
                  </table>
                  <br>
                  <table>
                    <tr><td><h6 style="color:#274362"><b>Zona PUCP:</b> <%=incidencia.getZonaPucp()%></h6></td></tr>
                  </table>
                  <br>
                  <table>
                    <tr>
                      <td>
                        <p style="padding-left: 2rem;color:#274362"><b> Foto de Incidencia </b></p>
                      </td>
                      <td>
                        <p style="padding-left: 4rem;color:#274362"><b> Ubicaci??n:</b></p>
                      </td>
                      <td>
                        <button type="button" class="btn btn-warning" style="margin-left:5px;margin-bottom:10px">Haga Click Aqu??</button>
                      </td>
                    </tr>
                  </table>
                  <table>
                    <tr>
                      <td>
                        <img src="https://files.pucp.education/puntoedu/wp-content/uploads/2021/02/23074448/espacios-de-estudio-005-5000x3333.jpg" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="200rem" style="padding-left: 2rem;">

                      </td>
                      <td>
                        <img src="https://img.freepik.com/vector-premium/mapa-punto-ubicacion-destino_34645-957.jpg?w=2000" class="rounded mx-auto d-block " alt="userphoto" height="200rem" width="200rem"style="padding-left: 2rem;">
                      </td>
                    </tr>
                  </table>
                </div>
                <div class="card" style="height:500px;width:260px;margin-left:40px;">
                  <div class="card-body">
                    <p class="card-text">Se Realizaron todas las medidas Posibles</p>
                  </div>
                </div>
              </div>
              <br>

              <table>
                <br>
                <div class="card">
                  <h5 class="card-header">Comentario Actual del Usuario</h5>
                  <div class="card-body">
                    <p class="card-text">Ok conforme</p>
                  </div>
                </div>
                <br>

                <div class="card">
                  <h5 class="card-header">Comentarios Anteriores </h5>
                  <div class="card-body">
                    <ol>
                      <li>
                        <p>No estoy de acuerdo</p>
                      </li>
                      <li>
                        <p>Aun no me encuentro de acuerdo</p>
                      </li>
                      <li>
                        <p>Tampoco estoy de acuerdo</p>
                      </li>
                    </ol>
                  </div>
                </div>
              </table>
            </div>
          </div>
          <br>

        </div>
      </div>
      <div class="card" style="width:350px;margin-left:20px">
        <h5 class="card-header">Resoluciones de Incidencia</h5>
        <div class="card-body">
          <ol>
            <li class="card-text">
              <p>Se revisaron las camaras de Seguridad</p>
            </li>
            <li class="card-text">
              <p>Se encontro un sospechoso</p>
            </li>
            <li class="card-text">
              <p>Se encontro un modelo similar en biblioteca central sydjdasj dasjd saj dasdsa </p>
            </li>
          </ol>
        </div>
      </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>


