<%-- 
    Document   : eventdetail
    Created on : Sep 12, 2020, 2:33:16 PM
    Author     : Jelena Jovanovic
--%>

<%@page import="java.util.Date"%>
<%@page import="models.Tickets"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Events"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Events event = (Events) request.getAttribute("event");
    ArrayList<Tickets> tickets =(ArrayList<Tickets>) request.getAttribute("tickets");
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
        <title>Events</title>
        <link rel="stylesheet" type="text/css" href="css/general.css">
    </head>
    <body>
        <div class="container-lg abs">
            <%@include file="../fragments/header.jsp"  %>
            <div class="row">
                <div class="col-sm-3 p-2 m-2">
                    <%@include file="../fragments/menu.jsp"  %>
                </div>
                <div class="col-sm p-2 m-2">
                    <span class="text-success"><%= (request.getParameter("posteventMsg")!=null)?request.getParameter("posteventMsg"):""%>
                    
                    </span>
                    <% if(event.getBase64Image()!= null){%>
                    <div class="row"><div class="col-sm d-flex justify-content-center">
                            <img src="<%=event.getBase64Image()%>" alt="<%=event.getTitle()%>"width="500" height="300">
                        </div></div> <%}%>
                        <% if(event.getBase64Video()!= null){%>
                    <div class="row"><div class="col-sm d-flex justify-content-center">

                            <iframe width="500" height="300"
                                    src="<%=event.getBase64Video()%>">
                            </iframe>
                        </div></div><%}%>
                    <div class="row"><div class="col-sm">
                            <table class="table table-bordered">
                                <tr>
                                    <td>Event Name</td>
                                    <td><%=event.getTitle()%></td>
                                </tr>
                                <tr>
                                    <td>Event Date and Time</td>
                                    <td><%=event.getDate_time()%></td>
                                </tr>
                                <tr>
                                    <td>Event Description</td>
                                    <td><%=event.getDescription()%></td>
                                </tr>
                                <tr>
                                    <td>Event Location</td>
                                    <td><%=event.getLocation()%></td>
                                </tr>
                                <tr>
                                    <td>Tickets</td>
                                    
                                            <td><%if(tickets!= null){%>
                                                <table class='table table-bordered'>
                                                    
                                                    <%
                                                        
                                                        for(Tickets ticket:tickets){%>
                                                    <tr>
                                                        <td>Category: <%=ticket.getCategory()%></td>
                                                        <td>Price: <%=ticket.getPrice()%></td>
                                                        
                                                        <td>Tickets left: <%=(ticket.getNumber_of_tickets()-ticket.getNumber_of_rezerved_tickets())%></td>
                                                    </tr>
                                                    <%}%>
                                        </table><%}else{%>No tickets<%}%></td>
                                </tr>
                            </table>
                        </div></div>
                                <div class="row"><div class="col-sm"></div>
                                    <div class="col-sm"></div>
                                    <div class="col-sm-6">
                                        <% Date current = new Date();
                                            if(event!= null && current.before(event.getDate_time())){%>
                                    <% if (session.getAttribute("user_location_id") != null && session.getAttribute("user_location_id").equals(String.valueOf(event.getLocation().getId()))) {%>
                                    
                                        <a href="editEvent?event_id=<%=String.valueOf(event.getId())%>" class="btn btn-warning float-left" role="button" aria-pressed="true">Edit</a></td>
                                        <a href="saleTickets?event_id=<%=String.valueOf(event.getId())%>" class="btn btn-warning float-left" role="button" aria-pressed="true">Sale tickets</a>
                                    <%}}%>
                                    <%if (session.getAttribute("user_id") != null) {%>
                                        <% 
                                            if(current.before(event.getDate_time())){%>
                                        <td><a href="rezerve?event_id=<%=String.valueOf(event.getId())%>" class="btn btn-warning" role="button" aria-pressed="true">Rezerve</a></td>
                                        <%}}%>
                                    </div>
                                        
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
