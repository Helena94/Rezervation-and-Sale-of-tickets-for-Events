/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import static database.DaoImpl.con;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Events;
import models.Locations;
import models.Users;

/**
 *
 * @author Jelena Jovanovic
 */
public class UserDaoImpl {

    static Connection con = DatabaseConnection.getConnection();

    public Users getUserWithLocation(String username, String password) {
        {
            ArrayList<Events> events = new ArrayList();
            String query
                    = "SELECT u.*,l.* FROM users AS u LEFT JOIN locations AS l ON u.location_id=l.id WHERE u.username = ? AND u.password = ?";
            boolean check = false;
            Users user = new Users();
            try {
                PreparedStatement ps
                        = con.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    check = true;
                    user.setId(rs.getInt("u.id"));
                    user.setFirstname(rs.getString("u.firstname"));
                    user.setLastname(rs.getString("u.lastname"));
                    user.setUsername(rs.getString("u.username"));
                    user.setPassword(rs.getString("u.password"));

                    user.setEmail(rs.getString("u.email"));
                    user.setActive(rs.getString("u.active"));
                    user.setRole(rs.getString("u.role"));
                    System.out.println(user.getRole());
                    if (rs.getString("l.id") != null) {
                        Locations location = new Locations();
                        location.setId(rs.getInt("l.id"));
                        location.setTitle(rs.getString("l.title"));
                        location.setAddress(rs.getString("l.address"));
                        location.setCity(rs.getString("l.city"));
                        user.setLocation(location);
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (check == true) {
                return user;
            } else {
                return null;
            }

        }

    }

    public Users getUserWithLocationById(int id) {
        {
            ArrayList<Events> events = new ArrayList();
            String query
                    = "SELECT u.*,l.* FROM users AS u LEFT JOIN locations AS l ON u.location_id=l.id WHERE u.id = ?";
            boolean check = false;
            Users user = new Users();
            try {
                PreparedStatement ps
                        = con.prepareStatement(query);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    check = true;
                    user.setId(rs.getInt("u.id"));
                    user.setFirstname(rs.getString("u.firstname"));
                    user.setLastname(rs.getString("u.lastname"));
                    user.setUsername(rs.getString("u.username"));
                    user.setPassword(rs.getString("u.password"));

                    user.setEmail(rs.getString("u.email"));
                    user.setActive(rs.getString("u.active"));
                    user.setRole(rs.getString("u.role"));
                    System.out.println(user.getRole());
                    if (rs.getString("l.id") != null) {
                        Locations location = new Locations();
                        location.setId(rs.getInt("l.id"));
                        location.setTitle(rs.getString("l.title"));
                        location.setAddress(rs.getString("l.address"));
                        location.setCity(rs.getString("l.city"));
                        user.setLocation(location);
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (check == true) {
                return user;
            } else {
                return null;
            }

        }

    }

    public ArrayList<Locations> getLocations() {

        ArrayList<Locations> locations = new ArrayList();
        String query
                = "SELECT * FROM locations";
        boolean check = false;

        try {
            PreparedStatement ps
                    = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                check = true;

                Locations location = new Locations();
                location.setId(rs.getInt("id"));
                location.setTitle(rs.getString("title"));
                location.setAddress(rs.getString("address"));
                location.setCity(rs.getString("city"));
                locations.add(location);

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return locations;
        } else {
            return null;
        }

    }

    public boolean existUserByUsername(String username) {

        String query = "SELECT * FROM users WHERE username = ?";
        boolean exists = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            exists = rs.next();

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return exists;
    }

    public boolean existUserByPassword(String password) {

        String query = "SELECT * FROM users WHERE password = ?";
        boolean exists = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1, password);

            ResultSet rs = ps.executeQuery();
            exists = rs.next();

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return exists;
    }

    public boolean existUserByEmail(String email) {

        String query = "SELECT * FROM users WHERE email = ?";
        boolean exists = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            exists = rs.next();

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return exists;
    }

    public int insertUser(Users user, String roleOfLoginUser) {
        String query
                = "INSERT INTO users(firstname,lastname,username,password,email,active,role) VALUES (?, ?, ?, ?, ?, ?, ?)";
        if (roleOfLoginUser.equals("admin") && user.getRole().equals("treasurer")) {
            query = "INSERT INTO users(firstname,lastname,username,password,email,active,role,location_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        }
        int n = 0;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getLastname());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword());

            ps.setString(5, user.getEmail());
            ps.setString(6, user.getActive());
            ps.setString(7, user.getRole());
            if (roleOfLoginUser.equals("admin") && user.getRole().equals("treasurer")) {
                ps.setInt(8, user.getLocation().getId());
            }
            n = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public String getUserEmailById(int id) {
        {

            String query
                    = "SELECT email FROM users WHERE id = ?";
            boolean check = false;
            String email = "";
            try {
                PreparedStatement ps
                        = con.prepareStatement(query);
                ps.setInt(1, id);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    check = true;

                    email = rs.getString("email");

                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (check == true) {
                return email;
            } else {
                return null;
            }

        }
    }

    public ArrayList<Users> getUserWithLocation(int offset, int limit) {
        ArrayList<Users> users = new ArrayList();
        String query
                = "SELECT u.*,l.* FROM users AS u LEFT JOIN locations AS l ON u.location_id=l.id " + "LIMIT " + limit + " OFFSET " + offset;
        boolean check = false;
        try {
            PreparedStatement ps
                    = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
                Users user = new Users();
                user.setId(rs.getInt("u.id"));
                user.setFirstname(rs.getString("u.firstname"));
                user.setLastname(rs.getString("u.lastname"));
                user.setUsername(rs.getString("u.username"));
                user.setPassword(rs.getString("u.password"));

                user.setEmail(rs.getString("u.email"));
                user.setActive(rs.getString("u.active"));
                user.setRole(rs.getString("u.role"));
                System.out.println(user.getRole());
                if (rs.getString("l.id") != null) {
                    Locations location = new Locations();
                    location.setId(rs.getInt("l.id"));
                    location.setTitle(rs.getString("l.title"));
                    location.setAddress(rs.getString("l.address"));
                    location.setCity(rs.getString("l.city"));
                    user.setLocation(location);
                }
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            return users;
        } else {
            return null;
        }

    }

    public int getUserCount() {

        String query
                = "SELECT COUNT(*) AS num FROM users";
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

    public int updateActivationOfsUserById(int id) {

        String query = "UPDATE users SET active = True WHERE id = ?";
        boolean check = false;
        int n = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            n = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public String getEmailByUserId(int id) {
        {

            String query
                    = "SELECT email FROM users WHERE id = ?";
            boolean check = false;
            String email = "";
            try {
                PreparedStatement ps
                        = con.prepareStatement(query);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    check = true;

                    email = rs.getString("email");

                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (check == true) {
                return email;
            } else {
                return null;
            }

        }

    }

    public String getPasswordByUserId(int id) {
        {

            String query
                    = "SELECT password FROM users WHERE id = ?";
            boolean check = false;
            String password = "";
            try {
                PreparedStatement ps
                        = con.prepareStatement(query);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    check = true;

                    password = rs.getString("password");

                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (check == true) {
                return password;
            } else {
                return null;
            }

        }

    }

    public int updateNewPassword(String password, int id) {

        String query = "UPDATE users SET password = ? WHERE id = ?";
        
        int n = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, password);
            ps.setInt(2, id);
            n = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

}
