<%-- 
    Document   : header
    Created on : Sep 8, 2020, 12:25:43 PM
    Author     : Jelena Jovanovic
--%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->

        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="css/general.css">        
        <title>Header</title>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-orange">
            <span>Rezervation and Sale of Tickets |</span>
            <div class="collapse navbar-collapse" id="navbarText" >
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">

                    </li>

                </ul>
                <ul class="navbar-nav active navbar-right">
                    <a class="nav-link"  href="login">Login <span class="sr-only">(current)</span></a>
                    <%if (session.getAttribute("user_id") == null || session.getAttribute("user_role").equals("admin")) {%>
                    <a class="nav-link" href="signup">Sign up <span class="sr-only">(current)</span></a>
                    <%}%>
                    <%if (session.getAttribute("user_id") != null) {%>
                    <a class="nav-link" href="logout">Logout <span class="sr-only">(current)</span></a>
                    <%}%>
                </ul>
            </div>
        </nav
    </body>
</html>
