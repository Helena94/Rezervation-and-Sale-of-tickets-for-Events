/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Jelena Jovanovic
 */
public class Users {

    private int id;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String email;
    private Active active;
    private Role role;

    private Locations location;
    public Users(){}
    public Users( String firstname, String lastname, String username, String password, String email, String active, String role) {
        
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.password = password;
        
        this.email = email;
        setActive(active);
        setRole(role);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getActive() {
        return active.name();
    }

    public void setActive(String active) {
        this.active = Active.valueOf(active);
    }

    public String getRole() {
        return role.name();
    }

    public void setRole(String role) {
        this.role = Role.valueOf(role);
    }

    public Locations getLocation() {
        return location;
    }

    public void setLocation(Locations location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return username + ", " + password + ", " + role + ", " + location;
    }
}
