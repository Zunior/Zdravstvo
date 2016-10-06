<%-- 
    Document   : LOP
    Created on : Mar 10, 2016, 2:43:01 PM
    Author     : Sasa.Popovic
--%>

<%@page import="Beans.Lekar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="LOP/LOP.css"/>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>Lekar opšte prakse</title>
    </head>
    
    <!--Podaci ulogovanog korisnika-->
    <jsp:useBean id="lekar" class="Beans.Lekar" scope="session" />
    <jsp:setProperty property="*" name="lekar"/>
    
    <body>
        <div class="container-fluid" id="header">
            <div class="row">
                <div class="col-sm-4">
                    <h4 align="left"><p id="log">Lekar opšte prakse</p></h4>
                    <form name="povratak" method="post" action="index.jsp">
                        <button type="submit" class="btn-danger">Logout</button>
                    </form>
                </div>
                <div class="col-sm-8">
                    <p id="naslov">Dobrodošli dr. ${lekar.ime} ${lekar.prezime}</p>
                </div>
            </div>
        </div>
        
        
        <div class="container-fluid" id="unosForma">
            
            <div class="uvuceno">
                <form name="odabir1" method="post" action="LOPpretraga.java">
                    <button type="submit" class="btn btn-primary btn-block btn-xl" id="pretraga" name="pretraga"><span>Pretraga pacijenata</span></button>
                    <!--<input type="submit" name="pretraga" value="Pretraga pacijenata" />-->
                </form>
            </div>
            <div class="uvuceno">
                <form name="odabir2" method="post" action="LOPunosIzvestaja">
                    <button type="submit" class="btn btn-success btn-block" id="unos" name="unos"><span>Unos izveštaja</span></button>
                    <!--<input type="submit" name="unos" value="Unos izvestaja" />-->
                </form>
            </div>
            <div class="uvuceno">
                <form name="odabir3" method="post" action="LOPuput.java">
                    <button type="submit" class="btn btn-info btn-block" id="uput" name="uput"><span>Unos izveštaja</span></button>
                    <!--<input type="submit" name="unos" value="Izdavanje uputa" />-->
                </form>
            </div>
        </div>
        
    </body>
</html>
