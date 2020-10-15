/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.Date;

/**
 *
 * @author Jelena Jovanovic
 */
public class Events {

    private int id;
    private String title;
    private Date date_time;
    private String description;
    //private Byte[] picture;
    private String base64Image;
    private String base64Video;
    private Locations location;

    public Events() {
    }

    public String getBase64Video() {
        return base64Video;
    }

    public void setBase64Video(String base64Video) {
        this.base64Video = base64Video;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

//    public Byte[] getPicture() {
//        return picture;
//    }
//
//    public void setPicture(Byte[] picture) {
//        this.picture = picture;
//    }

//    public Byte[] getVideo() {
//        return video;
//    }
//
//    public void setVideo(Byte[] video) {
//        this.video = video;
//    }

    public Locations getLocation() {
        return location;
    }

    public void setLocation(Locations location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "Id,title,date/time,location " + id + "," + title + "," + date_time + "," + location.getTitle(); //To change body of generated methods, choose Tools | Templates.
    }

}
