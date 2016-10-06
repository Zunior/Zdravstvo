package Servleti;

import Beans.*;
import Database.db;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.*;

public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                
        HttpSession sesija = request.getSession();
        String username;
        String password;
        
        String priv = request.getParameter("lekarobjekat");
        if(priv==null)
            priv="";
        Lekar lekar1 = (Lekar)request.getAttribute(priv);
        if(lekar1!=null){
            username = lekar1.getKorIme();
            password = lekar1.getLozinka();
        }else{
            username = request.getParameter("korIme");
            password = request.getParameter("loz");
        }
             
        
        
        String poruka = "";
        
        if(username.isEmpty() || password.isEmpty()){
            poruka = "Niste popunili sva polja";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String adresa = "";
        boolean nadjen = false;
        try{
            con = db.getInstance().getConnection();
            st = con.createStatement();
                        
            for (Tabele tab: Tabele.values()) {
                    if(!nadjen) {
                    String upit = "SELECT * FROM " + tab + " WHERE korisnickoIme='" +
                        username + "' AND lozinka='" + password + "'";
                    try {
                        rs = st.executeQuery(upit);
                        if(rs.next()){
                            nadjen = true;
                            int odobreno = 0;
                            String korIme = rs.getString("korisnickoIme");
                            String ime = rs.getString("ime");
                            String prezime = rs.getString("prezime");
                            String lozinka = rs.getString("lozinka");
                            if(tab.toString().equals("pacijent"))
                                odobreno = rs.getInt("odobreno");
                            String tipLekara;
                            int odeljenje;
                            switch(tab) {
                                case administrator:
                                    Administrator adm = new Administrator();
                                    adm.setKorIme(korIme);
                                    adm.setIme(ime);
                                    adm.setPrezime(prezime);
                                    sesija.setAttribute("administrator", adm);
                                    adresa = "Admin.jsp";
                                    break;
                                case lekar:
                                    tipLekara = rs.getString("tipLekara");
                                    odeljenje = rs.getInt("idOdeljenje");
                                    Lekar lek = new Lekar();
                                    lek.setKorIme(korIme);
                                    lek.setIme(ime);
                                    lek.setPrezime(prezime);
                                    lek.setLozinka(lozinka);
                                    lek.setIdOdeljenje(odeljenje);
                                    sesija.setAttribute("lekar", lek);
                                    if(tipLekara.equals("LOP"))
                                        adresa = "LOP/LOP.jsp";
                                    else
                                        adresa = "LS/LS.jsp"; 
                                    break;
                                case pacijent:
                                    Pacijent pac = new Pacijent();
                                    pac.setKorIme(korIme);
                                    pac.setIme(ime);
                                    pac.setPrezime(prezime);
                                    sesija.setAttribute("pacijent", pac);
                                    if(odobreno==1)
                                        adresa = "PAC/Pacijent.jsp";
                                    else{
                                        sesija.setAttribute("poruka","Nalog vam nije odobren");
                                        adresa = "index.jsp";
                                    }
                                    break;
                            }
                        }
                    }catch(SQLException greska){
                    sesija.invalidate();
                    request.setAttribute("porukaogresci", "Greska: " + greska);
                    adresa = "greska.jsp";
                    }
                    }                    
            }
        }catch(SQLException greska){
            sesija.invalidate();
            request.setAttribute("porukaogresci", "Greska: " + greska);
            adresa = "greska.jsp";
        }finally{
            db.getInstance().putConnection(con);
        }
        if(!nadjen) {
                        poruka = "Podaci nisu ispravni";
                        request.setAttribute("poruka", poruka);
                        adresa = "index.jsp";
                    }
        
        RequestDispatcher rd = request.getRequestDispatcher(adresa);
        rd.forward(request, response);
    }
}
