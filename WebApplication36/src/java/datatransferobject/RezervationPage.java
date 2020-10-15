/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datatransferobject;

import java.util.Date;
import models.Active;

/**
 *
 * @author Jelena Jovanovic
 */
public class RezervationPage {
    private int id;
    private int ticket_id;
    private String category;
    private int number_of_tickets;
    private Date rezervation_date;
    private Active tickets_purchached;
    private double price;
    private String username;
    private String email;
    private int event_id;
    private String title;
    private Date event_date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getNumber_of_tickets() {
        return number_of_tickets;
    }

    public void setNumber_of_tickets(int number_of_tickets) {
        this.number_of_tickets = number_of_tickets;
    }

    public Date getRezervation_date() {
        return rezervation_date;
    }

    public void setRezervation_date(Date rezervation_date) {
        this.rezervation_date = rezervation_date;
    }

    public String getTickets_purchached() {
        return tickets_purchached.name();
    }

    public void setTickets_purchached(String tickets_purchached) {
        this.tickets_purchached = Active.valueOf(tickets_purchached);
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitle() {
        return title;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getEvent_date() {
        return event_date;
    }

    public void setEvent_date(Date event_date) {
        this.event_date = event_date;
    }

    @Override
    public String toString() {
        return "RezervationPage{" + "id=" + id + ", category=" + category + ", number_of_tickets=" + number_of_tickets + ", rezervation_date=" + rezervation_date + ", tickets_purchached=" + tickets_purchached + ", price=" + price + ", username=" + username + ", email=" + email + ", title=" + title + ", event_date=" + event_date + '}';
    }
   
}
