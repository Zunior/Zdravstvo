package Servleti;

import java.io.IOException;
import java.io.PrintWriter;
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
public class Odeljenja extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
    HttpSession sesija = request.getSession();
    request.setAttribute("prvi","nesto");
    String adresa = "admNacelnik.jsp";
        
    
    
    RequestDispatcher rd = request.getRequestDispatcher(adresa);
    rd.forward(request, response);
    }

}
