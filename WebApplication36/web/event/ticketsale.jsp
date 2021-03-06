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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(function () {
                let ticketSelect = document.getElementById("ticketSelect");
                let ticketNumber = document.getElementById("ticketNumber");
                let ticketButton = document.getElementById("ticketButton");
                let inputElem = document.querySelectorAll('input[id^="numId"]');
               
                function checkField() {
                    if (ticketNumber.value != "" && ticketSelect.value != "none") {
                        ticketButton.disabled = false;
                    } else {
                        ticketButton.disabled = true;
                    }
                }
                ticketSelect.onchange = function () {
                    checkField();
                    let numId = parseInt(ticketSelect.value);
                 for (let i = 0; i < inputElem.length; i++) {
                        let elemNumId = parseInt(inputElem[i].id.substring(5));
                        
                        if(elemNumId == numId){
                           ticketNumber.max = inputElem[i].value;
                           break;
                        }
                    }

                }

                ticketNumber.onchange = function () {
                    checkField();
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

                    <div class="login-form">
                        <div>
                            <h2>Ticket sale for event <%=request.getAttribute("title")%></h2>
                            <p>Please fill the fields</p>
                            <span class="text-success">
                                <%=(request.getAttribute("successMsg")) != null ? request.getAttribute("successMsg") : ""%></span>
                        </div>
                        <%if (tickets != null) {%>
                        <table class='table table-bordered'>
                            <%for (Tickets ticket : tickets) {%>
                            <tr>
                                <td>Category: <%=ticket.getCategory()%></td>
                                <td>Price: <%=ticket.getPrice()%></td>

                                <td>Tickets left: <%=(ticket.getNumber_of_tickets() - ticket.getNumber_of_rezerved_tickets())%></td>
                            </tr>
                            <%}%>
                        </table>

                        <form action="tickets" method="post">
                            <input type="hidden" class="form-control" id="ticketEventid" name="ticketeventid" value=<%=request.getAttribute("event_id")%>>
                            <div class="form-group">
                                <select id="ticketSelect" class="form-control" name="ticketselect">
                                    <option value="none" selected disabled> Select a option</option>
                                    <%for (Tickets ticket : tickets) {

                                    %>
                                    <option value=<%=String.valueOf(ticket.getId())%>><%=String.valueOf(ticket.getCategory())%></option>
                                    
                                    <%}%>
                                </select>
                                <%for (Tickets ticket : tickets) {

                                %>
                                
                                <input type ="hidden" id="numId<%=String.valueOf(ticket.getId())%>" value=<%=ticket.getMax_rezerved_tickets_per_person()%>>

                                <%}%>


                            </div>

                            <div class="form-group">

                                <input type="number" class="form-control" id="ticketNumber" name="ticketnumber" placeholder="Number of tickets" min="1" max="11">

                            </div>
                            <!--                                <div class="forgot">
                                                                <a href="reset.html">Forgot password?</a>
                                                            </div>-->
                            <button  type="submit" class="btn btn-warning btn-block text-center" id="ticketButton" disabled>Sale tickets</button>
                            <span class="text-danger">
                                <%=(request.getAttribute("failMsg")) != null ? request.getAttribute("failMsg") : ""%></span>

                        </form>

                        <%} else {%>No tickets<%}%>
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  