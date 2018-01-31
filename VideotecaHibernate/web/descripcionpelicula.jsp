<%-- 
    Document   : descripcionpelicula
    Created on : 13-ene-2018, 21:13:18
    Author     : Manuel
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Film"%>
<%@page import="modelo.Ayudante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            String id = request.getParameter("categoria");
            Ayudante consulta = new Ayudante();
            List<Film> lista = consulta.getDescripcion(id);

            for (int i = 0; i < lista.size(); i++) {
                Film descripcion = lista.get(i);


        %>
        <p>Titulo <%=descripcion.getTitle()%></p>
        <p>Descripción: <%=descripcion.getDescription()%></p>
       
         <a href="index.jsp">Volver</a>
        <%}%>
        
    </body>
</html>
