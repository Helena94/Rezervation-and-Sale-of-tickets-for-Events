<%-- 
    Document   : usersview
    Created on : Sep 14, 2020, 4:43:43 PM
    Author     : Jelena Jovanovic
--%>

<%@page import="models.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Users> users = (ArrayList<Users>) request.getAttribute("users");
    int num = Integer.parseInt((String) request.getAttribute("num"));
    int limit = Integer.parseInt((String) request.getAttribute("limit"));
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
        <title>Users View</title>
       
    </head>
    <body>
        <div class="container-lg abs">
            <%@include file="../fragments/header.jsp"  %>
            <div class="row">
                <div class="col-sm-3 p-2 m-2">
                    <%@include file="../fragments/menu.jsp"  %>
                </div>
                <div class="col-sm-8 p-2 m-2">



                    <% if (users != null) { %>
                    <table class="table table-responsive">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Firstname</th>
                                <th scope="col">Lastname</th>
                                <th scope="col">Username</th>   
                                <th scope="col">Password</th>
                                <th scope="col">Email</th>
                                <th scope="col">Active</th>
                                <th scope="col">Role</th>
                                <th scope="col">Location</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Users user : users) {%>
                            <tr>
                                <td><%=user.getFirstname()%></td>
                                <td><%=user.getLastname()%></td>
                                <td><%=user.getUsername()%></td>
                                <td><%=user.getPassword()%></td>
                                <td><%=user.getEmail()%></td>
                                <td><% if (user.getActive().equals("True")) {
                                                out.print(user.getActive());
                                            } else {%>
                                    <form action="activate" method="post">
                                        <input type="hidden" name="userid" value=<%=String.valueOf(user.getId())%> >
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal<%=String.valueOf(user.getId())%>">
                                            Activate account
                                        </button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal<%=String.valueOf(user.getId())%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Activate account</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Do you want to activate account?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                        <button type="submit" class="btn btn-warning">Yes</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <%}%>
                                </td>
                                <td><%=user.getRole()%></td>
                                <td><%=user.getLocation()%></td>

                            </tr>
                            <%}%>
                        </tbody>
                    </table>

                    <%} else {%>
                    <span>No users
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
                            <a class="dropdown-item" href="users?index=<%=i%>&pageNum=<%=j%>"><%=j%></a>

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
