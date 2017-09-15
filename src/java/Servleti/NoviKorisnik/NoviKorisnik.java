package Servleti.NoviKorisnik;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Database.db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sasha
 */
public class NoviKorisnik extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession sesija = request.getSession();
        String adresa = "NoviKorisnik/noviKorisnik.jsp";
        
        String a, b, c, d, e, f, g, h, i;
        a=b=c=d=e=f=g=h=i= "Obavezno polje";
        
        String ime = request.getParameter("ime");
        if(ime==null || ime.equals(""))
            ime = "";
        else
            a="";
        sesija.setAttribute("ime", ime);
        sesija.setAttribute("a", a);
        String prezime = request.getParameter("prezime");
        if(prezime==null || prezime.equals(""))
            prezime = "";
        else
            b="";
        sesija.setAttribute("prezime", prezime);
        sesija.setAttribute("b", b);
        String pol = request.getParameter("pol");
        if(pol==null)
            pol = "muski";
        sesija.setAttribute("pol", pol);
        String lozinka = request.getParameter("lozinka");
        if(lozinka==null || lozinka.equals(""))
            lozinka = "";
        else
            c="";
        sesija.setAttribute("lozinka", lozinka);
        sesija.setAttribute("c", c);
        String jmbg = request.getParameter("jmbg");
        if(jmbg==null || jmbg.equals(""))
            jmbg = "";
        else if(jmbg.length()!=13 && !jmbg.matches("[0-9]"))
            d="morate upisati 13 cifara";  
        else
            d="";
        sesija.setAttribute("jmbg", jmbg);
        sesija.setAttribute("d", d);
        String inos = request.getParameter("inos");
        if(inos==null || inos.equals(""))
            inos = "";
        else
            e="";
        sesija.setAttribute("inos", inos);
        sesija.setAttribute("e", e);
        String snos = request.getParameter("snos");
        if(snos==null || snos.equals(""))
            snos = "";
        else
            f="";
        sesija.setAttribute("snos", snos);
        sesija.setAttribute("f", f);
        String adr = request.getParameter("adr");
        if(adr==null || adr.equals(""))
            adr = "";
        else
            g="";
        sesija.setAttribute("adr", adr);
        sesija.setAttribute("g", g);
        String telefon = request.getParameter("telefon");
        if(telefon==null || telefon.equals(""))
            telefon = "";
        else
            h="";
        sesija.setAttribute("telefon", telefon);
        sesija.setAttribute("h", h);
        String email = request.getParameter("email");
        if(email==null || email.equals(""))
            email = "";
        else
            i="";
        sesija.setAttribute("email", email);
        sesija.setAttribute("i", i);
        
        String upisivanje = a+b+c+d+e+f+g+h+i;
        if(upisivanje.equals("")){
        
            Connection con = null;
            Statement st = null;
            boolean success = true;
            
            try{
                con = db.getInstance().getConnection();
                st = con.createStatement();
                st.executeUpdate("INSERT INTO `pacijent` (`korisnickoIme`, `odobreno`, `ime`, `prezime`, "
                        + "`pol`, `lozinka`, `JMBG`, `imeNosOsig`, `srodSaNos`, `adresa`, `telefon`, `email`, "
                        + "`idUstanova`) VALUES (NULL, 0, '"+ime+"', '"+prezime+"', '"+pol+"', '"+lozinka+"', "
                        + "'"+jmbg+"', '"+inos+"', '"+snos+"', '"+adr+"', '"+telefon+"', '"+email+"', NULL);");
                st.close();
            }catch(SQLException greska){
                        success = false;
                        sesija.invalidate();
                        request.setAttribute("porukaogresci", "Greska: " + greska);
                        adresa = "greska.jsp";
            }
            finally{ 
                db.getInstance().putConnection(con);
//                adresa = "index.jsp";
//                sesija.setAttribute("poruka", "Morate sačekati odobrenje. Hvala na registraciji.");
            }
            if(success){
                adresa = "index.jsp";
                sesija.setAttribute("poruka", "Morate sačekati odobrenje. Hvala na registraciji.");
            }

        }
          
        
        
        RequestDispatcher rd = request.getRequestDispatcher(adresa);
        rd.forward(request, response);
        
    }
}
    