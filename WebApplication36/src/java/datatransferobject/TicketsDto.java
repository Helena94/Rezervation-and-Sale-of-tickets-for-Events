/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datatransferobject;

/**
 *
 * @author Jelena Jovanovic
 */
public class TicketsDto {
    private int number_of_tickets;
    private int number_of_rezerved_tickets;

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
    
    
}
