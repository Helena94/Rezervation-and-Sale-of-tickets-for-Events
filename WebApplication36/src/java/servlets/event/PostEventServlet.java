
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.event;

import database.DaoImpl;
import database.TicketsDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Events;
import models.Locations;
import models.Tickets;
import util.DateFormat;

/**
 *
 * @author Jelena Jovanovic
 */
public class PostEventServlet extends HttpServlet {

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
        TicketsDaoImpl tdi = new TicketsDaoImpl();
        Events event = new Events();
        int id = Integer.parseInt(request.getParameter("eventpostid"));
        event.setId(id);
        event.setTitle(request.getParameter("eventposttitle"));
        event.setLocation(new Locations());
        event.getLocation().setId(Integer.parseInt(request.getParameter("eventpostlocationid")));
        event.setDate_time(DateFormat.formatDate(request.getParameter("eventpostdate")));
        event.setDescription(request.getParameter("eventpostdescription"));
        event.setBase64Image(request.getParameter("eventpostpicture"));
        event.setBase64Video(request.getParameter("eventpostvideo"));
        String[] tickets_id = request.getParameterValues("eventpostticket_id");
        String[] tickets_event_id = request.getParameterValues("eventpostevent_id");
        String[] tickets_category = request.getParameterValues("eventpostcategory");
        String[] tickets_price = request.getParameterValues("eventpostprice");
        String[] tickets_numberoftickets = request.getParameterValues("eventpostnumberoftickets");
        String[] tickets_numberofrezervedtickets = request.getParameterValues("eventpostnumberofrezervedtickets");
        String[] tickets_maxrezervedticketsperperson = request.getParameterValues("eventpostmaxrezervedticketsperperson");

        if (event.getId() != 0) {
            di.updateEvent(event);
            if(tickets_id != null){
            for (int i = 0; i < tickets_id.length; i++) {
                Tickets ticket = new Tickets();
                ticket.setId(Integer.parseInt(tickets_id[i]));
                ticket.setEvent_id(id);
                ticket.setCategory(tickets_category[i]);
                ticket.setPrice(Double.parseDouble(tickets_price[i]));
                ticket.setNumber_of_tickets(Integer.parseInt(tickets_numberoftickets[i]));
                ticket.setNumber_of_rezerved_tickets(Integer.parseInt(tickets_numberofrezervedtickets[i]));
                ticket.setMax_rezerved_tickets_per_person(Integer.parseInt(tickets_maxrezervedticketsperperson[i]));
                if (ticket.getId() != 0) {
                    tdi.updateTicket(ticket);
                } else {
                    tdi.insertTicket(ticket);
                }
            }}
            String posteventMsg = "Successful edit";
            //request.setAttribute("posteventMsg", "Successful edit");
            RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher(("/details?event_id="+id+"&posteventMsg="+posteventMsg));
        dispatcher.forward(request, response);
        } else {
            id = di.insertEvent(event);
            if(tickets_id != null){
            for (int i = 0; i < tickets_id.length; i++) {
                Tickets ticket = new Tickets();
                ticket.setId(Integer.parseInt(tickets_id[i]));
                ticket.setEvent_id(id);
                ticket.setCategory(tickets_category[i]);
                ticket.setPrice(Double.parseDouble(tickets_price[i]));
                ticket.setNumber_of_tickets(Integer.parseInt(tickets_numberoftickets[i]));
                ticket.setNumber_of_rezerved_tickets(Integer.parseInt(tickets_numberofrezervedtickets[i]));
                ticket.setMax_rezerved_tickets_per_person(Integer.parseInt(tickets_maxrezervedticketsperperson[i]));
                if (ticket.getId() != 0) {
                    tdi.updateTicket(ticket);
                } else {
                    tdi.insertTicket(ticket);
                }
            }}
            String posteventMsg = "Successful \"Successfully created event\"";
            //request.setAttribute("posteventMsg", "Successfully created event");
            RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher(("/addevent?posteventMsg="+posteventMsg));
        dispatcher.forward(request, response);
        }

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
