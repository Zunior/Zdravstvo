/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleti.LOP;

import Beans.Lekar;
import Database.db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sasha
 */
public class LOPunosIzvestaja extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String adresa = "LOPunosIzvestaja.jsp";
        HttpSession sesija = request.getSession();
        Lekar lek = (Lekar)sesija.getAttribute("lekar");
        sesija.setAttribute("por", "obavezno polje!");
        String posao = request.getParameter("posao");
        if(posao==null)
            posao="";
        
        //cuvanje unesenog teksta
        String dijagnoza = request.getParameter("dijagnoza");
        if(dijagnoza==null)
            dijagnoza="";
        String datum = (String)sesija.getAttribute("datum");
        if(datum==null)
            datum="";
        request.setAttribute("dijagnoza", dijagnoza);
        String karton = request.getParameter("karton");
        if(karton==null)
            karton="";
        request.setAttribute("karton", karton);
        String komentar = (String)request.getParameter("comment");
        if(komentar==null)
            komentar = "";
        request.setAttribute("comment", komentar);
        String imeBolesti = (String)request.getParameter("imeBolesti");
        if(imeBolesti==null)
            imeBolesti = "";
        request.setAttribute("imeBolesti", imeBolesti);
        String tegobe = (String)request.getParameter("tegobe");
        if(tegobe==null)
            tegobe = "";
        request.setAttribute("tegobe", tegobe);
        String terapija = (String)request.getParameter("terapija");
        if(terapija==null)
            terapija = "";
        request.setAttribute("terapija", terapija);
        String kartonok = (String)sesija.getAttribute("kartonok");
        if(kartonok==null)
            kartonok="";
        
        //rad sa bazom
        HashMap<Integer, String> pacijenti = new HashMap<Integer, String>();
        String ustanova = "";
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        try{
            con = db.getInstance().getConnection();
            st = con.createStatement();
            
            //Odabir pacijenata iz ustanove odabranog lekara
            rs = st.executeQuery("select naziv from odeljenje where idOdeljenje = "
                    + "(select idUstanova from odeljenje where idOdeljenje = '" + lek.getIdOdeljenje() + "')");
            if(rs.next())
                ustanova = rs.getString(1);
            
            rs = st.executeQuery("SELECT * FROM pacijent WHERE idUstanova=(select idOdeljenje from odeljenje where naziv='" + ustanova + "')");
            while(rs.next())
            {
                pacijenti.put(rs.getInt("korisnickoIme"), rs.getString("ime") + " " + rs.getString("prezime"));
            }
            sesija.setAttribute("pacijenti", pacijenti);
            
            //Listanje ustanova
            ArrayList<String> ustanove = new ArrayList<String>();
            rs = st.executeQuery("select * from odeljenje where idUstanova is NULL");
            while (rs.next())
            {
                ustanove.add(rs.getString("naziv"));
            }
            sesija.setAttribute("ustanove", ustanove);
            
            //Listanje odeljenja odabrane ustanove
            String ust = (String)request.getParameter("odabirU");
            String od = (String)request.getParameter("odabirO");
            
            //uslovi prikaza odabira odeljenja
            ArrayList<String> odeljenja = new ArrayList<String>();
            if(ust!=null && !ust.equals("") && (od==null || od.equals(""))){
                sesija.setAttribute("Ustanova", ust);
                con = db.getInstance().getConnection();
                st = con.createStatement();
                
                rs = st.executeQuery("select naziv from odeljenje where idUstanova = "
                        + "(select idOdeljenje from odeljenje where naziv ='" + ust + "')");
                while(rs.next())
                {
                    odeljenja.add(rs.getString(1));
                }
                sesija.setAttribute("odeljenja", odeljenja);
                sesija.setAttribute("Ustanova", ust);
                sesija.setAttribute("Odeljenje", "");
            }
            else if(ust!=null && !ust.equals("") && od!=null && !od.equals(""))
            {
                sesija.setAttribute("Ustanova", ust);
                sesija.setAttribute("Odeljenje", od);
            }
            else{
                sesija.setAttribute("Ustanova", "");
                sesija.setAttribute("Odeljenje", "");
            }
            
            if(posao.equals("upis"))
            {
                if(kartonok.equals("ok") && !dijagnoza.equals("")){
                    try{
                        Integer uputO = null;
                        Integer maxU = null;
                        if(od!=null && !od.equals(""))  {                      
                            rs = st.executeQuery("select idOdeljenje from odeljenje where naziv ='" + od + "' and "
                                    + "idUstanova = (select idOdeljenje from odeljenje where naziv ='" + ust + "')");
                            while(rs.next()){uputO = rs.getInt(1); }
                        }
                        if(uputO!=null){
                            st.executeUpdate("insert into uput(idOdeljenje) values(" + uputO +")");
                            rs = st.executeQuery("select max(idUput) from uput");
                            while(rs.next()){maxU = rs.getInt(1); }
                        }

                        st.executeUpdate("insert into izvestajlop (idZdrKarton, idLekar, datumPregleda, dijagnoza, "
                                + "imeBolesti, tegobe, terapija, datumSLkontrole, napomena, idUput)"
                                + "values(" + karton + ", '" + lek.getKorIme() + "', '" + datum + "', '" 
                                + dijagnoza + "', '" + imeBolesti + "', '" + tegobe + "', '" + terapija + "', null, '" + komentar 
                                + "', " + maxU + ")");

                        request.setAttribute("porukaounosu", "Izvestaj je uspešno unet");
                        adresa = "LOPuneto.jsp";
                        sesija.setAttribute("partonok", "");
                    }catch(SQLException greska1){
                        sesija.invalidate();
                        request.setAttribute("porukaogresci", "Greska: " + greska1);
                        adresa = "LOPgreska.jsp";
                    }
                }
            }       
        }catch(SQLException greska){
                    sesija.invalidate();
                    request.setAttribute("porukaogresci", "Greska: " + greska);
                    adresa = "LOPgreska.jsp";
        }finally{
            db.getInstance().putConnection(con);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(adresa);
        rd.forward(request, response);
        
    }
}
