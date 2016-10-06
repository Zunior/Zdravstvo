<%-- 
    Document   : admNacelnik
    Created on : Aug 23, 2016, 10:04:21 AM
    Author     : Sasha
--%>

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
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>Odabir načelnika</title>
    </head>
    <body>
        <%
//            HttpSession sesija = request.getSession();
//            String prviPut = (String)sesija.getAttribute("prvi");
//            if(prviPut == null){
//                RequestDispatcher rd = request.getRequestDispatcher("odeljenje.java");
//                request.setAttribute("prvi","nije");
//                rd.forward(request, response);
//            }
        %> 
<!--        <script type="text/javascript">
            submitForm1 = function(){
                document.forms["potvrdaU"].submit();
            }
        </script>-->
<!--        <form name="pocetak" method="post" action="Odeljenje.java">
            <button type="submit" name="odaberiU" value="odaberi ustanovu">proba</button>
        </form>-->
        <%
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zdravstvo", "sasa", "12345");
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("select * from odeljenje where idUstanova is NULL");
            HashMap<Integer, String> ustanove = new HashMap<Integer, String>();
            while (rs.next())
            {
                ustanove.put(rs.getInt("idOdeljenje"), rs.getString("naziv"));
            }
        %>
        <div class="container-fluid">
            <form name="potvrdaU" method="post" action="admNacelnik.jsp">
            <div>Ustanova:</div>
            <div>
                <select id="odabirU" name="odabirU">
                    <%
                        int idUs = 0;
                        Set setU = ustanove.entrySet();
                        Iterator iteratorU = setU.iterator();
                        while(iteratorU.hasNext()) {
                           Map.Entry mentryU = (Map.Entry)iteratorU.next();
                           if(request.getParameter("odabirU" )!=null && request.getParameter("odabirU" ).equals(mentryU.getValue())){
                                out.println("<option value='" + mentryU.getValue() + "' selected>" + mentryU.getValue() + "</option>");
                                idUs = Integer.parseInt(mentryU.getKey().toString());
                           }else
                                 out.println("<option value='" + mentryU.getValue() + "'>" + mentryU.getValue() + "</option>");
                        }
                    %>
                </select>
                <% out.println("<input type='text' name='idUstn' value='" + idUs + "' style='visibility: hidden;'>"); %>
            </div>
                <%
//                    response.getWriter().write( "User chose: " + request.getParameter("odabirU" ) + " " + idUs );
                %>
            <div class="row">   
                <div>
                    <button type="submit" name="odaberiU" value="odaberi ustanovu">Odaberi ustanovu</button>
                </div>
            </div>
            </form>
            
        </div>
            <%
                HashMap<Integer, String> odeljenja = new HashMap<Integer, String>();
                if(request.getParameter("odabirU" )!=null)
                {
                    rs = stmt.executeQuery("select * from odeljenje where idUstanova='" + request.getParameter("idUstn" ) + "'");
                    while(rs.next())
                    {
                        odeljenja.put(rs.getInt("idOdeljenje"), rs.getString("naziv"));
                    }
                }
                
            %>
        <div class="container-fluid">    
            <form name="potvrdaO" method="post" action="admNacelnik.jsp">
                <div>Odeljenje:</div>
                <div>
                    <select id="odabirO" name="odabirO">
                        <%
                            int idOd = 0;
                            Set setO = odeljenja.entrySet();
                            Iterator iteratorO = setO.iterator();
                            while(iteratorO.hasNext()) {
                               Map.Entry mentryO = (Map.Entry)iteratorO.next();
                               if(request.getParameter("odabirO" )!=null && request.getParameter("odabirO" ).equals(mentryO.getValue())){
                                    out.println("<option value='" + mentryO.getValue() + "' selected>" + mentryO.getValue() + "</option>");
                                    idOd = Integer.parseInt(mentryO.getKey().toString());
                               }else
                                     out.println("<option value='" + mentryO.getValue() + "'>" + mentryO.getValue() + "</option>");
                            }

                        %>
                    </select>
                    <% out.println("<input type='text' name='idOdelj' value='" + idOd + "' style='visibility: hidden;'>"); %>
                </div>
                     <%
//                        response.getWriter().write( "User chose: " + request.getParameter("odabirO" ) + " " + idUs );
                    %>
                <div class="row">
                    <div>
                        <button type="submit" name="odaberiO" value="odaberi odeljenje" onClick="submitForm1">Odaberi odeljenje></button>
                    </div>
                </div>
            </form>
        </div>
        
        
    </body>
</html>
