<%-- 
    Document   : editCategory
    Created on : 15-may-2022, 22:51:21
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setAttribute("page-name", "Categorias"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
        <title>Admin Categorias</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-nowrap">
                <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
                <jsp:include page="components/header.jsp"/>
                </div>
                <div class="col py-3">
                    <h1 class="mb-4">Crear categoria</h1>
                    <form action="SubmitCreate" method="POST">
                        <div class="row mb-3">
                          <label for="id" class="col-sm-2 col-form-label">Nombre</label>
                          <div class="col-sm-6">  
                            <input type="text" class="form-control" name="name">
                          </div>
                        </div>
                        
                        <button type="submit" class="btn btn-primary mt-4">Guardar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
