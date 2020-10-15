/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.util.ArrayList;

import models.Events;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Locations;
import models.Users;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import util.YoutubeUrl;

/**
 *
 * @author Jelena Jovanovic
 */
public class DaoImpl {

    static Connection con = DatabaseConnection.getConnection();

    public ArrayList<Events> getEventsWithLocation(int offset, int limit) {
        ArrayList<Events> events = new ArrayList();
        String query
                = "SELECT e.id,e.title,e.date_time,l.id,l.title,l.address,l.city FROM events AS e,locations AS l WHERE e.location_id=l.id " + "LIMIT " + limit + " OFFSET " + offset;
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                Events event = new Events();
                event.setId(rs.getInt("e.id"));
                event.setTitle(rs.getString("e.title"));
                event.setDate_time((Date) rs.getTimestamp("e.date_time"));
                Locations location = new Locations();
                location.setId(rs.getInt("l.id"));
                location.setTitle(rs.getString("l.title"));
                location.setAddress(rs.getString("l.address"));
                location.setCity(rs.getString("l.city"));
                event.setLocation(location);
                events.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return events;
        } else {
            return null;
        }

    }

    public ArrayList<Events> getEventsWithLocationByTitle(int offset, int limit, String title) {
        ArrayList<Events> events = new ArrayList();
        String query
                = "SELECT e.id,e.title,e.date_time,l.id,l.title,l.address,l.city FROM events AS e,locations AS l WHERE e.location_id=l.id AND e.date_time >= NOW() AND LOWER(e.title) like ?" + "LIMIT " + limit + " OFFSET " + offset;
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1, "%" + title + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                Events event = new Events();
                event.setId(rs.getInt("e.id"));
                event.setTitle(rs.getString("e.title"));
                event.setDate_time((Date) rs.getTimestamp("e.date_time"));
                Locations location = new Locations();
                location.setId(rs.getInt("l.id"));
                location.setTitle(rs.getString("l.title"));
                location.setAddress(rs.getString("l.address"));
                location.setCity(rs.getString("l.city"));
                event.setLocation(location);
                events.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return events;
        } else {
            return null;
        }

    }

    public ArrayList<Events> getEventsWithLocationByLocationTitle(int offset, int limit, String locationtitle) {
        ArrayList<Events> events = new ArrayList();
        String query
                = "SELECT e.id,e.title,e.date_time,l.id,l.title,l.address,l.city FROM events AS e,locations AS l WHERE e.location_id=l.id AND e.date_time >= NOW() AND LOWER(l.title) like ?" + "LIMIT " + limit + " OFFSET " + offset;
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1, "%" + locationtitle + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                Events event = new Events();
                event.setId(rs.getInt("e.id"));
                event.setTitle(rs.getString("e.title"));
                event.setDate_time((Date) rs.getTimestamp("e.date_time"));
                Locations location = new Locations();
                location.setId(rs.getInt("l.id"));
                location.setTitle(rs.getString("l.title"));
                location.setAddress(rs.getString("l.address"));
                location.setCity(rs.getString("l.city"));
                event.setLocation(location);
                events.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return events;
        } else {
            return null;
        }

    }

    public ArrayList<Events> getEventsWithLocationByDate(int offset, int limit, Date from, Date to) {
        ArrayList<Events> events = new ArrayList();
        String query
                = "SELECT e.id,e.title,e.date_time,l.id,l.title,l.address,l.city FROM events AS e,locations AS l WHERE e.location_id=l.id AND e.date_time >= NOW() AND e.date_time BETWEEN ? AND ?" + "LIMIT " + limit + " OFFSET " + offset;
        boolean check = false;
        Timestamp timestamp1 = new Timestamp(from.getTime());
        System.out.println(timestamp1);
        Timestamp timestamp2 = new Timestamp(to.getTime());
        System.out.println(timestamp2);
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setTimestamp(1, timestamp1);
            ps.setTimestamp(2, timestamp2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                System.out.println();
                Events event = new Events();
                event.setId(rs.getInt("e.id"));
                event.setTitle(rs.getString("e.title"));
                event.setDate_time((Date) rs.getTimestamp("e.date_time"));
                Locations location = new Locations();
                location.setId(rs.getInt("l.id"));
                location.setTitle(rs.getString("l.title"));
                location.setAddress(rs.getString("l.address"));
                location.setCity(rs.getString("l.city"));
                event.setLocation(location);
                events.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return events;
        } else {
            return null;
        }

    }

    public int getEventsWithLocationCount() {

        String query
                = "SELECT COUNT(*) AS num FROM events";
        boolean check = false;
        int num = 0;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                num = rs.getInt("num");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return num;
        } else {
            return 0;
        }
    }

    public int getEventsWithLocationByTitleCount(String title) {
        String query
                = "SELECT Count(*) AS num  FROM events WHERE events.date_time >= NOW() AND LOWER(events.title) like ?";
        boolean check = false;
        int num = 0;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1, "%" + title + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                num = rs.getInt("num");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return num;
        } else {
            return 0;
        }

    }

    public int getEventsWithLocationByLocationTitleCount(String locationtitle) {

        String query
                = "SELECT COUNT(*) AS num FROM events AS e,locations AS l WHERE e.location_id=l.id AND e.date_time >= NOW() AND LOWER(l.title) like ?";
        boolean check = false;
        int num = 0;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1, "%" + locationtitle + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                num = rs.getInt("num");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return num;
        } else {
            return 0;
        }

    }

    public int getEventsWithLocationByDateCount(Date from, Date to) {
        String query
                = "SELECT COUNT(*) AS num FROM events AS e,locations AS l WHERE e.location_id=l.id AND e.date_time >= NOW() AND e.date_time between ? and ?";
        boolean check = false;
        Timestamp timestamp1 = new Timestamp(from.getTime());
        System.out.println(timestamp1);
        Timestamp timestamp2 = new Timestamp(to.getTime());
        System.out.println(timestamp2);
        int num = 0;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setTimestamp(1, timestamp1);
            ps.setTimestamp(2, timestamp2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                num = rs.getInt("num");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return num;
        } else {
            return 0;
        }

    }

    public Events getEventWithLocationById(int id) {
        Events event = new Events();
        String query
                = "SELECT e.id,e.title,e.date_time,e.description,e.picture,e.video,l.id,l.title,l.address,l.city FROM events AS e,locations AS l WHERE e.location_id=l.id AND e.id = ?";
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                event.setId(rs.getInt("e.id"));
                event.setTitle(rs.getString("e.title"));
                event.setDate_time((Date) rs.getTimestamp("e.date_time"));
                event.setDescription(rs.getString("e.description"));
                event.setBase64Image(rs.getString("e.picture"));
                event.setBase64Video(rs.getString("e.video"));
                Locations location = new Locations();
                location.setId(rs.getInt("l.id"));
                location.setTitle(rs.getString("l.title"));
                location.setAddress(rs.getString("l.address"));
                location.setCity(rs.getString("l.city"));
                event.setLocation(location);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return event;
        } else {
            return null;
        }

    }
    
     public void updateEvent(Events event) 
       
    { 
  try {
        String query 
            = "UPDATE events SET title = ?, date_time = ?, description = ?, picture = ?, video = ?, location_id = ? WHERE id = ?"; 
        PreparedStatement ps 
            = con.prepareStatement(query); 
        ps.setString(1, event.getTitle()); 
        ps.setTimestamp(2,new Timestamp(event.getDate_time().getTime()));
        ps.setString(3, event.getDescription());
        ps.setString(4, event.getBase64Image());
        ps.setString(5,YoutubeUrl.changeUrl( event.getBase64Video()));
        ps.setInt(6, event.getLocation().getId());
        ps.setInt(7,event.getId());
        ps.executeUpdate(); 
        } catch (SQLException ex) {
                Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
    } 
    
    public int insertEvent(Events event) 
      { 
          String query 
            = "INSERT INTO events(title, date_time, description, picture, video, location_id) VALUES (?, ?, ?, ?, ?, ?)"; 
        
        int n = 1;
        try {
        PreparedStatement ps 
            = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS); 
        ps.setString(1, event.getTitle()); 
        ps.setTimestamp(2,new Timestamp(event.getDate_time().getTime()));
        ps.setString(3, event.getDescription());
        ps.setString(4, event.getBase64Image());
        ps.setString(5,YoutubeUrl.changeUrl( event.getBase64Video()));
        ps.setInt(6, event.getLocation().getId());
        ps.executeUpdate(); 
        ResultSet rs= ps.getGeneratedKeys();
            if (rs.next()) 
            {
                n = rs.getInt(1);
              System.out.println("Last Inserted ID = "+rs.getInt(1));
            }  
        } catch (SQLException ex) {
                Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        return n; 
    } 
       public String getEventTitleById(int id) {
       
        String query
                = "SELECT title FROM events WHERE id = ?";
        boolean check = false;
        String title = "";
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
               
                title = rs.getString("title");
                

            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return title;
        } else {
            return null;
        }

    }
   
     public Date getEventsTimeById(int id) {
       
        String query
                = "SELECT date_time FROM events WHERE id = ?";
        boolean check = false;
        Date date = null;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                date = (Date) rs.getTimestamp("date_time");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return date;
        } else {
            return null;
        }

    }
}
