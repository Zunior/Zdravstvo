<%-- 
    Document   : admOdabir
    Created on : Mar 23, 2016, 2:34:14 PM
    Author     : Sasa.Popovic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="admMeni.css"/>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script type="text/javascript" src="osnovna.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>Admin meni</title>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
	<!--Elementi koje stavljamo u minimizirani izbor-->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav_traka" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
      		</button>
         	<a class="navbar-brand" href="#"><b>Administrator: ${administrator.ime} ${administrator.prezime}</b></a>
		</div>
		<div class="collapse navbar-collapse" id="nav_traka">
                    <ul class="nav navbar-nav navbar-right" role="tablist">
                       <li id="home_page"><a href="admNacelnik.jsp" target="promeni">Odabir načelnika</a></li>
                       <li id="about_page"><a href="admUnosOd.jsp" target="promeni">Unos odeljenja</a></li>
                       <li class="portfolio_page"><a href="admUnosLek.jsp" target="promeni">Unos lekara</a></li>
                       <li id="contact_page"><a href="#">Proba</a></li>
                    </ul>
                 </div>
	</div>
</nav>
        
        
<!--        <ul>        
            <li><a href="admNacelnik.jsp" target="promeni">Odabir načelnika</a></li>
            <li><a href="admUnosOd.jsp" target="promeni">Unos odeljenja</a></li>
            <li><a href="admUnosLek.jsp" target="promeni">Unos lekara</a></li>
        </ul>-->
    </body>
</html>
