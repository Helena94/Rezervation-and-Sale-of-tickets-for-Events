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
public class Locations {
   private int id;
   private String title;
   private String address;
   private String city;
   
   public int getId(){
       return id; }
   public void setId(int id){
       this.id = id;
   }
   
   public String getTitle(){
    return title;
           }
   public void setTitle(String title){
   this.title=title;
   }
   public String getAddress(){
    return address;
           }
   public void setAddress(String address){
   this.address=address;
   }
   public String getCity(){
    return city;
           }
   public void setCity(String city){
   this.city=city;
   }
   
   @Override
    public String toString() {
        return title + ", " + address + ", " + city; //To change body of generated methods, choose Tools | Templates.
    }
}
