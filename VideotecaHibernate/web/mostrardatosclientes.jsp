<%-- 
    Document   : mostrardatosclientes
    Created on : 13-ene-2018, 14:38:52
    Author     : Manuel
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Customer"%>
<%@page import="modelo.Ayudante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int pagina;
    if (request.getParameter("pagina") == null) {
        pagina = 0;
    } else {
        pagina = Integer.parseInt(request.getParameter("pagina"));
    }
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
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Email</th>
            </tr>
            <%
                String id = request.getParameter("nombre");
                String radio = request.getParameter("radio");
                Ayudante consulta = new Ayudante();
                if (radio.equals("act")) {
                    List<Customer> lista = consulta.mostrarClientesActivos(id, pagina);
                    for (int i = 0; i < lista.size(); i++) {
                       // String nombre = lista.get(i).getFirstName();
                        String apellidos = lista.get(i).getLastName();
                        String email = lista.get(i).getEmail();
            %>
            <tr>
                <td><%=lista.get(i).getFirstName() %></td>
                <td><%=apellidos%></td>
                <td><%=email%></td>   
            </tr>

            <%
                }
            %>


            <%
                int numPaginas = consulta.paginacionClientes(id, 10);
                if (numPaginas > 1) {
            %>        
            <tr>
                <td>
                    <%
                        if (pagina > 0) {
                    %>       
                    <a href="mostrardatosclientes.jsp?nombre=<%=id%>&radio=<%=radio%>&pagina=<%=(pagina - 1)%>">anterior</a> 
                    <%
                        }
                    %>
                </td>
                <td>
                    <%
                        if (pagina != (numPaginas - 1)) {
                    %>       
                    <a href="mostrardatosclientes.jsp?nombre=<%=id%>&radio=<%=radio%>&pagina=<%=(pagina + 1)%>">siguiente</a> 
                    <%
                        }
                    %>
                </td>
            </tr>    
            <%
                }
            } else {
                List<Customer> lista = consulta.mostrarClientesInactivos(id);
                for (int i = 0; i < lista.size(); i++) {
                    String nombre = lista.get(i).getFirstName();
                    String apellidos = lista.get(i).getLastName();
                    String email = lista.get(i).getEmail();

            %>
            <tr>
                <td><%=nombre%></td>
                <td><%=apellidos%></td>
                <td><%=email%></td>   
            </tr>

            <%
                    }

                }
            %>
            <a href="index.jsp">Volver</a>






        </table>
    </body>
</html>
