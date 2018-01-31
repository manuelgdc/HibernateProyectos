<%-- 
    Document   : index
    Created on : 10-ene-2018, 20:08:22
    Author     : Manuel
--%>

<%@page import="modelo.Category"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Store"%>
<%@page import="modelo.Ayudante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Videoteca</h1>
        <form action="mostrardatosnegocio.jsp">
            Video Club
            <select name="nombre">
                <%
                    Ayudante consulta = new Ayudante();
                    List<Store> lista = consulta.mostrarVideoClub();
                    for (int i = 0; i < lista.size(); i++) {
                %>
                <option value="<%=lista.get(i).getStoreId()%>">
                    <%=lista.get(i).getNombre()%>
                </option>
                <%
                    }
                %>
            </select>
            <h3>DATOS DEL NEGOCIO</h3>
            <input type="radio" name="radio" value="negocio" />Datos del negocio
            <br><input type="radio" name="radio" value="empleado" />Datos de los empleados
            <br><input type="submit" value="mostrar" name="mostrar" />               
        </form>
            <p>----------------------------------------------------------------------</p>
            
            
        <form action="mostrardatosclientes.jsp">
            Video Club
            <select name="nombre">
                <%
                     consulta = new Ayudante();
                     lista = consulta.mostrarVideoClub();
                    for (int i = 0; i < lista.size(); i++) {
                %>
                <option value="<%=lista.get(i).getStoreId()%>">
                    <%=lista.get(i).getNombre()%>
                </option>
                <%
                    }
                %>
            </select>
            <h3>GESTION DE CLIENTES</h3>
            <input type="radio" name="radio" value="act" />listado de clientes activos
            <br><input type="radio" name="radio" value="ina" />Listado de clientes inactivos
            <br><input type="submit" value="mostrar" name="mostrar" /> 
        </form>
            <p>----------------------------------------------------------------------</p>
            
            
        <form action="mostrarinventario.jsp">
            Video Club
            <select name="nombre">
                <%
                     consulta = new Ayudante();
                     lista = consulta.mostrarVideoClub();
                    for (int i = 0; i < lista.size(); i++) {
                %>
                <option value="<%=lista.get(i).getStoreId()%>">
                    <%=lista.get(i).getNombre()%>
                </option>
                <%
                    }
                %>
            </select>
            <h3>GESTION DE INVENTARIOS</h3>
            Categoria de peliculas:
            <select name="categoria">
                <%
                    List<Category> lista2 = consulta.mostrarCategorias();
                    for (int i = 0; i < lista2.size(); i++) {
                %>
                <option value="<%=lista2.get(i).getCategoryId()%>">
                    <%=lista2.get(i).getName()%>
                </option>
                <%
                    }
                %>
            </select>
            <input type="submit" value="mostrar" name="mostrar" />
        </form>
    </body>
</html>
