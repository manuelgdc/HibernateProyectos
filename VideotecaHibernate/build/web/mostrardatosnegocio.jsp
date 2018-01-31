<%-- 
    Document   : mostrardatosnegocio
    Created on : 10-ene-2018, 22:09:39
    Author     : Manuel
--%>

<%@page import="modelo.Staff"%>
<%@page import="modelo.Country"%>
<%@page import="modelo.Address"%>
<%@page import="modelo.City"%>
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
        <%
            String nombre = request.getParameter("nombre");
            String radio = request.getParameter("radio");
            if (radio.equals("negocio")) {
                Ayudante consulta = new Ayudante();
                List<Store> lista = consulta.mostrarDatosNegocio(nombre);
                Store nomb;
                Address direccion;
                City ciudad;
                Country pais;

                for (int i = 0; i < lista.size(); i++) {
                    nomb = lista.get(i);
                    direccion = nomb.getAddress();
                    ciudad = direccion.getCity();
                    pais = ciudad.getCountry();
        %>
        <p> Nombre: <%=nomb.getNombre()%></p>
        <p> Direccion: <%=direccion.getAddress()%></p>
        <p> Ciudad: <%=ciudad.getCity()%></p>
        <p> Pais: <%=pais.getCountry()%>  </p>       

        <a href="index.jsp">Volver</a>
        <%
            }
        } else {
            Ayudante consulta = new Ayudante();
            List<Staff> lista = consulta.mostrarDatosCliente(nombre);
            Staff nomb;
            Address direccion;
            City ciudad;
            Country pais;
            for (int i = 0; i < lista.size(); i++) {
                nomb = lista.get(i);
                direccion = nomb.getAddress();
                ciudad = direccion.getCity();
                pais = ciudad.getCountry();
        %>
        <p> Empleado <%=nomb.getFirstName() + " " + nomb.getLastName()%></p>
        <p> Direccion: <%=direccion.getAddress()%></p>
        <p> Ciudad: <%=ciudad.getCity()%></p>
        <p> Pais: <%=pais.getCountry()%>  </p>  
        <a href="index.jsp">Volver</a>
        <%                }
            }
        %>




    </body>
</html>
