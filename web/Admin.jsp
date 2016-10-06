<%-- 
    Document   : Admin
    Created on : Mar 10, 2016, 2:44:02 PM
    Author     : Sasa.Popovic
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Beans.Administrator" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head> 
    
    <%--<jsp:useBean id="admin" class="Beans.Administrator" scope="session" />--%>
    <% // HttpSession sesija = request.getSession();
        //Administrator adm = (Administrator) sesija.getAttribute("administrator");
        //admin.setIme(adm.getIme());
        //admin.setPrezime(adm.getPrezime());
    %>
    
    
        <frameset rows="50px, *" framespacing="0" border="1" frameborder="1">
            <frame name="meni" src="admMeni.jsp">
            <frame src="admPocetna.jsp" name="promeni">
        </frameset>

</html>
