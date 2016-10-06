/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleti.PAC;

import Beans.Pacijent;
import Database.db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jelena
 */
public class PacijentIstorijat extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession sesija = request.getSession();
        Pacijent pac = (Pacijent)sesija.getAttribute("pacijent");
        String odabranI = (String)request.getParameter("odabirI");
        if(odabranI == null)
            odabranI = "";
        sesija.setAttribute("odabranI", odabranI);
        String adresa="PAC/PacIzvestaji.jsp";
        
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        HashMap<Integer, String> LOPizvestaji = new HashMap<Integer, String>();
        //Promenljive za LOP izvestaj
        String lopdijagnoza = "";
        String imeBolesti = "";
        String tegobe = "";
        String terapija = "";
        String napomena = "";
        Integer idUput = 0;
        //Promenljive za LS izvestaj
        String datum = "";
        String lsdijagnoza = "";
        String zakljucak = "";
        Integer idNalaz = 0;
        //Promenljive za nalaz
        String disanje = "";
        String puls = "";
        String teltemp = "";
        String krvpritisak = "";
        String mokraca = "";
        
        
        
        try{
            con = db.getInstance().getConnection();
            st = con.createStatement();
            
            rs = st.executeQuery("select * from izvestajlop where idZdrKarton='" + pac.getKorIme() + "'");
            while(rs.next()){
                LOPizvestaji.put(rs.getInt("idIzvestajLOP"), rs.getString("datumPregleda"));
            }
            sesija.setAttribute("LOPizvestaji", LOPizvestaji);
            
            if(!odabranI.equals(""))
            {
                try{
                    rs = st.executeQuery("select * from izvestajlop where idIzvestajLOP=" + Integer.parseInt(odabranI));
                    while(rs.next()){
                        lopdijagnoza = rs.getString("dijagnoza");
                        imeBolesti = rs.getString("imeBolesti");
                        tegobe = rs.getString("tegobe");
                        terapija = rs.getString("terapija");
                        napomena = rs.getString("napomena");
                        idUput = rs.getInt("idUput");
                    }
                    if(idUput==null)
                        idUput = 0;
                    
                    if(idUput!=0){
                        try{
                            rs = st.executeQuery("select * from izvestajls where idUput=" + idUput);
                            while(rs.next()){
                                datum = rs.getString("datumPregleda");
                                lsdijagnoza = rs.getString("dijagnoza");
                                zakljucak = rs.getString("zakljucak");
                                idNalaz = rs.getInt("idNalaz");
                            }
                            if(idNalaz==null)
                                idNalaz = 0;
                            
                            if(idNalaz!=0){
                                try{
                                    rs = st.executeQuery("select * from nalaz where idNalaz=" + idNalaz);
                                    while(rs.next()){
                                        disanje = rs.getString("disanje");
                                        puls = rs.getString("puls");
                                        teltemp = rs.getString("telTemp");
                                        krvpritisak = rs.getString("krvPritisak");
                                        mokraca = rs.getString("mokraca");
                                    }
                                    
                                }catch(SQLException greska1){
                                    sesija.invalidate();
                                    request.setAttribute("porukaogresci", "Greska: " + greska1);
                                    adresa = "LOPgreska.jsp";
                                }
                            }
                        }catch(SQLException greska1){
                            sesija.invalidate();
                            request.setAttribute("porukaogresci", "Greska: " + greska1);
                            adresa = "LOPgreska.jsp";
                }
                    }
                }catch(SQLException greska1){
                    sesija.invalidate();
                    request.setAttribute("porukaogresci", "Greska: " + greska1);
                    adresa = "LOPgreska.jsp";
                }
            }
        
        }catch(SQLException greska){
                    sesija.invalidate();
                    request.setAttribute("porukaogresci", "Greska: " + greska);
                    adresa = "LOPgreska.jsp";
        }finally{
            db.getInstance().putConnection(con);
        }
        
        sesija.setAttribute("lopdijagnoza", lopdijagnoza);
        sesija.setAttribute("imeBolesti", imeBolesti);
        sesija.setAttribute("tegobe", tegobe);
        sesija.setAttribute("terapija", terapija);
        sesija.setAttribute("napomena", napomena);
        sesija.setAttribute("datum", datum);
        sesija.setAttribute("lsdijagnoza", lsdijagnoza);
        sesija.setAttribute("zakljucak", zakljucak);
        sesija.setAttribute("disanje", disanje);
        sesija.setAttribute("puls", puls);
        sesija.setAttribute("teltemp", teltemp);
        sesija.setAttribute("krvpritisak", krvpritisak);
        sesija.setAttribute("mokraca", mokraca);
        
        RequestDispatcher rd = request.getRequestDispatcher(adresa);
        rd.forward(request, response);
        
        
    }
}
