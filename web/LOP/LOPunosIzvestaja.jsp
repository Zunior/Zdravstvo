<%-- 
    Document   : LOPunosIzvestaja
    Created on : Aug 26, 2016, 1:11:37 PM
    Author     : Sasha
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Beans.Lekar"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Podaci ulogovanog korisnika-->
<jsp:useBean id="lekar" class="Beans.Lekar" scope="session" />
<jsp:setProperty property="*" name="lekar"/>

<%
    HttpSession sesija = request.getSession();
    
    //Kontrola poruka
    String porukaK= "Obavezno polje";
    String porukaD = "Obavezno polje";
    if(!request.getAttribute("dijagnoza").equals("") && request.getAttribute("dijagnoza")!=null)
        porukaD = "";
    
    //Lista ustanova
    ArrayList<String> ustanove = (ArrayList<String>)sesija.getAttribute("ustanove");
    if(ustanove==null)
        ustanove = new ArrayList<String>();
    
    //Lista odeljenja odabranih ustanova
    ArrayList<String> odeljenja = (ArrayList<String>)sesija.getAttribute("odeljenja");
    if(ustanove==null)
        ustanove = new ArrayList<String>();
    
    //Provera postojanja zadate zdravstvene knjizice
    String imePrezime = (String)request.getAttribute("ime");
    if(imePrezime==null)
        imePrezime="Unesite broj kartona";
    
    //Listanje pacijenata kojima je dodeljena ustanova doktora
    HashMap<Integer, String> pacijenti = (HashMap<Integer, String>)sesija.getAttribute("pacijenti");
    Set set = pacijenti.entrySet();
    Iterator iterator = set.iterator();
    String karton = request.getParameter("karton");
    while(iterator.hasNext()) {
        Map.Entry mentry = (Map.Entry)iterator.next();
        if(karton==null){
            break;
        }
        else if(mentry.getKey().toString().equals(karton))
        {
            imePrezime = mentry.getValue().toString();
            porukaK = "";
            String por = "ok";
            sesija.setAttribute("kartonok", por);
            break;
        }
        else 
        {
            imePrezime = "Korisnik ne postoji";
            
        }
    }
    request.setAttribute("ime", imePrezime);
    
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new Date();
    String datum = "";
    datum = dateFormat.format(date).toString(); //2014/08/06 15:59:48
    sesija.setAttribute("datum", datum);
    
%>
<%
//    HashMap<Integer, String> ustanove = new HashMap<Integer, String>();
//    Connection con = null;
//    Statement stmt = null;
//    ResultSet rs = null;
//
//    try{
//        Class.forName("com.mysql.jdbc.Driver");
//        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zdravstvo", "sasa", "12345");
//        stmt = con.createStatement();
//
//        rs = stmt.executeQuery("select * from odeljenje where idUstanova is NULL");
//        while (rs.next())
//        {
//            ustanove.put(rs.getInt("idOdeljenje"), rs.getString("naziv"));
//        }
//    }catch (SQLException ex) {
//        ex.printStackTrace();
//    } 
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unos izveštaja</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="LOP/LOPunos.css"/>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <style>
        span {
            color: red;
        }
        textarea {
            width:250px;
            height:150px;
        }
    </style>
    <script>
        $(function () {
            $('#datetimepicker1').datetimepicker();
        });
             
        function proveri() {
            document.getElementById("posao").value = "provera";
            document.getElementById("potvrdiKarton").click();  
        }
        function upisi() {
            document.getElementById("posao").value = "upis";
            document.getElementById("potvrdiKarton").click();
        }
    </script>
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
                    <p id="naslov">Unos izveštaja lekara opšte prakse</p>
                </div>
            </div>
        </div>
        
        <form name="proveriKarton" method="post" action="LOPunosIzvestaja">
            <div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-5" style="margin: 0 15px 0 15px;">
                            <div class="row" style="margin-top: 10px;">
                                <div class="form-group">
                                        <label for="imedok">Zadužen lekar:</label>
                                        <span class="label label-default form-control" id="imedok">dr. ${lekar.ime} ${lekar.prezime}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="dtm">Vreme unosa izveštaja:</label>
                                    <span class="label label-default form-control" id="dtm">${datum}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group" id="zkgrupa">
                                    <label for="karton">Zdravstveni karton:</label><span id="poruka"><%=porukaK%></span>
                                    <input type="text" class="form-control" id="karton" name="karton" value="<%=(String)request.getAttribute("karton")%>">
                                    
                                    <!--<input type="button" value="Proveri" onclick="proveri()"/>-->
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                        <label for="pacijent">Pacijent:</label>
                                        <span class="label label-default form-control" id="pacijent">${ime}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="datetimepicker1">Datum sledeće kontrole:</label>
                                    <div class='input-group date' id='datetimepicker1'>
                                        <input type='text' class="form-control" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="napomena">Napomena:</label>
                                    <textarea class="form-control" rows="2" name="napomena" id="napomena"></textarea>
                                </div>
                            </div>
                            <div class='row'>
                                    <div>
                                        <label for="odabirU">Uputi na odeljenje lekara specijaliste:</label><br>
                                        <select class="selectpicker show-menu-arrow" id="odabirU" name="odabirU" onchange="proveri()" >
                                            <option value=""></option>
                                            <%
                                                if(ustanove!=null){
                                                    for(String ustanova: ustanove){
                                                        if(ustanova.equals(sesija.getAttribute("Ustanova")))
                                                            out.println("<option value='" + ustanova + "' selected>" + ustanova + "</option>");
                                                        else
                                                            out.println("<option value='" + ustanova + "'>" + ustanova + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                        <span style='color: white;'>Ustanova</span>
                                    </div>
                            </div>
                            <div class='row'>
                                    <div>
                                        <select class="selectpicker show-menu-arrow" id="odabirO" name="odabirO" onchange="proveri()" >
                                            <option value=""></option>
                                            <%
                                                if(odeljenja!=null){
                                                    for(String odeljenje: odeljenja){
                                                        if(odeljenje.equals(sesija.getAttribute("Odeljenje")))
                                                            out.println("<option value='" + odeljenje + "' selected>" + odeljenje + "</option>");
                                                        else
                                                            out.println("<option value='" + odeljenje + "'>" + odeljenje + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                        <span style='color: white;'>Odeljenje</span>
                                    </div>
                            </div>
                        </div>
                        
                        <div class="col-md-5" style="margin: 0 15px 0 15px;">
                            <div class="row" style="margin-top: 10px;">
                                <div class="form-group">
                                    <label for="comment">Komentar:</label>
                                    <textarea class="form-control" rows="3" name="comment" id="comment" ><%=(String)request.getAttribute("comment")%></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="dijagnoza">Dijagnoza:</label><span id="poruka"><%=porukaD%></span>
                                    <textarea class="form-control" rows="2" name="dijagnoza" id="dijagnoza"><%=(String)request.getAttribute("dijagnoza")%></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="imeBolesti">Ime bolesti:</label>
                                    <textarea class="form-control" rows="2" name="imeBolesti" id="imeBolesti"><%=(String)request.getAttribute("imeBolesti")%></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="tegobe">Tegobe:</label>
                                    <textarea class="form-control" rows="2" name="tegobe" id="tegobe"><%=(String)request.getAttribute("tegobe")%></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="terapija">Terapija:</label>
                                    <textarea class="form-control" rows="2" name="terapija" id="terapija"><%=(String)request.getAttribute("terapija")%></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <button type="button" class="btn btn-success" id="provera" name="provera"><a href="javascript: proveri();">Provera</a></button>
                                <button type="button" class="btn btn-warning" id="upis" name="upis"><a href="javascript: upisi();">Upis</a></button>
                            </div>
                        </div>
                    </div>
                </div>
                            
                
                
                
<!--                <p>Zdravstveni karton: </p>

                <input type='text' name='karton' value="<%=(String)request.getAttribute("karton")%>"/><span><%=porukaK%></span>-->
                <!--<p>Ime i prezime pacijenta: <span style="color: red;">${ime}</span></p>-->
                    
                    <!--<label><p>Zadužen lekar: dr. ${lekar.ime} ${lekar.prezime}</p></label><br>-->
                    <!--<label><p>Vreme unosa izveštaja: ${datum}</p></label>-->
                    
<!--                    <div>
                        <input type="button" value="Proveri" onclick="proveri()"/>
                    </div>                                        -->
                    
                    
                <input type="text" name="posao" id="posao" value="provera" style='visibility: hidden;'/>
                <input type="submit" name="potvrdiKarton" id="potvrdiKarton" value="posalji" style='visibility: hidden;'/>
            </div>
        </form>
                    
                    <!--<input type="button" value="Upisi" onclick="upisi()"/>-->
    </body>
</html>
