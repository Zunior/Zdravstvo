<%-- 
    Document   : PacIzvestaji
    Created on : Sep 10, 2016, 5:54:50 PM
    Author     : Jelena
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesija = request.getSession();
    HashMap<Integer, String> LOPizvestaji = (HashMap<Integer, String>)sesija.getAttribute("LOPizvestaji");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="PAC/PacIzvestaji.css"/>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>Izvestaji pacijenata</title>
    </head>
    <body>
       
        <div class="container-fluid" id="header">
            <div class="row">
                <div class="col-sm-4">
                    <h4 align="left"><p id="log">${pacijent.ime} ${pacijent.prezime}</p></h4>
                    <form name="povratak" method="post" action="index.jsp">
                        <button type="submit" class="btn-danger">Logout</button>
                    </form>
                </div>
                <div class="col-sm-8">
                    <p id="naslov">Izveštaji o lečenju</p>
                </div>
            </div>
        </div>
       
        <div class="container-fluid">
            <div class="col-md-3">
                    <form name="potvrdaO" method="post" action="PacijentIstorijat">
                        <div class="row">
                            <div class="sredina">
                            <label for="odabirI">Vreme posete doktoru:</label><br>
                            <select id="odabirI" name="odabirI" multiple onchange="potvrdiO">
                                <option value=""></option>
                                <%
                                    String odabranI = (String)sesija.getAttribute("odabranI");
                                    if(odabranI==null)
                                        odabranI = "";
                                    Set set = LOPizvestaji.entrySet();
                                    Iterator iterator = set.iterator();
                                    while(iterator.hasNext()) {
                                       Map.Entry mentry = (Map.Entry)iterator.next();
                                       if(odabranI!="" && odabranI.equals(mentry.getKey().toString())){
                                            out.println("<option value='" + mentry.getKey()+ "' selected>" + mentry.getValue() + "</option>");
                                       }else
                                             out.println("<option value='" + mentry.getKey()+ "'>" + mentry.getValue() + "</option>");
                                    }
                                %>
                            </select>
                            </div>

                        </div>
                        <div class="row">
                            <div class="sredina">
                                <button type="submit" name="odaberiI" id="odaberiI" value="odaberi izvestaj"">Odaberi izvestaj</button>
                            </div>
                        </div>

                    </form>
            </div>
            <div class="col-md-3">
                <div class="row">
                    <div class="sredina">
                        <h4><b>Izvestaj<br> lekara opste prakse</b></h4>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                         <div class="form-group">
                            <label for="lopdijagnoza">Dijagnoza:</label>
                            <textarea class="form-control" rows="3" id="lopdijagnoza" readonly>${lopdijagnoza}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                         <div class="form-group">
                            <label for="imeBolesti">Ime bolesti:</label>
                            <textarea class="form-control" rows="2" id="imeBolesti" readonly>${imeBolesti}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                         <div class="form-group">
                            <label for="tegobe">Tegobe:</label>
                            <textarea class="form-control" rows="3" id="tegobe" readonly>${tegobe}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                         <div class="form-group">
                            <label for="terapija">Terapija:</label>
                            <textarea class="form-control" rows="3" id="terapija" readonly>${terapija}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                         <div class="form-group">
                            <label for="napomena">Napomena:</label>
                            <textarea class="form-control" rows="3" id="napomena" readonly>${napomena}</textarea>
                          </div>
                    </div>
                </div>
            </div>            
            <div class="col-md-3">
                <div class="row">
                    <div class="sredina">
                        <h4><b>Izvestaj<br> lekara specijaliste</b></h4>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                        <div class="form-group">
                            <label for="datum">Datum izvestaja:</label>
                            <textarea class="form-control" rows="1" id="datum" readonly>${datum}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                        <div class="form-group">
                            <label for="lsdijagnoza">Dijagnoza:</label>
                            <textarea class="form-control" rows="3" id="lsdijagnoza" readonly>${lsdijagnoza}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                        <div class="form-group">
                            <label for="zakljucak">Zaključak:</label>
                            <textarea class="form-control" rows="3" id="zakljucak" readonly>${zakljucak}</textarea>
                          </div>
                    </div>
                </div> 
            </div>
            <div class="col-md-3">
                <div class="row">
                    <div class="sredina">
                        <h4><b>Nalaz<br> lekara specijaliste</b></h4>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                        <div class="form-group">
                            <label for="disanje">Disanje:</label>
                            <textarea class="form-control" rows="1" id="disanje" readonly>${disanje}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                        <div class="form-group">
                            <label for="puls">Puls:</label>
                            <textarea class="form-control" rows="1" id="puls" readonly>${puls}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                        <div class="form-group">
                            <label for="teltemp">Telesna temperatura:</label>
                            <textarea class="form-control" rows="1" id="teltemp" readonly>${teltemp}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                        <div class="form-group">
                            <label for="krvpritisak">Krvni pritisak:</label>
                            <textarea class="form-control" rows="1" id="krvpritisak" readonly>${krvpritisak}</textarea>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sredina">
                        <div class="form-group">
                            <label for="mokraca">Mokraca:</label>
                            <textarea class="form-control" rows="1" id="mokraca" readonly>${mokraca}</textarea>
                          </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
