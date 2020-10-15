/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author Jelena Jovanovic
 */
public class YoutubeUrl {
    public static String changeUrl(String url){
        if(url == null){
            url = "";
        }
        if(url.contains("https://youtu.be/")){
            url = url.replace("https://youtu.be/", "https://www.youtube.com/embed/");
        } 
        if(url.contains("https://www.youtube.com/watch?v=")){
            url = url.replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/");
        }
        if(url == ""){
            url = null;
        }
        return url;
    }
}
