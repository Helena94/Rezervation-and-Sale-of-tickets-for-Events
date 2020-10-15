/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.rezervations;

import database.DaoImpl;
import database.RezerveDaoImpl;
import database.TicketsDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Rezervations;
import models.Tickets;
import util.DateFormat;

/**
 *
 * @author Jelena Jovanovic
 */
public class RezerveServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        int user_id = Integer.parseInt((String) session.getAttribute("user_id"));
        int ticket_id = Integer.parseInt(request.getParameter("rezerveticketid"));
        int event_id = Integer.parseInt(request.getParameter("rezerveeventid"));
        int rezervenumberoftickets = Integer.parseInt(request.getParameter("rezervenumberoftickets"));
        TicketsDaoImpl tdi = new TicketsDaoImpl();
        DaoImpl di = new DaoImpl();
        Tickets ticket= tdi.getTicketsById(ticket_id);
        Date nowDate = new Date();
        RezerveDaoImpl rdi = new RezerveDaoImpl();
        ArrayList<Date> dates = rdi.getRezervationsByEventIdAndUserId(event_id , user_id  );
        int countRezervationPass48 = rdi.getRezervationsPass48HoursByUserIdCount(Integer.parseInt((String)session.getAttribute("user_id") ));
                                          
    if(countRezervationPass48 < 3 && di.getEventsTimeById(event_id).after(nowDate) && DateFormat.timeDiffInHours(nowDate, di.getEventsTimeById(event_id))>48 && !DateFormat.ifOneMore48Hours(dates) ){
        
        if(rezervenumberoftickets + ticket.getNumber_of_rezerved_tickets() <= ticket.getNumber_of_tickets()){
            
            Rezervations rezervation = new Rezervations();
            rezervation.setTicket_id(ticket_id);
            rezervation.setUser_id(user_id);
            rezervation.setDate_time(nowDate);
            rezervation.setNumber_of_tickets(rezervenumberoftickets);
            tdi.updateNumberOfRezervedTicketsById(rezervenumberoftickets + ticket.getNumber_of_rezerved_tickets(), ticket_id);
            rezervation.setTickets_purchached("False");
            rezervation.setPrice(rezervenumberoftickets*ticket.getPrice());
            rdi.insertRezervation(rezervation);
            session.setAttribute("successMsg", "Rezerved tickets");
        }else{
            session.setAttribute("failMsg", "Limited tickets");
        }}else{
            session.setAttribute("failMsg", "Event is either over or there is unpaid rezervation for this event(maybe 3 unpaid rezervations) or cannot rezerve because its less then 48 hours before begining of event.");
        }
        response.sendRedirect(("rezerve?event_id="+event_id));
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
