<%-- 
    Document   : index
    Created on : Feb 24, 2016, 11:35:19 AM
    Author     : Sasa.Popovic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">${(poruka!=null) ? poruka : "Dobrodošli!"}</h1>
        <br /><br />        
        <h2 align="center">Logovanje za pacijente</h2>
            <form name="pacijentForma" method="post" action="Pacijent">
                <table width="350" border="0" align="center">
                    <tr>
                        <td>Korisnicko ime:</td>
                        <td><label>
                                <input type="text" name="korIme" size="20"/>
                            </label></td>
                    </tr>
                    <tr>
                        <td>Lozinka:</td>
                        <td><label>
                                <input type="password" name="loz" size="21"/>
                            </label></td>
                    </tr>
                    <tr>
                        <td><label>
                                <input type="submit" name="PromenaS" id="Prosledi" value="Promena šifre" />
                            </label></td>
                        <td>
                            <label>
                                <input type="submit" name="Uloguj se" id="Prosledi" value="Uloguj se" />
                                <input type="reset" name="Resetuj" id="resetuj" value="Resetuj" />
                            </label>
                        </td>
                            
                    </tr>
                </table>
            </form>
        <br /><br />
        <h2 align="center">Logovanje za lekare opšte prakse</h2>
            <form name="LOPForma" method="post" action="LOP">
                <table width="350" border="0" align="center">
                    <tr>
                        <td>Korisnicko ime:</td>
                        <td><label>
                                 <input type="text" name="korIme" size="20"/>
                            </label></td>
                    </tr>
                    <tr>
                        <td>Lozinka:</td>
                        <td><label>
                                <input type="password" name="loz" size="21"/>
                            </label></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <label>
                                <input type="submit" name="Uloguj se" id="Prosledi" value="Uloguj se" />
                                <input type="reset" name="Resetuj" id="resetuj" value="Resetuj" />
                            </label>
                        </td>
                    </tr>
                </table>
            </form>
        <h2 align="center">Logovanje za Lekare specijaliste</h2>
            <form name="LSForma" method="post" action="LS">
                <table width="350" border="0" align="center">
                    <tr>
                        <td>Korisnicko ime:</td>
                        <td><label>
                                 <input type="text" name="korIme" size="20"/>
                            </label></td>
                    </tr>
                    <tr>
                        <td>Lozinka:</td>
                        <td><label>
                                <input type="password" name="loz" size="21"/>
                            </label></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <label>
                                <input type="submit" name="Uloguj se" id="Prosledi" value="Uloguj se" />
                                <input type="reset" name="Resetuj" id="resetuj" value="Resetuj" />
                            </label>
                        </td>
                    </tr>
                </table>
            </form>
        <h2 align="center">Logovanje za Administratore</h2>
            <form name="adminForma" method="post" action="Admin">
                <table width="350" border="0" align="center">
                    <tr>
                        <td>Korisnicko ime:</td>
                        <td><label>
                                 <input type="text" name="korIme" size="20"/>
                            </label></td>
                    </tr>
                    <tr>
                        <td>Lozinka:</td>
                        <td><label>
                                <input type="password" name="loz" size="21"/>
                            </label></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <label>
                                <input type="submit" name="Uloguj se" id="Prosledi" value="Uloguj se" />
                                <input type="reset" name="Resetuj" id="resetuj" value="Resetuj" />
                            </label>
                        </td>
                    </tr>
                </table>
            </form>
    </body>
</html>
