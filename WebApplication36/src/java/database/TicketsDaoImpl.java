/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import datatransferobject.TicketsDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Tickets;

/**
 *
 * @author Jelena Jovanovic
 */
public class TicketsDaoImpl {

    static Connection con = DatabaseConnection.getConnection();

    public ArrayList<Tickets> getTicketsByEvent_id(int event_id) {
        ArrayList<Tickets> tickets = new ArrayList();
        String query
                = "SELECT * FROM tickets WHERE event_id = ?";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, event_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                check = true;
                Tickets ticket = new Tickets();
                ticket.setId(rs.getInt("id"));
                ticket.setEvent_id(event_id);
                ticket.setCategory(rs.getString("category"));
                ticket.setPrice(rs.getDouble("price"));
                ticket.setNumber_of_tickets(rs.getInt("number_of_tickets"));
                ticket.setNumber_of_rezerved_tickets(rs.getInt("number_of_rezerved_tickets"));
                ticket.setMax_rezerved_tickets_per_person(rs.getInt("max_rezerved_tickets_per_person"));
                tickets.add(ticket);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TicketsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return tickets;
        } else {
            return null;
        }

    }

    public void updateTicket(Tickets ticket) {

        String query
                = "update tickets set event_id = ?, category = ?, price = ?, number_of_tickets = ?, number_of_rezerved_tickets = ?, max_rezerved_tickets_per_person = ? where id = ?";
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, ticket.getEvent_id());
            ps.setString(2, ticket.getCategory());
            ps.setDouble(3, ticket.getPrice());
            ps.setInt(4, ticket.getNumber_of_tickets());
            ps.setInt(5, ticket.getNumber_of_rezerved_tickets());
            ps.setInt(6, ticket.getMax_rezerved_tickets_per_person());
            ps.setInt(7, ticket.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TicketsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public int insertTicket(Tickets ticket) {
        String query
                = "INSERT INTO tickets(event_id, category, price, number_of_tickets, number_of_rezerved_tickets, max_rezerved_tickets_per_person) VALUES (?, ?, ?, ?, ?, ?)";

        int n = 0;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, ticket.getEvent_id());
            ps.setString(2, ticket.getCategory());
            ps.setDouble(3, ticket.getPrice());
            ps.setInt(4, ticket.getNumber_of_tickets());
            ps.setInt(5, ticket.getNumber_of_rezerved_tickets());
            ps.setInt(6, ticket.getMax_rezerved_tickets_per_person());
            n = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(TicketsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public TicketsDto getTicketsDtoById(int id) {
        TicketsDto ticket = new TicketsDto();
        String query
                = "SELECT number_of_tickets,number_of_rezerved_tickets FROM tickets WHERE id = ?";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                check = true;

                ticket.setNumber_of_tickets(rs.getInt("number_of_tickets"));
                ticket.setNumber_of_rezerved_tickets(rs.getInt("number_of_rezerved_tickets"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(TicketsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return ticket;
        } else {
            return null;
        }

    }

    public void updateNumberOfRezervedTicketsById(int numTickets, int id) {

        String query
                = "update tickets set number_of_rezerved_tickets = ? where id = ?";
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, numTickets);
            ps.setInt(2, id);

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TicketsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
     public Tickets getTicketsById(int id) {
        Tickets ticket = new Tickets();
        String query
                = "SELECT * FROM tickets WHERE id = ?";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                check = true;
                
                ticket.setId(rs.getInt("id"));
                ticket.setEvent_id(rs.getInt("event_id"));
                ticket.setCategory(rs.getString("category"));
                ticket.setPrice(rs.getDouble("price"));
                ticket.setNumber_of_tickets(rs.getInt("number_of_tickets"));
                ticket.setNumber_of_rezerved_tickets(rs.getInt("number_of_rezerved_tickets"));
                ticket.setMax_rezerved_tickets_per_person(rs.getInt("max_rezerved_tickets_per_person"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(TicketsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return ticket;
        } else {
            return null;
        }

    }
     
     
    public ArrayList<Tickets> getTicketsByAndConditionEvent_id(int event_id) {
        ArrayList<Tickets> tickets = new ArrayList();
        String query
                = "SELECT * FROM tickets WHERE number_of_rezerved_tickets < number_of_tickets AND event_id = ?";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, event_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                check = true;
                Tickets ticket = new Tickets();
                ticket.setId(rs.getInt("id"));
                ticket.setEvent_id(event_id);
                ticket.setCategory(rs.getString("category"));
                ticket.setPrice(rs.getDouble("price"));
                ticket.setNumber_of_tickets(rs.getInt("number_of_tickets"));
                ticket.setNumber_of_rezerved_tickets(rs.getInt("number_of_rezerved_tickets"));
                ticket.setMax_rezerved_tickets_per_person(rs.getInt("max_rezerved_tickets_per_person"));
                tickets.add(ticket);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TicketsDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return tickets;
        } else {
            return null;
        }

    }

}
