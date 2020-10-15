<%-- 
    Document   : login
    Created on : Sep 9, 2020, 2:52:50 PM
    Author     : Jelena Jovanovic
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Events"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<% ArrayList<Events> evs = (ArrayList<Events>) request.getAttribute("events");%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/general.css">    
        <script>
            $(function () {
                let loginUsername = document.getElementById("loginUsername");
                let loginPassword = document.getElementById("loginPassword");
                let loginButton = document.getElementById("loginButton");
                loginButton.disabled = true;
                function checkFields(){
                    if (loginUsername.value != "" && loginPassword.value != "" ) {
                        loginButton.disabled = false;
                    }else{
                        loginButton.disabled = true;
                    }
                }
                loginUsername.onchange = function () {
                    checkFields();
                }
                loginPassword.onchange = function () {
                    checkFields();
                }

            });
        </script>

        <title>Login</title>
        
        

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
                                <h2>Login</h2>
                                <p>Please enter your username and password</p>
                            </div>
                            <form action="loginCheck" method="post">

                                <div class="form-group">


                                    <input type="text" class="form-control" id="loginUsername" name="loginusername" placeholder="Username">

                                </div>

                                <div class="form-group">

                                    <input type="password" class="form-control" id="loginPassword" name="loginpassword" placeholder="Password">

                                </div>
                                <!--                                <div class="forgot">
                                                                    <a href="reset.html">Forgot password?</a>
                                                                </div>-->
                                <button  type="submit" class="btn btn-warning btn-block text-center" id="loginButton" disabled>Login</button>
                                <span class="text-danger">
                                    <%=(request.getAttribute("failMsg"))!= null?request.getAttribute("failMsg"):""%>
                                    <%--= 

                                    (session.getAttribute("failMsg"))!= null?session.getAttribute("failMsg"):""
                                    %>
                                    <%
                                        session.removeAttribute("failMsg");
                                    --%>
                                </span>
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

