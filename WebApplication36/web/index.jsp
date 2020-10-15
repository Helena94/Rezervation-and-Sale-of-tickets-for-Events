<%-- 
    Document   : index
    Created on : Sep 10, 2020, 7:23:06 PM
    Author     : Jelena Jovanovic
--%>


<%@page import="database.RezerveDaoImpl"%>
<%@page import="util.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Events"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%
    ArrayList<Events> evs = (ArrayList<Events>) request.getAttribute("events");
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

        <title>Events</title>
        <link rel="stylesheet" type="text/css" href="css/general.css">
        <script>
            $(function () {
                let tr = document.getElementsByTagName("tr");
                let currentDate = new Date();
                for(let i = 1; i < tr.length; i++){
                    let dateOfEvent = new Date(tr[i].cells[1].innerHTML);
                    if(dateOfEvent.getTime() <= currentDate.getTime()){
                        tr[i].style.opacity = "0.5";
                    }
                }
                console.log(new Date(tr[1].cells[1].innerHTML))
                document.getElementById("searchInput3").disabled = true;
                document.getElementById("searchInput3").style.setProperty("display", "none");
                document.getElementById("searchSelect").onchange = function () {
                    if (document.getElementById("searchSelect").value === "date") {
                        document.getElementById("searchLabel1").innerHTML = "From";
                        document.getElementById("searchInput1").type = "datetime-local";
                        document.getElementById("searchLabel2").innerHTML = "To";
                        document.getElementById("searchInput3").disabled = false;
                        document.getElementById("searchInput3").style.setProperty("display", "inline-block");
                    } else {
                        document.getElementById("searchLabel1").innerHTML = "";
                        document.getElementById("searchInput1").type = "text";
                        document.getElementById("searchLabel2").innerHTML = "";
                        document.getElementById("searchInput3").disabled = true;
                        document.getElementById("searchInput3").style.setProperty("display", "none");
                    }

                }
            });
        </script>
    </head>
    <body>
        <div class="container-lg abs">
            <%@include file="fragments/header.jsp"  %>
            <div class="row">
                <div class="col-sm-3 p-2 m-2">
                    <%@include file="fragments/menu.jsp"  %>
                </div>
                <div class="col-sm p-2 m-2">
                    <div class="row">
                        <form action="home" method="get">
                            <div class="col-sm-auto inline">
                                <label class="control-label text-right" 
                                       >Search by:</label>
                            </div>
                            <div class="col-sm-auto inline">
                                <select id="searchSelect" class="form-control" name="searchTypes">
                                    <option selected>title</option>
                                    <option>date</option>
                                    <option>location</option>

                                </select>

                            </div>
                            <div class="col-sm-auto inline">
                                <label id="searchLabel1" class="control-label text-right" 
                                       ></label>
                            </div>
                            <div id="searchAdd" class="col-sm-auto inline">

                                <input id="searchInput1" class="form-control" type="text" name="searchInput1" >
                                <input id="searchInput2" class="form-control" type="hidden" name="index"  value="0">
                                <input id="searchInput4" class="form-control" type="hidden" name="numPage"  value="1">
                            </div>
                            <div class="col-sm-auto inline">
                                <label id="searchLabel2" class="control-label text-right" 
                                       ></label>
                            </div>
                            <div id="searchAdd2" class="col-sm-auto inline">
                                <input id="searchInput3" class="form-control" type="datetime-local" name="searchInput3">
                            </div>
                            <div class="col-sm-auto inline">

                                <button id="searchButton" type="submit" class="btn btn-warning btn-block text-center">Search</button>
                            </div>
                        </form>
                    </div>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-sm">
                            <span class="text-success"><%=(session.getAttribute("successMsg")) != null ? session.getAttribute("successMsg") : ""%>
                                <%
                                    session.removeAttribute("successMsg");

                                %>
                                <%=(session.getAttribute("logoutMsg")) != null ? session.getAttribute("logoutMsg") : ""%>
                                <%
                                    session.removeAttribute("logoutMsg");

                                %>
                                <%=(session.getAttribute("signupMessage")) != null ? session.getAttribute("signupMessage") : ""%>
                                <%
                                    session.removeAttribute("signupMessage");

                                %>
                                <%=(session.getAttribute("changePassword")) != null ? session.getAttribute("changePassword") : ""%>
                                <%
                                    session.removeAttribute("changePassword");

                                %>
                            </span>
                            <% if (evs != null) { %>
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Event</th>
                                        <th scope="col">Time</th>
                                        <th scope="col">Location</th>
                                       
                                            <%if (session.getAttribute("user_id") != null) {%>
                                        <th scope="col">Details</th><%}%>
                                            <% if (session.getAttribute("user_location_id") != null) {%>

                                        <th scope="col">Edit Event</th>
                                        <th scope="col">Sell tickets</th><%}%>
                                        <%if (session.getAttribute("user_id") != null && session.getAttribute("user_role").equals("regular")) {%>
                                        <th scope="col">Rezerve</th><%}%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Events ev : evs) {%>
                                    <tr>
                                        <td><%=ev.getTitle()%></td>
                                        <td><%=ev.getDate_time()%></td>
                                        <td><%=ev.getLocation().getTitle()%></td>
                                        <%if (session.getAttribute("user_id") != null) {%>
                                        <td><a href="details?event_id=<%=String.valueOf(ev.getId())%>" class="btn btn-warning" role="button" aria-pressed="true">See Details</a></td>
                                        <%}%>
                                        
                                        <% if (session.getAttribute("user_location_id") != null) {%>
                                        <% Date current = new Date();
                                            if (current.before(ev.getDate_time()) && session.getAttribute("user_location_id").equals(String.valueOf(ev.getLocation().getId()))) {%>
                                        
                                        <td><a href="editEvent?event_id=<%=String.valueOf(ev.getId())%>" class="btn btn-warning" role="button" aria-pressed="true">Edit</a></td>
                                        <td><a href="saleTickets?event_id=<%=String.valueOf(ev.getId())%>" class="btn btn-warning" role="button" aria-pressed="true">Sale tickets</a></td>
                                        <%} else {%>
                                        <td>Cannot edit</td>
                                        <td>Cannot sale</td>
                                        <%}%>
                                        <%}%>
                                        <%if (session.getAttribute("user_id") != null && session.getAttribute("user_role").equals("regular")) {%>
                                        <% Date current = new Date();
                                        int countRezervationPass48 = rdi.getRezervationsPass48HoursByUserIdCount(Integer.parseInt((String)session.getAttribute("user_id") ));
                                          ArrayList<Date> dates = rdi.getRezervationsByEventIdAndUserId(ev.getId(), Integer.parseInt((String)session.getAttribute("user_id") ));
    if(countRezervationPass48<3 && current.before(ev.getDate_time()) && DateFormat.timeDiffInHours(current, ev.getDate_time())>48 && !DateFormat.ifOneMore48Hours(dates) ){%>
                                        <td><a href="rezerve?event_id=<%=String.valueOf(ev.getId())%>" class="btn btn-warning" role="button" aria-pressed="true">Rezerve</a></td>
                                        <%}else{%>
                                        <td>Cannot rezerve</td>
                                        
                                        <%}}%>
                                        
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>

                            <%} else {%>
                            <span>No events</span>
                            <%}%> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 p-2 m-2">

                </div>
                <div class="col-sm p-2 m-2">
                    <%= num%>
                    <%= request.getParameter("searchTypes")%>
                    <% String types = (String) request.getAttribute("types");%>
                    <% if (types == null || types.equals("all")) {%>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%=request.getAttribute("pageNum")%>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <% int j = 1;
                                for (int i = 0; i < num; i += limit) {
                            %>
                            <a class="dropdown-item" href="home?index=<%=i%>&types=all&pageNum=<%=j%>"><%=j%></a>

                            <%   j++;
                                }%>
                        </div>

                    </div>
                    <%} else {
                        if (types.equals("title")) {%>
                    <% String title = (String) request.getAttribute("title");%>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%=request.getAttribute("pageNum")%>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <% int j = 1;
                                for (int i = 0; i < num; i += limit) {
                            %>
                            <a class="dropdown-item" href="home?index=<%=i%>&types=title&title=<%=title%>&pageNum=<%=j%>"><%=j%></a>

                            <%   j++;
                                }%>
                        </div>

                    </div>
                    <%} else {
                        if (types.equals("location")) {%>
                    <% String location = (String) request.getAttribute("location");%>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%=request.getAttribute("pageNum")%>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <% int j = 1;
                                for (int i = 0; i < num; i += limit) {
                            %>
                            <a class="dropdown-item" href="home?index=<%=i%>&types=location&location=<%=location%>&pageNum=<%=j%>"><%=j%></a>

                            <%   j++;
                                }%>
                        </div>

                    </div>
                    <%} else {
                        String date1 = (String) request.getAttribute("date1");
                        String date2 = (String) request.getAttribute("date2");
                    %>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%=request.getAttribute("pageNum")%>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <% int j = 1;
                                for (int i = 0; i < num; i += limit) {
                            %>
                            <a class="dropdown-item" href="home?index=<%=i%>&types=date&date1=<%=date1%>&date2=<%=date2%>&pageNum=<%=j%>"><%=j%></a>

                            <%   j++;
                                }%>
                        </div>

                    </div>
                    <%}
                            }

                        }%>

                </div>
            </div>
            <div class="row navbar-fixed-bottom">
                <div class ="col-sm">
                    <%@include file="fragments/footer.jsp"  %></div>
            </div>
        </div>
    </body>
</html>
