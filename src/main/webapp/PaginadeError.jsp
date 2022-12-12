<%--
  Created by IntelliJ IDEA.
  User: Anais
  Date: 26/11/2022
  Time: 09:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>P@gina@ Error!</title>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<p></p>
<nav class="navbar navbar-expand-lg" style="background-color: #231e1e;" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="resources/Images/logo_blanco.png" alt="Logo" width="100"
                                              height="40" class="d-inline-block align-text-top img-fluid"></a>
    </div>

</nav>



<body>

    <center>
    <div class="card mb-3" style="max-width: 100rem; height: 40rem; background-color:#00000090; top: 50px;">
        <br>
        <h1 style="font-family: 'KrinkesDecorPERSONAL'; color:#E2FAFF" class="card-title"><b>Oh no! Hay un problema</b></h1>
        <h3 style="font-family: 'KrinkesDecorPERSONAL'; color:#E2FAFF" class="card-title">¡Dale clic al botón que te redirige al login! o Inténtalo más tarde</h3>
        <div class="spinner-border text-danger" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
        <center>
            <img src="https://toppng.com/public/uploads/thumbnail/homero-11529080094wjpkdyozs5.png" alt="linea" class="card-img-2">
            <a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletInicio" role="button" style="margin-left: 0rem ; background-color:#D12C22 ; border: none;"> LOGIN </a>
        </center>
        <br>
    </div>
    <center>

</body>
</html>
