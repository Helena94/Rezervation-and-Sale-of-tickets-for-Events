/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Jelena Jovanovic
 */
public class DateFormat {

    public static Date formatDate(String dateString) {
        Date date = null;
        try {
            System.out.println(dateString);
            dateString = dateString.replace("T", " ");
//            dateString = dateString.replace("%3A", ":");
            dateString += ":00";
            System.out.println(dateString);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
             date = sdf.parse(dateString);  
          } catch (ParseException ex) {
            Logger.getLogger(DateFormat.class.getName()).log(Level.SEVERE, null, ex);
        }
        return date;
    }
    public static String formatString(Date date){
        
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String dateString = sdf.format(date);
            dateString = dateString.replace(" ", "T");
            
          return dateString;
    }
    public static long timeDiffInHours(Date date1, Date date2){
        long diff = Math.abs(date2.getTime() - date1.getTime());
        long diffHours = diff / (60 * 60 * 1000);
        return diffHours;
        
    }
    public static boolean ifOneMore48Hours(ArrayList<Date> dates){
        Date dateNow = new Date();
        if(dates==null){
        return false;
        }
        for(Date date:dates){
           if(timeDiffInHours(date,dateNow)>48){
               return true;
           }
        }
        return false;
    }
}
