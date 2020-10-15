<%-- 
    Document   : login
    Created on : Sep 9, 2020, 2:52:50 PM
    Author     : Jelena Jovanovic
--%>

<%@page import="models.Tickets"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<% ArrayList<Tickets> tickets = (ArrayList<Tickets>) request.getAttribute("tickets");%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <!-- JS, Popper.js, and jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script><title>Events</title>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>

        <script>
            $(function () {
               let rezerveNumber = document.getElementById("rezerveNumberOfTickets");
               let rezerveButton = document.getElementById("rezerveButton");
               rezerveNumber.onchange = function(){
                   if(rezerveNumber.value != ""){
                       rezerveButton.disabled=false;
                   }else{
                       rezerveButton.disabled=true;
                   
                    }
                    document.getElementById("rezerveTotalPrice").innerHTML = "Price is" + document.getElementById("rezervePrice").value * rezerveNumber.value;
                            
                    
                   
               }
            });
        </script>

        <title>Tickets sale</title>
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
                    <% if (tickets != null) {%>
                    <div class="login-form">
                        <div>
                            <h2>Rezerve tickets for event <%=request.getAttribute("title")%></h2>
                            <p>Please fill the field</p>
                            <span class="text-success">
                                <%=(session.getAttribute("successMsg")) != null ? session.getAttribute("successMsg") : ""%></span>
                                <%session.removeAttribute("successMsg");%>
                                <span class="text-danger">
                                <%=(session.getAttribute("failMsg")) != null ? session.getAttribute("failMsg") : ""%></span>
                                <%session.removeAttribute("failMsg");%>
                                <table class='table table-bordered'>
                            <%for (Tickets ticket : tickets) {%>
                            <tr>
                                <td>Category: <%=ticket.getCategory()%></td>
                                <td>Price: <%=ticket.getPrice()%></td>

                                <td>Tickets left: <%=(ticket.getNumber_of_tickets() - ticket.getNumber_of_rezerved_tickets())%></td>
                            </tr>
                            <%}%>
                        </table>
                        </div>
                        <%
                            Tickets ticket = (Tickets) request.getAttribute("ticket");
                        %>
                        <div class="dropdown">
                            <button  class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <%=(ticket != null) ? ticket.getCategory() : "Choose the category"%>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <%
                                    for (Tickets tic : tickets) {
                                %>
                                <a class="dropdown-item" href="rezerve?ticket_id=<%=tic.getId()%>&event_id=<%=tic.getEvent_id()%>"><%=tic.getCategory()%></a>
                                <%}%>

                            </div>

                        </div>
                        <%if (ticket != null) {%>
                        <form action="rezerved" method="post">

                            <input type="hidden" class="form-control" id="rezerveTicketId" name="rezerveticketid"  value=<%=(ticket != null) ? ticket.getId() : ""%>>
                            <input type="hidden" class="form-control" id="rezerveEventId" name="rezerveeventid"  value=<%=request.getParameter("event_id")%>>
                            
                                   <div class="form-group">

                                <input type="number" class="form-control" id="rezerveNumberOfTickets" name="rezervenumberoftickets" placeholder="Number of tickets" min="1" max=<%=(ticket != null) ? ticket.getMax_rezerved_tickets_per_person() : "10"%>>
                                 <input id="rezervePrice" type="hidden" value="<%=(ticket != null) ? ticket.getPrice() : 0%>">
                                <span id="rezerveTotalPrice"></span>
                               
                            </div>
                            <!--                                <div class="forgot">
                                                                <a href="reset.html">Forgot password?</a>
                                                            </div>-->
                            <button  type="submit" class="btn btn-warning btn-block text-center" id="rezerveButton" disabled>Rezerve tickets</button>
                            

                        </form>
                        <%}%>
                    </div>
                    <%} else {%>
                    No tickets
                    <%}%>
                </div>


            </div>
            <p id="provera">Molim te</p>
            <div class="navbar-fixed-bottom">
                <%@include file="../fragments/footer.jsp"  %>
            </div>
        </div>

    </body>
</html>


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
