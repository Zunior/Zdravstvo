<%-- 
    Document   : admNacelnik
    Created on : Aug 23, 2016, 10:04:21 AM
    Author     : Sasha
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Servleti.Odeljenja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import = "javax.servlet.RequestDispatcher" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">-->
        <script src="js/bootstrap-select.min.js"></script>
        <link href="css/bootstrap-select.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="admNacelnik.css"/>
        <title>Odabir načelnika</title>
    </head>
    
    <body>
        <script type="text/javascript">
            
            $(document).ready(function() { 
                $('.selectpicker').selectpicker({style: 'btn-info',size: 4 }); });

            function potvrdiU() {
                document.getElementById("odaberiU").click();
            }
            function potvrdiO() {
                document.getElementById("odaberiO").click();
            }
            function potvrdiN() {
                document.getElementById("odaberiN").click();
            }
        </script>
        <!--Kontrola sesije-->
        <jsp:useBean id="odeljenja" class="Beans.Odeljenja" scope="session"></jsp:useBean>
            <%
                String usta = (String)request.getParameter("odabirU");
                if(usta==null)
                    usta="";
                if(!usta.equals("")){
            %>
            <jsp:setProperty name="odeljenja" property="ustanova" value="<%= usta%>" />
            <%}%>
            <%if(request.getParameter("idUstn")!=null){%>
            <jsp:setProperty name="odeljenja" property="idUs" value="<%= Integer.parseInt(request.getParameter("idUstn"))%>" />
            <%}%>
            <%
                String odelj = (String)request.getParameter("odabirO");
                if(odelj==null)
                    odelj="";
                if(!odelj.equals("")){
            %>
            <jsp:setProperty name="odeljenja" property="odeljenje" value="<%= odelj%>" />
            <%}%>
            <%if(request.getParameter("odabirO")!=null){%>
            <jsp:setProperty name="odeljenja" property="idOd" value="<%= Integer.parseInt(request.getParameter("idOdelj"))%>" />
            <%}%>
            

        <%
            HashMap<Integer, String> ustanove = new HashMap<Integer, String>();
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zdravstvo", "sasa", "12345");
                stmt = con.createStatement();
            
            rs = stmt.executeQuery("select * from odeljenje where idUstanova is NULL");
            while (rs.next())
            {
                ustanove.put(rs.getInt("idOdeljenje"), rs.getString("naziv"));
            }
            }catch (SQLException ex) {
        %>
        <h2>${ex.printStackTrace()}</h2>
        <%
            } 
        %>
        <div class="container-fluid">
            <form name="potvrdaU" method="post" action="admNacelnik.jsp">
            <div class="row">
                <div class="sredina">
                    <label for="odabirU">Ustanova:</label><br>
                    <select class="selectpicker show-menu-arrow" id="odabirU" name="odabirU" onchange="potvrdiU()">
                        <option value=""></option>
                        <%
                            int idUs = 0;
                            Set setU = ustanove.entrySet();
                            Iterator iteratorU = setU.iterator();
                            while(iteratorU.hasNext()) {
                               Map.Entry mentryU = (Map.Entry)iteratorU.next();
                               if(odeljenja.getUstanova()!=null && odeljenja.getUstanova().equals(mentryU.getValue())){
                                    out.println("<option value='" + mentryU.getValue() + "' selected>" + mentryU.getValue() + "</option>");
                                    idUs = Integer.parseInt(mentryU.getKey().toString());
                               }else
                                     out.println("<option value='" + mentryU.getValue() + "'>" + mentryU.getValue() + "</option>");
                            }
                        %>
                    </select>
                    <% out.println("<input type='text' name='idUstn' value='" + idUs + "' style='visibility: hidden;'>"); %>
                </div>
            </div>
                <%
//                    response.getWriter().write( "User chose: " + request.getParameter("odabirU" ) + " " + idUs );
                %>
            <div class="row">   
                <div class="sredina">
                    <button type="submit" name="odaberiU" id="odaberiU" value="odaberi ustanovu">Odaberi ustanovu</button>
                </div>
            </div>
            </form>
            
        <!--</div>-->
            <%
                HashMap<Integer, String> odeljenja1 = new HashMap<Integer, String>();
                if(odeljenja.getUstanova()!=null)
                {
                    try{
                        rs = stmt.executeQuery("select * from odeljenje where idUstanova='" + odeljenja.getIdUs() + "'");
                        while(rs.next())
                        {
                            odeljenja1.put(rs.getInt("idOdeljenje"), rs.getString("naziv"));
                        }
                    }catch (SQLException ex) {
            %>
                        <h2>${ex.printStackTrace()}</h2>
            <%
                    } 
                }
                
            %>
        <!--<div class="container-fluid">-->    
            <form name="potvrdaO" method="post" action="admNacelnik.jsp">
                <div class="row">
                    <div class="sredina">
                    <label for="odabirO">Odeljenje:</label><br>
                    <select id="odabirO" name="odabirO" onchange="potvrdiO">
                        <option value=""></option>
                        <%
                            int idOd = 0;
                            Set setO = odeljenja1.entrySet();
                            Iterator iteratorO = setO.iterator();
                            while(iteratorO.hasNext()) {
                               Map.Entry mentryO = (Map.Entry)iteratorO.next();
                               if(odeljenja.getOdeljenje()!=null && odeljenja.getOdeljenje().equals(mentryO.getValue())){
                                    out.println("<option value='" + mentryO.getValue() + "' selected>" + mentryO.getValue() + "</option>");
                                    idOd = Integer.parseInt(mentryO.getKey().toString());
                               }else
                                     out.println("<option value='" + mentryO.getValue() + "'>" + mentryO.getValue() + "</option>");
                            }

                        %>
                    </select>
                    <% out.println("<input type='text' name='idOdelj' value='" + idOd + "' style='visibility: hidden;'>"); %>
                    </div>
                </div>
<!--                <div class="container-fluid">
                     <%
//                        response.getWriter().write( odeljenja.getUstanova() + odeljenja.getIdUs()+ odeljenja.getOdeljenje() + odeljenja.getIdOd() );
                    %>
                </div>-->
                <div class="row">
                    <div class="sredina">
                        <button type="submit" name="odaberiO" id="odaberiO" value="odaberi odeljenje"">Odaberi odeljenje</button>
                    </div>
                </div>
            </form>
        </div>
        <%
            ArrayList<ArrayList<String>> outer = new ArrayList<ArrayList<String>>();
            ArrayList<String> inner = new ArrayList<String>();
            
            
            String imePrezime = "";
            String nacelnik = "";
            String korImeJeste = "";
            int broj = 1;
            if(odeljenja.getIdOd()!=0)
                {
                    try{
                        rs = stmt.executeQuery("select * from lekar where idOdeljenje='" + odeljenja.getIdOd() + "' and tipLekara='LS'");
                        while(rs.next())
                        {
                            inner = new ArrayList<String>();
                            inner.add(Integer.toString(broj));
                            broj++;
                            inner.add(rs.getString("korisnickoIme"));
                            inner.add(rs.getString("ime"));
                            inner.add(rs.getString("prezime"));
                            if(rs.getString("nacelnik").equals("jeste")){
                                nacelnik = inner.get(2).toString() + " " + inner.get(3).toString();
                                korImeJeste = inner.get(1).toString();
                            }
                            outer.add(inner);
                        }
                    }catch (SQLException ex) {
        %>
                        <h2>${ex.printStackTrace()}</h2>
        <%
                    } 
                }
                out.print("<div class='row'>");
                out.print("<div class='sredina'>Trenutni načelnik je:<br>");
                out.print("<b><span id='boldovano'>");

                if(nacelnik == ""){
                    out.print("Niko nije dodeljen");
                }else
                out.print(nacelnik);

                out.print("</span></b>");
                out.print("</div>");
                out.print("</div>");

        %>
        <div class="container-fluid">    
            <form name="potvrdaN" method="post" action="admNacelnik.jsp">
            <div class="row">
                <div class="sredina">
                    <label for="odabirL">Lista lekara specijalista:</label><br>
                    <select id="odabirL" name="odabirL" multiple onchange="potvrdiN()">
                        <%
                            String odabran = request.getParameter("odabirL");
                            if(odabran==null)
                                odabran="";
                            for(int i=0; i<outer.size(); i++)
                                if(odabran.equals(outer.get(i).get(0).toString()))
                                    out.println("<option value='" + outer.get(i).get(0).toString() + "' selected>" + outer.get(i).get(2).toString() + " " + outer.get(i).get(3).toString() + "</option>");
                                else
                                    out.println("<option value='" + outer.get(i).get(0).toString() + "'>" + outer.get(i).get(2).toString() + " " + outer.get(i).get(3).toString() + "</option>"); 
                        %>
                    </select>
                </div>
            </div>
                <% 
                    out.println("<input type='text' name='korImeN' value='" + korImeJeste + "' style='visibility: hidden;'>");
                %>
            
            <div class="row">
                    <div class="sredina">
                        <div>Možete potvrditi novog načelnika:</div>
                        <button type="submit" name="odaberiN" id="odaberiN" value="odaberi nacelnika"">Odaberi nacelnika</button>
                    </div>
                </div>
        </div>
            <%
                String korIme = "";
                if(odabran != null & odabran != ""){
                    for(int i=0; i<outer.size(); i++)
                        if(outer.get(i).get(0).equals(odabran)){
                            korIme = outer.get(i).get(1);
                            break;  
                        }
                    if(!korIme.equals(korImeJeste)){
                        try{
                            stmt.executeUpdate("Update lekar set nacelnik='jeste' where korisnickoIme='" + korIme + "'");
                        }catch (SQLException ex) {
        %>
                            <h2>${ex.printStackTrace()}</h2>
        <%
                        }
                
                        try{
                            stmt.executeUpdate("Update lekar set nacelnik='nije' where korisnickoIme='" + korImeJeste + "'");
                        }catch (SQLException ex) {
        %>
                        <h2>${ex.printStackTrace()}</h2>
        <%
                        }   
                    }
                }
                rs.close();
                stmt.close();
                con.close();
        %>
        
    </body>
</html>
