<%-- 
    Document   : signup
    Created on : Sep 10, 2020, 8:43:48 PM
    Author     : Jelena Jovanovic
--%>

<%@page import="models.Locations"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Sign up</title>
        <script>
            $(function () {
                let signupFirstname = document.getElementById("signupFirstname");
                let signupLastname = document.getElementById("signupLastname");
                let signupUsername = document.getElementById("signupUsername");
                let signupPassword = document.getElementById("signupPassword");
                let signupPasswordCheck = document.getElementById("signupPasswordCheck");
                let signupEmail = document.getElementById("signupEmail");
                let signupButton = document.getElementById("signupButton");
                signupButton.disabled = true;
                
                function checkPassword(password) {
                    let strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
                    return strongRegex.test(password);
                }
                function checkPasswordMatch(password, passwordCheck) {
                    return password == passwordCheck;
                }
                function checkFields() {
                    if (signupFirstname.value != "" && signupLastname.value != ""
                            && signupUsername.value != "" && signupPassword.value != ""
                            && signupPasswordCheck.value != ""
                            && signupEmail.value != "" && checkPassword(signupPassword.value) && checkPasswordMatch(signupPassword.value, signupPasswordCheck.value)) {

                        signupButton.disabled = false;
                    } else {
                        signupButton.disabled = true;
                    }

                }
                
                function writeMessage() {
                    if (!checkPassword(signupPassword.value)) {
                        
                        document.getElementById("passwordValidation").innerHTML = "The string must contain at least 1 lowercase alphabetical character. \n\
        The string must contain at least 1 uppercase alphabetical character.\n\
        The string must contain at least 1 numeric character.\n\
        The string must contain at least one special character.\n\
        The string must be eight characters or longer.";
                    } else {
                        
                        document.getElementById("passwordValidation").innerHTML = "";
                    }
                    if (checkPasswordMatch(signupPassword.value, signupPasswordCheck.value)) {
                        
                        document.getElementById("notSame").innerHTML = "";

                    } else {
                        
                        document.getElementById("notSame").innerHTML = "Password and Password Check are not the same.";
                    }
                }
                signupFirstname.onchange = function () {
                    checkFields();

                }

                signupLastname.onchange = function () {
                    checkFields();

                }

                signupUsername.onchange = function () {
                    checkFields();

                }
                signupPassword.onchange = function () {
                    checkFields();
                    writeMessage();
                }

                signupPasswordCheck.onchange = function () {
                    checkFields();
                    writeMessage();
                }


                signupEmail.onchange = function () {
                    checkFields();

                }
                 if (document.getElementById("signupLocation") !== null) {
                    document.getElementById("signupLocation").disabled = true;
                    document.getElementById("signupLocation").style.setProperty("display", "none");
                    document.getElementById("signupRole").onchange = function () {
                        if (document.getElementById("signupRole").value == "treasurer") {
                            document.getElementById("signupLocation").disabled = false;
                            document.getElementById("signupLocation").style.setProperty("display", "inline-block");
                        } else {
                            document.getElementById("signupLocation").disabled = true;
                            document.getElementById("signupLocation").style.setProperty("display", "none");
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
                    <span class="text-danger"><%=(request.getAttribute("signupFail")) != null ? request.getAttribute("signupFail") : ""%>
                                </span>
                    <div class="signup-form">
                        
                            <div>
                                <h2>Sign up</h2>
                                <p>Please enter your information. All fields need to be filled out</p>
                            </div>
                            <form action="signupPost" method="post">
                                <div class="form-group">


                                    <input type="text" class="form-control" id="signupFirstname" name="signupfirstname" placeholder="Firstname">

                                </div>
                                <div class="form-group">


                                    <input type="text" class="form-control" id="signupLastname" name="signuplastname" placeholder="Lastname">

                                </div>

                                <div class="form-group">


                                    <input type="text" class="form-control" id="signupUsername" name="signupusername" placeholder="Username">

                                </div>

                                <div class="form-group">

                                    <input type="password" class="form-control" id="signupPassword" name="signuppassword" placeholder="Password">
                                    <span id="passwordValidation" class="text-danger"></span>
                                </div>

                                <div class="form-group">

                                    <input type="password" class="form-control" id="signupPasswordCheck" name="signuppasswordcheck" placeholder="Password Check">
                                    <span id="notSame" class="text-danger"></span>

                                </div>

                                <div class="form-group">

                                    <input type="text" class="form-control" id="signupEmail" name="signupemail" placeholder="Email">

                                </div>
                                <% if (session.getAttribute("user_id") != null && session.getAttribute("user_role").equals("admin")) {
                                        ArrayList<Locations> locations = (ArrayList<Locations>) request.getAttribute("locations");

                                %>

                                <div class="border">
                                    <h4>Fills adminstrator</h4>
                                    <div class="form-group">

                                        <select id="signupRole" class="form-control" name="signuprole">
                                            <option selected>regular</option>
                                            <option>admin</option>
                                            <option>treasurer</option>

                                        </select>

                                    </div>
                                    <div class="form-group">

                                        <select id="signupLocation" class="form-control" name="signuplocation">
                                            <% for (Locations location : locations) {%>
                                            <option value="<%=location.getId()%>"><%=location.getTitle()%></option>
                                            <%}%>

                                        </select>

                                    </div>

                                </div>
                                <%}%>
                                <button  type="submit" class="btn btn-warning btn-block text-center" id="signupButton" disabled>Login</button>

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
