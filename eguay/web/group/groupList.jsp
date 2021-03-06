<%-- 
    Document   : groupList
    Created on : Apr 19, 2022, 11:09:27 AM
    Author     : Pedro Antonio Benito Rojano
--%>

<%@page import="eguay.dto.GroupDTO"%>
<%@page import="java.util.List"%>
<%@page import="eguay.entity.Groups"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../cabecera.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Grupos</title>
    </head>
    <body>
        <h1>Lista de Grupos</h1>

        <form>
            <table>
                <tr>
                    <th>Nombre del Grupo</th>
                    <th>Seleccionados</th>
                </tr>
                <%
                    for (GroupDTO group : (List<GroupDTO>) request.getAttribute("groupList")) {
                %>
                <tr>
                    <td><a href="ShowSelectedGroup?id=<%=group.getId()%>"><%=group.getName()%></a></td>
                    <td><input type="checkbox" name="selectedGroup" value="<%=group.getId()%>"/></td>
                </tr>
                <%
                    }
                %>
            </table>
            <button type="submit" formaction="RemoveGroups">Eliminar Seleccionados</button>
            <button type="submit" formaction="NewGroupFromSelectedGroups">Nuevo Grupo con los grupos seleccionados</button>
            <button type="submit" formaction="ShowCreateNewGroupPage">Crear nuevo grupo</button>
        </form>
    </body>
</html>
