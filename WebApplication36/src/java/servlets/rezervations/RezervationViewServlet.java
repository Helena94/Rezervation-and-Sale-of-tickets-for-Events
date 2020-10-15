/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.rezervations;

import database.RezerveDaoImpl;
import datatransferobject.RezervationPage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jelena Jovanovic
 */
public class RezervationViewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<RezervationPage> rezervations = null;
        int limit =10;
        request.setAttribute("limit", String.valueOf(limit));
        int num = 0;
        int index = Integer.parseInt(request.getParameter("index"));
        request.setAttribute("index", request.getParameter("index"));
        RezerveDaoImpl rdi = new RezerveDaoImpl();
        if (request.getParameter("pageNum") == null) {
            request.setAttribute("pageNum", 1);
        } else {
            request.setAttribute("pageNum", request.getParameter("pageNum"));
        }
        HttpSession session = request.getSession();
        if(request.getParameter("role").equals("treasurer")){
            
            int location_id = Integer.parseInt((String) session.getAttribute("user_location_id"));
            rezervations = rdi.getRezervationsByTreasurer(location_id, index, limit);
            num=rdi.getRezervationsByTreasurerCount(location_id);
        }else{
            int user_id = Integer.parseInt((String) session.getAttribute("user_id"));
            rezervations = rdi.getRezervationsByUserId(user_id, index, limit);
            num = rdi.getRezervationsByUserIdCount(user_id);
        }
       

        num = (int) (Math.ceil((double) num / limit) * limit);
        request.setAttribute("num", String.valueOf(num));
        request.setAttribute("rezervations", rezervations);
        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/rezervations/rezervationview.jsp");
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
