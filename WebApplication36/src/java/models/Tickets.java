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
public class Tickets {
    private int id;
    private int event_id;
    private String category;
    private double price;
    private int number_of_tickets;
    private int number_of_rezerved_tickets;
    private int max_rezerved_tickets_per_person;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getNumber_of_tickets() {
        return number_of_tickets;
    }

    public void setNumber_of_tickets(int number_of_tickets) {
        this.number_of_tickets = number_of_tickets;
    }

    public int getNumber_of_rezerved_tickets() {
        return number_of_rezerved_tickets;
    }

    public void setNumber_of_rezerved_tickets(int number_of_rezerved_tickets) {
        this.number_of_rezerved_tickets = number_of_rezerved_tickets;
    }

    public int getMax_rezerved_tickets_per_person() {
        return max_rezerved_tickets_per_person;
    }

    public void setMax_rezerved_tickets_per_person(int max_rezerved_tickets_per_person) {
        this.max_rezerved_tickets_per_person = max_rezerved_tickets_per_person;
    }

    @Override
    public String toString() {
        return "Tickets{" + "id=" + id + ", event_id=" + event_id + ", category=" + category + ", price=" + price + ", number_of_tickets=" + number_of_tickets + ", number_of_rezerved_tickets=" + number_of_rezerved_tickets + ", max_rezerved_tickets_per_person=" + max_rezerved_tickets_per_person + '}';
    }
    
    
    
}
