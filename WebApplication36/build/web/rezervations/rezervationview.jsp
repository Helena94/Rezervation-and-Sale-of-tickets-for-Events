<%-- 
    Document   : usersview
    Created on : Sep 14, 2020, 4:43:43 PM
    Author     : Jelena Jovanovic
--%>


<%@page import="util.DateFormat"%>
<%@page import="database.RezerveDaoImpl"%>
<%@page import="java.util.Date"%>
<%@page import="datatransferobject.RezervationPage"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<RezervationPage> rezervations = (ArrayList<RezervationPage>) request.getAttribute("rezervations");
    int num = Integer.parseInt((String) request.getAttribute("num"));
    int limit = Integer.parseInt((String) request.getAttribute("limit"));
    RezerveDaoImpl rdi = new RezerveDaoImpl();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <!-- JS, Popper.js, and jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script><title>Events</title>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/general.css">    
        <title>Users View</title>
        <script>
            $(function () {
                let tr = document.getElementsByTagName("tr");
                let currentDate = new Date();
                for (let i = 1; i < tr.length; i++) {
                    let dateOfEvent = new Date(tr[i].cells[1].innerHTML);
                    if (dateOfEvent.getTime() <= currentDate.getTime()) {
                        tr[i].style.color = "red";
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
                <div class="col-sm-8 p-2 m-2">



                    <% if (rezervations != null) { %>
                    <table class="table table-responsive">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Event Name</th>
                                <th scope="col">Event Date and Time</th>
                                <th scope="col">Rezerve on email</th>   
                                <th scope="col">Number of tickets</th>
                                <th scope="col">Category</th>
                                <th scope="col">Date of rezervation</th>
                                <th scope="col">Price</th>
                                <th scope="col">Delete rezervation</th>

                                <th scope="col">Purchache tickets</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (RezervationPage rezervation : rezervations) {%>
                            <tr>
                                <td><%=rezervation.getTitle()%></td>
                                <td><%=rezervation.getEvent_date()%></td>
                                <td><%=rezervation.getEmail()%></td>
                                <td><%=rezervation.getNumber_of_tickets()%></td>
                                <td><%=rezervation.getCategory()%></td>
                                <td><%=rezervation.getRezervation_date()%></td>
                                <td><%=rezervation.getPrice()%></td>
                                <td>
                                    <% Date current = new Date();
                                      int countRezervationPass48 = rdi.getRezervationsPass48HoursByUserIdCount(Integer.parseInt((String)session.getAttribute("user_id") ));
                                          ArrayList<Date> dates = rdi.getRezervationsByEventIdAndUserId(rezervation.getEvent_id(), Integer.parseInt((String)session.getAttribute("user_id")));
                                        if ((countRezervationPass48<3 && current.before(rezervation.getEvent_date()) && DateFormat.timeDiffInHours(current, rezervation.getEvent_date())>48 && !DateFormat.ifOneMore48Hours(dates) ) || session.getAttribute("user_role").equals("treasurer")) {%>
                                    <form action="delete" method="post">
                                        <input type="hidden" id="rezervationDelete" name="rezervationdelete" value=<%=String.valueOf(rezervation.getId())%>>
                                        <input type="hidden" id="rezervationDeleteTicketid" name="rezervationdeleteticketid" value=<%=String.valueOf(rezervation.getTicket_id())%>>
                                        <input type="hidden" id="rezervationDeleteNumber" name="rezervationdeletenumber" value=<%=String.valueOf(rezervation.getNumber_of_tickets())%>>
                                        <button id="deleteButton" type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal<%=String.valueOf(rezervation.getId())%>">
                                            Delete event
                                        </button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal<%=String.valueOf(rezervation.getId())%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Delete rezervation</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Do you want to delete event?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                        <button type="submit" class="btn btn-warning">Yes</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form></td>
                                    <%} else {%>
                                Cannot delete
                                <%}%>
                                <td><%
                                    if (session.getAttribute("user_role").equals("treasurer")) {

                                        if (current.before(rezervation.getEvent_date())) {
                                            if (rezervation.getTickets_purchached().equals("False")) {%>

                                    <form action="sale" method="post">

                                        <input type="hidden" id="rezervationSaleId" name="rezervationsaleid" value=<%=String.valueOf(rezervation.getId())%>>
                                        <button id="saleButton" type="submit" class="btn btn-warning" >Sale tickets</button>
                                    </form>
                                    <%} else {%>
                                    <%=rezervation.getTickets_purchached()%>
                                    <%}
                                    } else {%>
                                    Event over
                                    <%}
                                    } else {%>
                                    <%=rezervation.getTickets_purchached()%>
                                    <%}%>
                                </td>

                            </tr>
                            <%}%>
                        </tbody>
                    </table>

                    <%} else {%>
                    <span>No rezervations
                    </span>
                    <%}%>

                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 p-2 m-2">

                </div>
                <div class="col-sm p-2 m-2">
                    <%= num%>

                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%=request.getAttribute("pageNum")%>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <% int j = 1;
                                for (int i = 0; i < num; i += limit) {
                            %>
                            <a class="dropdown-item" href="rezervations?role=<%=session.getAttribute("user_role")%>&index=<%=i%>&pageNum=<%=j%>"><%=j%></a>

                            <%   j++;
                                }
                            %>
                        </div>

                    </div>


                </div>



            </div>

            <div class="row navbar-fixed-bottom">
                <div class ="col-sm">
                    <%@include file="../fragments/footer.jsp"  %></div>
            </div>
        </div>
    </body>

</html>

