/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.event;

import database.DaoImpl;
import database.TicketsDaoImpl;
import datatransferobject.TicketsDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Tickets;

/**
 *
 * @author Jelena Jovanovic
 */
public class SaleTicketServlet extends HttpServlet {

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
        int event_id = Integer.parseInt(request.getParameter("ticketeventid"));
        int ticket_id = Integer.parseInt(request.getParameter("ticketselect"));
        int ticketnum = Integer.parseInt(request.getParameter("ticketnumber"));
        TicketsDaoImpl tdi = new TicketsDaoImpl();
        TicketsDto tdto = tdi.getTicketsDtoById(ticket_id);
        DaoImpl di = new DaoImpl();
        if(di.getEventsTimeById(event_id).after(new Date())){
        if(tdto.getNumber_of_rezerved_tickets()+ticketnum<=tdto.getNumber_of_tickets()){
            tdi.updateNumberOfRezervedTicketsById(tdto.getNumber_of_rezerved_tickets()+ticketnum, ticket_id );
            request.setAttribute("successMsg", "Tickets sold");
        }else{
            request.setAttribute("failMsg", "Limited tickets");
        }}else{
            request.setAttribute("failMsg", "Event is over");
        }
       
        String title = di.getEventTitleById(event_id );
        ArrayList<Tickets> tickets = tdi.getTicketsByEvent_id(event_id);
        request.setAttribute("event_id", String.valueOf(event_id));
        request.setAttribute("title", title);
        request.setAttribute("tickets", tickets);
        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/event/ticketsale.jsp");
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
