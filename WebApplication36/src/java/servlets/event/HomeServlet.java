/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.event;

import database.DaoImpl;
import database.UserDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Events;
import models.Users;
import util.DateFormat;

/**
 *
 * @author Jelena Jovanovic
 */
public class HomeServlet extends HttpServlet {

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
        DaoImpl di = new DaoImpl();
        ArrayList<Events> events = null;
        int limit = 10;
        request.setAttribute("limit", String.valueOf(limit));
        int num = 0;

        if (request.getParameter("index") == null && request.getParameter("types") == null) {
            num = di.getEventsWithLocationCount();
            events = di.getEventsWithLocation(0, limit);

            request.setAttribute("index", String.valueOf(0));
            request.setAttribute("pageNum", 1);
        } else {

            int index = Integer.parseInt(request.getParameter("index"));
            String types = "all";
            if (request.getParameter("searchTypes") == null) {
                types = request.getParameter("types");
            } else {
                types = request.getParameter("searchTypes");
            }
            if (request.getParameter("pageNum") == null) {
                request.setAttribute("pageNum", 1);
            } else {
                request.setAttribute("pageNum", request.getParameter("pageNum"));
            }
            request.setAttribute("index", request.getParameter("index"));
            request.setAttribute("types", types);
            if (types.equals("all")) {

                num = di.getEventsWithLocationCount();

                events = di.getEventsWithLocation(index, limit);
            } else {
                if (types.equals("title")) {
                    String title = "";
                    if (request.getParameter("searchInput1") != null) {
                        title = request.getParameter("searchInput1");
                    } else {
                        title = request.getParameter("title");
                    }
                    request.setAttribute("title", title);
                    events = di.getEventsWithLocationByTitle(index, limit, title);
                    num = di.getEventsWithLocationByTitleCount(title);

                } else {
                    if (types.equals("location")) {
                        String location = "";
                        if (request.getParameter("searchInput1") != null) {
                            location = request.getParameter("searchInput1");
                        } else {
                            location = request.getParameter("location");
                        }

                        request.setAttribute("location", location);
                        events = di.getEventsWithLocationByLocationTitle(index, limit, location);
                        num = di.getEventsWithLocationByLocationTitleCount(location);

                    } else {

                        String stringDate1 = "";
                        String stringDate2 = "";
                        if (request.getParameter("searchInput1") != null) {
                            stringDate1 = request.getParameter("searchInput1");
                        } else {
                            stringDate1 = request.getParameter("date1");
                        }
                        if (request.getParameter("searchInput3") != null) {
                            stringDate2 = request.getParameter("searchInput3");
                        } else {
                            stringDate2 = request.getParameter("date2");
                        }
                        request.setAttribute("date1", stringDate1);
                        request.setAttribute("date2", stringDate2);
                        Date date1 = DateFormat.formatDate(stringDate1);
                        Date date2 = DateFormat.formatDate(stringDate2);
                        events = di.getEventsWithLocationByDate(index, limit, date1, date2);
                        num = di.getEventsWithLocationByDateCount(date1, date2);

                    }
                }
            }
        }
        num = (int) (Math.ceil((double) num / limit) * limit);
        request.setAttribute("num", String.valueOf(num));
        request.setAttribute("events", events);
        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/index.jsp");
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
