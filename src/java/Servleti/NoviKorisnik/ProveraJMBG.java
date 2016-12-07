package Servleti.NoviKorisnik;

import Database.db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sasa.Popovic
 */
public class ProveraJMBG extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String JMBG = (String)request.getParameter("JMBG");
        String adresa = "NoviKorisnik/noviKorisnik.jsp";
        String poruka = "Navedeni JMBG ne postoji u bazi";
        
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String upit = "Select * from pacijent where JMBG='" + JMBG + "'";
        
        try{
                con = db.getInstance().getConnection();
                st = con.createStatement();
                rs = st.executeQuery(upit);
                if(rs.next())
                    poruka = "Navedeni JMBG postoji u bazi";
                st.close();
            }catch(SQLException greska){
                        request.setAttribute("porukaogresci", "Greska: " + greska);
                        adresa = "greska.jsp";
            }
            finally{ 
                db.getInstance().putConnection(con);
            }
        
        try (PrintWriter out = response.getWriter()) {
            out.println(poruka);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
