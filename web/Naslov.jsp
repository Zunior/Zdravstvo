<%-- 
    Document   : Naslov
    Created on : Mar 23, 2016, 2:58:23 PM
    Author     : Sasa.Popovic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <jsp:useBean id="admin" class="Beans.Administrator" scope="session" />
    <%
        String ime = admin.getIme();
        String prezime =admin.getPrezime();
    %>
    
        <h2>Dobrodošli ${admin.ime}</h2>
        
    </body>
</html>
