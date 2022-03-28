<%-- 
    Document   : addProduct
    Created on : 28-mar-2022, 10:52:53
    Author     : jean-
--%>

<%@page import="eguay.entity.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eguay - Añadir Producto</title>
    </head>
    
    <%
        List<Category> categoryList = (List) request.getAttribute("categoryList");

        %>
    
    <body>
        <h1>Página para añadir un producto en venta!</h1>
        
        <h3>Información del producto</h3>
        <div>
            <form method="POST" action="AddProductForSaleServlet">
                Título:<input type="text" name="title" value=""/>
                Descripción:<input type="text" name="description" value=""/>
                URL Foto:<input type="text" name="fotourl" value=""/>
                Precio Inicial:<input type="text" name="startprice" value=""/>
                Categoría:
                <select name="category">
                    <%  for(Category category : categoryList)
                        {
                    %>
                        <option><%= category.getName()%></option>
                    <%
                        }
                    %>
                </select>
                <input type="submit" value="Añadir"/>
            </form>
        </div>
    </body>
</html>
