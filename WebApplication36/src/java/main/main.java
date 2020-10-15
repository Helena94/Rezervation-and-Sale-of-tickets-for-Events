/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import database.DaoImpl;
import database.RezerveDaoImpl;
import database.TicketsDaoImpl;
import database.UserDaoImpl;
import datatransferobject.RezervationPage;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Events;
import models.Locations;
import models.Rezervations;
import models.Tickets;
import models.Users;
import util.DateFormat;
import util.JavaMail;

/**
 *
 * @author Jelena Jovanovic
 */
public class main {

    public static void main(String[] args) throws SQLException {
//        DaoImpl daoimpl = new DaoImpl();
//
//        String stringDate1 = "2020-09-16T21:02";
//        Date date1 = DateFormat.formatDate(stringDate1);
//        System.out.println(date1);
//        String stringDate2 = "2020-09-18T22:35";
//        Date date2 = DateFormat.formatDate(stringDate2);
//        System.out.println(date2);
//        long diff = date2.getTime() - date1.getTime();
//        long diffHours = diff / (60 * 60 * 1000);
//        System.out.println(diffHours);
////    Date date1 =DateFormat.formatDate("2020-10-01 20:30:00");
////    Date date2 = DateFormat.formatDate("2020-10-08 20:30:00");
////        
////    System.out.println(date1);
////    Date date = null;
////    Date formatteddate = null;
////    DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
////    try{
////        date = df.parse(dateString);
////        formatteddate = df.format(date);
////    }
////    catch ( Exception ex ){
////        System.out.println(ex);
////    }
////    List<Events> events = daoimpl.getEventsWithLocationByDate(0, 3,date1,date2);
////    if(events != null){
////    for (Events event:events) { 
////                   System.out.println(event);
////                   
////                 }}
//        UserDaoImpl userdaoimpl = new UserDaoImpl();
//        Users user = userdaoimpl.getUserWithLocation("usernametest5", "passwordtest6");
//        System.out.println(user != null);
////    int num = daoimpl.getEventsWithLocationByDateCount(date1,date2) ;
////    System.out.println(num);
//        System.out.println(userdaoimpl.existUserByUsername("usernametest5"));
//        System.out.println(userdaoimpl.existUserByUsername("usernametst5"));
//        System.out.println(userdaoimpl.existUserByPassword("passwordtest5"));
//        System.out.println(userdaoimpl.existUserByPassword("passwordest5"));
////    Users user1= new Users("firstnametest9","lastnametest9","usernametest9","passwordtest9","emailtest9@gmail.com","False","treasurer");
////    user1.setLocation(new Locations());
////    user1.getLocation().setId(5);
////   // System.out.println(userdaoimpl.insertUser(user1, "admin"));
////JavaMail.setFrom("ajde");
////JavaMail.setTo("ajde");
////JavaMail.sendMail();
//        System.out.println(userdaoimpl.getUserEmailById(4));
////    
////    System.out.println(daoimpl.getEventWithLocationById(1).getBase64Image());
////    System.out.println(daoimpl.getEventWithLocationById(1).getBase64Video());
//        String text1 = "https://www.youtube.com/watch?v=H2cr1cBgQbI";
//        String text2 = "https://youtu.be/H2cr1cBgQbI";
//        System.out.println(text1.replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/"));
//        System.out.println(text1.replace("https://youtu.be/", "https://www.youtube.com/embed/"));
//        System.out.println(text1.contains("https://youtu.be/"));
//        ///////
////    Events event =  new Events();
////    event.setTitle("Ajde event");
////    event.setDate_time(new Date());
////    event.setLocation(new Locations());
////    event.getLocation().setId(6);
////    event.setDescription("Ajtext2de event description");
////    event.setBase64Video("https://www.youtube.com/watch?v=FFfGeFrfAbw");
////    int id = daoimpl.insertEvent(event);
////    System.out.println(id);
//        TicketsDaoImpl tdi = new TicketsDaoImpl();
////    System.out.println(tdi.getTicketsByEvent_id(1));
////    Tickets ticket = new Tickets();
////    ticket.setId(1);
////    ticket.setEvent_id(1);
////    ticket.setCategory("AJde2");
////    ticket.setPrice(800);
////    ticket.setNumber_of_tickets(700);
////    ticket.setNumber_of_rezerved_tickets(350);
////    ticket.setMax_rezerved_tickets_per_person(10);
////    //tdi.updateTicket(ticket);
////    ticket.setEvent_id(id);
////    
////    tdi.insertTicket(ticket);
////    
//        System.out.println(userdaoimpl.getUserCount());
//        ArrayList<Users> users = userdaoimpl.getUserWithLocation(0, 10);
//        for (Users user2 : users) {
//            System.out.println(user2);
//        }
//        System.out.println(userdaoimpl.getPasswordByUserId(2));
//        System.out.println(tdi.getTicketsByAndConditionEvent_id(1));
        RezerveDaoImpl rdi = new RezerveDaoImpl();
         ArrayList<Date> dates = rdi.getRezervationsByEventIdAndUserId(1,2);
         System.out.println(DateFormat.ifOneMore48Hours(dates));

    }

}
