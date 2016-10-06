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
        <link rel="stylesheet" type="text/css" href="index.css"/>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid" id="header">
            <div class="row">
                <div class="col-sm-3">
                    <h4 align="left"><p id="log">Logovanje</p></h4>
                </div>
                <div class="col-sm-9">
                    <p id="naslov">${(poruka!=null) ? poruka : "Dobrodošli na portal Ministarstva Zdravlja"}</p>
                </div>
            </div>
        </div>
            
        <div class="container-fluid" id="unosForma">
            <form name="loginForma" method="post" action="Login">
                    <div class="form-group">
                    <label for="korIme">Korisničko ime:</label>
                    <input type="text" class="form-control" id="korIme" name="korIme">
                    </div>
                    <div class="form-group">
                    <label for="loz">Lozinka:</label>
                    <input type="text" class="form-control" id="loz" name="loz">
                    </div>
                    <div class="row" id="donji">
                        <div class="container-fluid">
                            <button type="submit" class="btn btn-primary" name="Uloguj se" id="Prosledi">Uloguj se</button>
                            <button type="reset" class="btn btn-warning" name="Resetuj" id="resetuj">Resetuj</button>
                            <!--<button type="submit" class="btn btn-danger" name="PromenaS" id="Prosledi">Promena šifre</button>-->
                        </div>
                    </div>
            </form>
            <form name="novikorisnik" id="novikorisnik" method="post" action="NoviKorisnik">
                <button type="submit" class="btn btn-primary" id="novi" name="novi">Registracija korisnika</button>
            </form>
        </div>
                
                

        </div>
    </body>
</html>
