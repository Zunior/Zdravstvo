<%-- 
    Document   : LOPuneto
    Created on : Sep 6, 2016, 1:47:52 PM
    Author     : sasha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Podaci ulogovanog korisnika-->
<%--<jsp:useBean id="lekar" class="Beans.Lekar" scope="session" />
<jsp:setProperty property="*" name="lekar"/>--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="LOP\LOPuneto.css"/>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>LOP uneto</title>
    </head>
    <body>
        <div class="container-fluid" id="header">
            <div class="row">
                <div class="col-sm-3">
                    <h4 align="left"><p id="log">dr. ${lekar.ime} ${lekar.prezime}</p></h4>
                    <form name="povratak" method="post" action="index.jsp">
                        <button type="submit" class="btn-danger">Logout</button>
                    </form>
                </div>
                <div class="col-sm-9">
                    <p id="naslov">${porukaounosu}</p>
                </div>
            </div>
        </div>
        
                <div class="container-fluid" id="unosForma">
                    <div class="uvuceno">
                        <form name="povratak" method="post" action="Login">
                            <input type="hidden" name="korIme" value="${lekar.korIme}" />
                            <input type="hidden" name="loz" value="${lekar.lozinka}" />
                            <button type="submit" class="btn-success"><span>Povratak na glavni meni</span></button>
                        </form>
                    </div>
                    
                    
                </div>   
                
                
<!--        <form name="povratak" method="post" action="Login">
            <input type="hidden" name="lekarobjekat" value="${lekar}" />
            <input type="hidden" name="korIme" value="${lekar.korIme}" />
            <input type="hidden" name="loz" value="${lekar.lozinka}" />
            <input type="submit" name="povratakdugme" value="Povratak na glavni meni">
        </form>-->
<!--            <form name="logaout" method="post" action="index.jsp">
                <input type="submit" name="povratakdugme" value="logout">
            </form>-->
    </body>
</html>
