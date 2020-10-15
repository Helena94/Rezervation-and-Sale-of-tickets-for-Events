/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.userservlet;

import database.UserDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Users;

/**
 *
 * @author Jelena Jovanovic
 */
public class UserViewServlet extends HttpServlet {

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
        UserDaoImpl udi = new UserDaoImpl();

        ArrayList<Users> users = null;
        int limit = 10;
        request.setAttribute("limit", String.valueOf(limit));
        int num = 0;

        if (request.getParameter("index") == null) {
            num = udi.getUserCount();
            users = udi.getUserWithLocation(0, limit);

            request.setAttribute("index", String.valueOf(0));
            request.setAttribute("pageNum", 1);
        } else {

            int index = Integer.parseInt(request.getParameter("index"));
            if (request.getParameter("pageNum") == null) {
                request.setAttribute("pageNum", 1);
            } else {
                request.setAttribute("pageNum", request.getParameter("pageNum"));
            }
            request.setAttribute("index", request.getParameter("index"));

             num = udi.getUserCount();

            users = udi.getUserWithLocation(index, limit);

        }
        num = (int) (Math.ceil((double) num / limit) * limit);
        request.setAttribute("num", String.valueOf(num));
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/user/usersview.jsp");
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
