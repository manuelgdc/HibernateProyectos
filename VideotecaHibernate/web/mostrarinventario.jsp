<%-- 
    Document   : mostrarinventario
    Created on : 13-ene-2018, 20:11:30
    Author     : Manuel
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Film"%>
<%@page import="modelo.Ayudante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int pagina;
    if (request.getParameter("pagina") == null) {
        pagina = 0;
    } else {
        pagina = Integer.parseInt(request.getParameter("pagina"));
    }
    String ct = request.getParameter("nombre");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td>categoria: <%=ct%></td>
                
            </tr>
            <tr>
                <td>pelicula</td>
                <td></td>
                
            </tr>
            <%
                String id = request.getParameter("nombre");
                String categoria = request.getParameter("categoria");
                Ayudante consulta = new Ayudante();
                List<Film> lista = consulta.getPeliculaPorCategoria(id, categoria, pagina);
                String nombre;
                int peliId;
                
                for (int i = 0; i < lista.size(); i++) {
                    nombre = lista.get(i).getTitle();
                    peliId = lista.get(i).getFilmId();

            %>
            
            <tr>
                
                <td><%=nombre%></td>
                <td> <a href="descripcionpelicula.jsp?categoria=<%=peliId%>"> <button>Mas informacion</button> </a></td>
            </tr>
            <%
                }
            %>

            <%
                int numPaginas = consulta.paginacionCategoria(categoria, 10);
                if (numPaginas > 1) {
            %>
            <tr>
                <td>
                    <%
                        if (pagina > 0) {
                    %>       
                    <a href="mostrarinventario.jsp?nombre=<%=id%>&categoria=<%=categoria%>&pagina=<%=(pagina - 1)%>">anterior</a> 
                    <%
                        }
                    %>
                </td>
                <td>
                    <%
                        if (pagina != (numPaginas - 1)) {
                    %>       
                    <a href="mostrarinventario.jsp?nombre=<%=id%>&categoria=<%=categoria%>&pagina=<%=(pagina + 1)%>">siguiente</a> 
                    <%
                        }
                    %>
                </td>
            </tr>  
            <%
                }
            %>
        </table>
        <a href="index.jsp">Volver</a>
    </body>
</html>
