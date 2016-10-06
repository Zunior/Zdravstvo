<%-- 
    Document   : Pacijent
    Created on : Mar 10, 2016, 2:42:45 PM
    Author     : Sasa.Popovic
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Beans.Pacijent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="PAC/Pacijent.css"/>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>Korisnik</title>
    </head>
    
    <!--Podaci ulogovanog korisnika-->
    <jsp:useBean id="pacijent" class="Beans.Pacijent" scope="session" />
    <jsp:setProperty property="*" name="pacijent"/>
    
    
    
    <body>
        <div class="container-fluid" id="header">
            <div class="row">
                <div class="col-sm-4">
                    <h4 align="left"><p id="log">Korisnik</p></h4>
                    <form name="povratak" method="post" action="index.jsp">
                        <button type="submit" class="btn-danger">Logout</button>
                    </form>
                </div>
                <div class="col-sm-8">
                    <p id="naslov">Dobrodošli ${pacijent.ime} ${pacijent.prezime}</p>
                </div>
            </div>
        </div>
                
        <div class="container-fluid" id="opcije">
            
            <div class="uvuceno">
                <form name="odabir1" method="post" action="PacijentIstorijat">
                    <button type="submit" class="btn btn-primary btn-block btn-xl" id="pretraga" name="pretraga"><span>Istorijat lecenja</span></button>
                    <!--<input type="submit" name="pretraga" value="Pretraga pacijenata" />-->
                </form>
            </div>
        </div>
              
</html>
