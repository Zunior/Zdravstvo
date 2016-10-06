<%-- 
    Document   : noviKorisnik
    Created on : Sep 8, 2016, 12:34:25 PM
    Author     : sasha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="noviKorisnik.css"/>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>Unos korisnika</title>
    </head>
   <%
       HttpSession sesija = request.getSession();
   %> 
    <body>
        <div class="container-fluid" id="header">
            <div class="row">
                <div class="col-sm-4">
                    <h4 align="left"><p id="log">Registracija</p></h4>
                    <form name="povratak" method="post" action="index.jsp">
                        <button type="submit" class="btn-danger">Nazad na logovanje</button>
                    </form>
                </div>
                <div class="col-sm-8">
                    <p id="naslov">Unos novog korisnika</p>
                </div>
            </div>
        </div>
        <form name="Unos" method="post" action="NoviKorisnik">
            <div class="row">
                <div class="form-group">
                    <div id="linija1">
                        <label for="ime">Ime:</label>
                    </div>
                    <div id="linija2">
                        <span><%=sesija.getAttribute("a")%></span>
                    </div>
                    <input type="text" class="form-control" id="ime" name="ime" value="<%=sesija.getAttribute("ime")%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div id="linija1">
                        <label for="prezime">Prezime:</label>
                    </div>
                    <div id="linija2">
                        <span><%=sesija.getAttribute("b")%></span>
                    </div>
                    <input type="text" class="form-control" id="prezime" name="prezime" value="<%=sesija.getAttribute("prezime")%>">
                </div>
            </div>
            <div class="row">
                <div id="Pol">
                    <label>Pol:</label>
                    <div class="radio-inline text-right">
                        <% 
                            String radio = (String)sesija.getAttribute("pol");
                            if(radio==null || radio.equals("muski")){
                                radio="muski";
                                out.println("<input type='radio' name='pol' id='pol1' value='muski' checked><label><b>muski</b></label>");
                            }
                            else
                                out.println("<input type='radio' name='pol' id='pol1' value='muski'><label><b>muski</b></label>");
                        %>
                    </div>
                    <div class="radio-inline">
                        <% 
                            if(radio.equals("zenski"))
                                out.println("<input type='radio' name='pol' id='pol1' value='zenski' checked><label><b>zenski</b></label>");
                            else
                                out.println("<input type='radio' name='pol' id='pol1' value='zenski'><label><b>zenski</b></label>");
                        %>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div id="linija1">
                        <label for="lozinka">Lozinka:</label>
                    </div>
                    <div id="linija2">
                        <span><%=sesija.getAttribute("c")%></span>
                    </div>
                    <input type="text" class="form-control" id="lozinka" name="lozinka" value="<%=sesija.getAttribute("lozinka")%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div id="linija1">
                        <label for="jmbg">JMBG:</label>
                    </div>
                    <div id="linija2">
                        <span><%=sesija.getAttribute("d")%></span>
                    </div>
                    <input type="text" class="form-control" id="jmbg" name="jmbg" value="<%=sesija.getAttribute("jmbg")%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div id="linija1">
                        <label for="inos">Ime nosioca osiguranja:</label>
                    </div>
                    <div id="linija2">
                        <span><%=sesija.getAttribute("e")%></span>
                    </div>
                    <input type="text" class="form-control" id="inos" name="inos" value="<%=sesija.getAttribute("inos")%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div id="linija1">
                        <label for="snos">Srodstvo sa nosiocem osiguranja:</label>
                    </div>
                    <div id="linija2">
                        <span><%=sesija.getAttribute("f")%></span>
                    </div>
                    <input type="text" class="form-control" id="snos" name="snos" value="<%=sesija.getAttribute("snos")%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div id="linija1">
                        <label for="adr">Adresa:</label>
                    </div>
                    <div id="linija2">
                        <span><%=sesija.getAttribute("g")%></span>
                    </div>
                    <input type="text" class="form-control" id="adr" name="adr" value="<%=sesija.getAttribute("adr")%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div id="linija1">
                        <label for="telefon">Telefon:</label>
                    </div>
                    <div id="linija2">
                        <span><%=sesija.getAttribute("h")%></span>
                    </div>
                    <input type="text" class="form-control" id="telefon" name="telefon" value="<%=sesija.getAttribute("telefon")%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div id="linija1">
                        <label for="email">E-mail:</label>
                    </div>
                    <div id="linija2">
                        <span><%=sesija.getAttribute("i")%>
                    </div>
                    <input type="text" class="form-control" id="email" name="email" value="<%=sesija.getAttribute("email")%>">
                </div>
            </div>
            <div class="row">
                <div id="sredina">
                    <div style="text-align: left;">
                        <button type="submit" class="btn btn-primary" name="unesi" id="Prosledi">Unesi korisnika</button>
                    </div>
                <div>
            </div>
                    
        </form>
    
        
       
    </body>
</html>
