/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import datatransferobject.RezervationPage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Rezervations;

/**
 *
 * @author Jelena Jovanovic
 */
public class RezerveDaoImpl {

    static Connection con = DatabaseConnection.getConnection();

    public int insertRezervation(Rezervations rezervation) {
        String query
                = "INSERT INTO rezervations( ticked_id, user_id, number_of_tickeds, date_time, tickets_purchached, price) VALUES ( ?, ?, ?, ?, ?, ?)";

        int n = 0;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, rezervation.getTicket_id());
            ps.setInt(2, rezervation.getUser_id());
            ps.setInt(3, rezervation.getNumber_of_tickets());
            ps.setTimestamp(4, new Timestamp(rezervation.getDate_time().getTime()));

            ps.setString(5, rezervation.getTickets_purchached());
            ps.setDouble(6, rezervation.getPrice());
            n = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<RezervationPage> getRezervationsByTreasurer(int location_id, int offset, int limit) {
        ArrayList<RezervationPage> rezervations = new ArrayList();
        String query
                = "SELECT r.id,r.ticked_id,r.number_of_tickeds,r.date_time,r.tickets_purchached,r.price,u.username,u.email,t.category,e.id,e.title,e.date_time FROM rezervations AS r LEFT JOIN tickets AS t ON r.ticked_id=t.id LEFT JOIN users AS u ON r.user_id=u.id LEFT JOIN events AS e ON t.event_id = e.id WHERE e.location_id = ? " + "LIMIT " + limit + " OFFSET " + offset;
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, location_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                RezervationPage rezervation = new RezervationPage();
                rezervation.setId(rs.getInt("r.id"));
                rezervation.setTicket_id(rs.getInt("r.ticked_id"));
                rezervation.setNumber_of_tickets(rs.getInt("r.number_of_tickeds"));
                rezervation.setRezervation_date((Date) rs.getTimestamp("r.date_time"));
                rezervation.setTickets_purchached(rs.getString("r.tickets_purchached"));
                rezervation.setPrice(rs.getDouble("r.price"));
                rezervation.setUsername(rs.getString("u.username"));
                rezervation.setEmail(rs.getString("u.email"));
                rezervation.setCategory(rs.getString("t.category"));
                rezervation.setEvent_id(rs.getInt("e.id"));
                rezervation.setTitle(rs.getString("e.title"));
                rezervation.setEvent_date((Date) rs.getTimestamp("e.date_time"));
                rezervations.add(rezervation);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return rezervations;
        } else {
            return null;
        }

    }

    public ArrayList<RezervationPage> getRezervationsByUserId(int id, int offset, int limit) {
        ArrayList<RezervationPage> rezervations = new ArrayList();
        String query
                = "SELECT r.id,r.ticked_id,r.number_of_tickeds,r.date_time,r.tickets_purchached,r.price,u.username,u.email,t.category,e.id,e.title,e.date_time FROM rezervations AS r LEFT JOIN tickets AS t ON r.ticked_id=t.id LEFT JOIN users AS u ON r.user_id=u.id LEFT JOIN events AS e ON t.event_id = e.id WHERE u.id = ? " + "LIMIT " + limit + " OFFSET " + offset;
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                RezervationPage rezervation = new RezervationPage();
                rezervation.setId(rs.getInt("r.id"));
                rezervation.setTicket_id(rs.getInt("r.ticked_id"));
                rezervation.setNumber_of_tickets(rs.getInt("r.number_of_tickeds"));
                rezervation.setRezervation_date((Date) rs.getTimestamp("r.date_time"));
                rezervation.setTickets_purchached(rs.getString("r.tickets_purchached"));
                rezervation.setPrice(rs.getDouble("r.price"));
                rezervation.setUsername(rs.getString("u.username"));
                rezervation.setEmail(rs.getString("u.email"));
                rezervation.setCategory(rs.getString("t.category"));
                rezervation.setEvent_id(rs.getInt("e.id"));
                rezervation.setTitle(rs.getString("e.title"));
                rezervation.setEvent_date((Date) rs.getTimestamp("e.date_time"));
                rezervations.add(rezervation);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return rezervations;
        } else {
            return null;
        }

    }

    public int getRezervationsByUserIdCount(int id) {
        int num = 0;
        String query
                = "SELECT COUNT(*) AS num FROM rezervations AS r LEFT JOIN tickets AS t ON r.ticked_id=t.id LEFT JOIN users AS u ON r.user_id=u.id LEFT JOIN events AS e ON t.event_id = e.id where u.id = ?";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                num = rs.getInt("num");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return num;
        } else {
            return 0;
        }

    }

    public int getRezervationsByTreasurerCount(int location_id) {
        int num = 0;
        String query
                = "SELECT COUNT(*) AS num FROM rezervations AS r LEFT JOIN tickets AS t ON r.ticked_id=t.id LEFT JOIN users AS u ON r.user_id=u.id LEFT JOIN events AS e ON t.event_id = e.id where e.location_id = ?";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, location_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                num = rs.getInt("num");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return num;
        } else {
            return 0;
        }

    }

    public int deleteRezervation(int id) {
        String query
                = "DELETE FROM rezervations WHERE id = ?";

        int n = 0;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, id);
            n = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateRezervation(int id) {
        String query
                = "UPDATE rezervations SET tickets_purchached = True WHERE id = ?";

        int n = 0;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, id);
            n = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<Date> getRezervationsByEventIdAndUserId(int event_id, int user_id) {
        ArrayList<Date> rezervations = new ArrayList();
        String query
                = "SELECT r.date_time FROM rezervations AS r LEFT JOIN tickets AS t ON r.ticked_id=t.id LEFT JOIN users AS u ON r.user_id=u.id LEFT JOIN events AS e ON t.event_id = e.id WHERE r.tickets_purchached = ? AND e.id = ? AND u.id = ?";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1, "False");
            ps.setInt(2, event_id);
            ps.setInt(3, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                rezervations.add((Date) rs.getTimestamp("r.date_time"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return rezervations;
        } else {
            return null;
        }

    }

    public Date getRezervationsTimeByID(int id) {
        Date rezervations = null;
        String query
                = "SELECT date_time FROM rezervations WHERE id = ?";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
           
            ps.setInt(1, id);
           
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                rezervations = (Date) rs.getTimestamp("date_time");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return rezervations;
        } else {
            return null;
        }

    }
    
    public int getRezervationsPass48HoursByUserIdCount(int id) {
        int num = 0;
        String query
                = "SELECT COUNT(*) AS num FROM rezervations AS r LEFT JOIN tickets AS t ON r.ticked_id=t.id LEFT JOIN users AS u ON r.user_id=u.id LEFT JOIN events AS e ON t.event_id = e.id WHERE r.tickets_purchached = ? AND u.id=? AND TIMESTAMPDIFF(HOUR, r.date_time,NOW()) > 48";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1,"False");
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                num = rs.getInt("num");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RezerveDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return num;
        } else {
            return 0;
        }

    }
}
