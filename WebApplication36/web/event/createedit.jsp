<%-- 
    Document   : createedit
    Created on : Sep 13, 2020, 7:38:51 AM
    Author     : Jelena Jovanovic
--%>

<%@page import="util.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Tickets"%>
<%@page import="models.Events"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Events event = (Events) request.getAttribute("event");
    ArrayList<Tickets> tickets = (ArrayList<Tickets>) request.getAttribute("tickets");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
        <link rel="stylesheet" type="text/css" href="css/general.css">
        <title>Create/Edit</title>
        <script>
            $(function () {

                
                let num = <%=(session.getAttribute("user_location_id") != null) ? session.getAttribute("user_location_id") : ""%>;
                let filledElem = document.getElementsByClassName("filled");
                let filled = true;
                let inputs = document.getElementsByTagName('input');
               let spans = document.getElementsByClassName("hasToBeFilled");
                for (let i = 0; i < filledElem.length; i++) {

                    filled = filled && (filledElem[i].value != "");
                }

                if (document.getElementById("eventpostTitle").value != "" && document.getElementById("eventpostDate").value != "" && document.getElementById("eventpostDescription").value != "" && filled) {
                    document.getElementById("eventpostButtonSubbmit").disabled = false;
                } else {
                    document.getElementById("eventpostButtonSubbmit").disabled = true;
                }
                function hasToBeFilled() {
                    filledElem = document.getElementsByClassName("filled");
                    
                    filled = true;
                    for (let i = 0; i < filledElem.length; i++) {
                        filled = filled && (filledElem[i].value != "");
                    }

                    if (document.getElementById("eventpostTitle").value != "" && document.getElementById("eventpostDate").value != "" && document.getElementById("eventpostDescription").value != "" && filled) {
                        document.getElementById("eventpostButtonSubbmit").disabled = false;
                       
                        spans[0].innerHTML = "";
                    } else {

                        
                    
                        spans[0].innerHTML = "All fields, accept image and video fields, has to be filled";
                        document.getElementById("eventpostButtonSubbmit").disabled = true;
                    }

                }
                for (let index = 0; index < inputs.length; ++index) {
                    inputs[index].onchange = function () {
                        
                        hasToBeFilled();
                        
                    }
                }
                document.getElementById("eventpostButton").onclick = function () {
                    let id = document.querySelectorAll('div[id^="ticket"]').length;
                    document.getElementById("ticketsForm").innerHTML += ('<div id ="ticket' + id + '" class = "border rounded" ><input type="hidden" name="eventpostticket_id" value="0"><input type="hidden" name="eventpostevent_id" value="' + num + '">' +
                            '<div class="form-group row"><label  class="control-label col-sm-2">Category</label><div class="col-sm-10"><input type="text" class="form-control filled"  name="eventpostcategory" placeholder="Category" value=""> </div></div>' +
                            '<div class="form-group row"><label  class="control-label col-sm-2">Price</label><div class="col-sm-10"><input type="text" class="form-control filled" name="eventpostprice" placeholder="Price" value=""></div></div>' +
                            '<div class="form-group row"><label  class="control-label col-sm-2">Number of Tickets</label><div class="col-sm-10"><input type="text" class="form-control filled"  name="eventpostnumberoftickets" placeholder="Number of tickets" value=""></div></div><input type="hidden" name="eventpostnumberofrezervedtickets" value="0">' +
                            '<div class="form-group row"><label  class="control-label col-sm-2">Max Tickets per Person</label><div class="col-sm-10"><input type="text" class="form-control  filled"  name="eventpostmaxrezervedticketsperperson" placeholder="Max tickets per person" value=""></div></div></div>');
                    
                    inputs = document.getElementsByTagName('input');
                    
                    hasToBeFilled();

                    for (let index = 0; index < inputs.length; ++index) {
                        inputs[index].onchange = function () {

                            hasToBeFilled();
                            
                        }
                    }
                }
                
                
                document.getElementById("eventpostButtonRemove").onclick = function () {
                    let divticket = document.querySelectorAll('div[id^="ticket"]');
                    let ticketid = "ticket1";
                    if(divticket.length > 0){
                       ticketid = divticket[divticket.length-1].id; 
                    }
                    document.getElementById(ticketid).remove();
                    inputs = document.getElementsByTagName('input');
                    
                    hasToBeFilled();

                    for (let index = 0; index < inputs.length; ++index) {
                        inputs[index].onchange = function () {

                            hasToBeFilled();
                            
                        }
                    }
                }

            });
        </script>
    </head>
    <body>
        <div class="container-lg abs">
            <%@include file="../fragments/header.jsp"  %>
            <div class="row">
                <div class="col-sm-3 p-2 m-2">
                    <%@include file="../fragments/menu.jsp"  %>
                </div>
                <div class="col-sm p-2 m-2">

                    <div class="login-form">

                        <div>
                            <h2><%= request.getAttribute("title")%></h2>
                            <span class="text-success"><%= (request.getParameter("posteventMsg")!=null)?request.getParameter("posteventMsg"):""%>
                        </div>
                        <form action="eventPost" method="post">
                            <input type="hidden" id="eventpostIdLabel" name="eventpostid" value=<%=(event != null) ? String.valueOf(event.getId()) : "0"%>>
                            <input type="hidden" id="eventpostLocationidLabel" name="eventpostlocationid" value=<%=(session.getAttribute("user_location_id") != null) ? session.getAttribute("user_location_id") : ""%>>
                            <div class="form-group row">

                                <label id="eventpostTitleLabel" class="control-label col-sm-2">Event Name</label>
                                <div class="col-sm-10 ">
                                    <input type="text" class="form-control" id="eventpostTitle" name="eventposttitle" placeholder="Event Name" value=<%=(event != null) ? event.getTitle() : ""%>>

                                </div>
                                
                            </div>

                            <div class="form-group row">
                                <label id="eventpostDateLabel" class="control-label col-sm-2">Event Date</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" class="form-control" id="eventpostDate" name="eventpostdate" placeholder="Event Date" value=<%=(event != null) ? DateFormat.formatString(event.getDate_time()) : ""%>>
                                </div>
                                
                            </div>


                            <div class="form-group row">
                                <label id="eventpostDescriptionLabel" class="control-label col-sm-2">Event Date</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="eventpostDescription" name="eventpostdescription" placeholder="Event Description" value=<%=(event != null) ? event.getDescription() : ""%>>
                                </div>
                                
                            </div>


                            <div class="form-group row">
                                <label id="eventpostPictureLabel" class="control-label col-sm-2">Event URL of Picture</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="eventpostPicture" name="eventpostpicture" placeholder="Picture'ss URL" value=<%=(event != null) ? event.getBase64Image() : ""%>>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label id="eventpostVideoLabel" class="control-label col-sm-2">Event URL of Video</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="eventpostvideo" name="eventpostvideo" placeholder="Video's URL" value=<%=(event != null) ? event.getBase64Video() : ""%>>
                                </div>
                            </div>

                            <div id="ticketsForm" class = "border rounded">
                                <% if (tickets != null) {
                                        int ind = 1;
                                        for (Tickets ticket : tickets) {
                                %>
                                <div id ="ticket<%=ind%>" class = "border rounded" >
                                    <input type="hidden" name="eventpostticket_id" value=<%=String.valueOf(ticket.getId())%>>
                                    <input type="hidden" name="eventpostevent_id" value=<%=String.valueOf(ticket.getEvent_id())%>>
                                    <div class="form-group row">

                                        <label  class="control-label col-sm-2">Category</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control filled"  name="eventpostcategory" placeholder="Category" value=<%=ticket.getCategory()%>>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label  class="control-label col-sm-2">Price</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control filled" name="eventpostprice" placeholder="Price" value=<%=String.valueOf(ticket.getPrice())%>>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label  class="control-label col-sm-2">Number of Tickets</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control filled"  name="eventpostnumberoftickets" placeholder="Number of tickets" value=<%=String.valueOf(ticket.getNumber_of_tickets())%>>
                                        </div>
                                    </div>
                                    <input type="hidden" name="eventpostnumberofrezervedtickets" value=<%=String.valueOf(ticket.getNumber_of_rezerved_tickets())%>>



                                    <div class="form-group row">
                                        <label  class="control-label col-sm-2">Max Tickets per Person</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control filled"  name="eventpostmaxrezervedticketsperperson" placeholder="Max tickets per person" value=<%=String.valueOf(ticket.getMax_rezerved_tickets_per_person())%>>
                                        </div>
                                    </div>
                                </div>
                                <% ind += 1;
                                    }
                                } else {%>
                                <div id ="ticket1" class = "border rounded" >
                                    <input type="hidden" name="eventpostticket_id" value="0">
                                    <input type="hidden" name="eventpostevent_id" value="">
                                    <div class="form-group row">

                                        <label  class="control-label col-sm-2">Category</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control filled"  name="eventpostcategory" placeholder="Category" value="">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label  class="control-label col-sm-2">Price</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control filled" name="eventpostprice" placeholder="Price" value="">
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label  class="control-label col-sm-2">Number of Tickets</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control filled"  name="eventpostnumberoftickets" placeholder="Number of tickets" value="" >
                                        </div>
                                    </div>
                                    <input type="hidden" name="eventpostnumberofrezervedtickets" value="0">



                                    <div class="form-group row">
                                        <label  class="control-label col-sm-2">Max Tickets per Person</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control filled"  name="eventpostmaxrezervedticketsperperson" placeholder="Max tickets per person" value="">
                                        </div>
                                    </div>
                                </div>

                                <%}%>
                            </div>
                            <span class="hasToBeFilled text-danger"></span>
                            <button  type="submit" class="btn btn-warning btn-block text-center" id="eventpostButtonSubbmit" >Submit</button>

                            <button  type="button" class="btn btn-warning btn-block text-center" id="eventpostButton" >Add tickets</button>
                            <button  type="button" class="btn btn-warning btn-block text-center" id="eventpostButtonRemove" >Remove tickets</button>
                        </form>
                    </div>

                </div>


            </div>
            <p id="provera">Molim te</p>
            <div class="navbar-fixed-bottom">
                <%@include file="../fragments/footer.jsp"  %>
            </div>
        </div>
    </body>
</html>
