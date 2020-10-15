/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException;
/**
 *
 * @author Jelena Jovanovic
 */
public class DatabaseConnection {
    private static Connection con = null; 
  
    static
    { 
        String url = "jdbc:mysql://127.0.0.1/rezervationandsaleoftickets"; 
        String user = "root"; 
        String pass = "password"; 
        try { 
            Class.forName("com.mysql.jdbc.Driver"); 
            con = DriverManager.getConnection(url, user, pass); 
        } 
        catch (ClassNotFoundException | SQLException e) { 
            e.printStackTrace(); 
        } 
    } 
    public static Connection getConnection() 
    { 
        return con; 
    } 
}
