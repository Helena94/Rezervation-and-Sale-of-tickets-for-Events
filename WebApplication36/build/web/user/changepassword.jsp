<%-- 
    Document   : changepassword
    Created on : Sep 15, 2020, 12:56:30 AM
    Author     : Jelena Jovanovic
--%>

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
        <title>Change password</title>
        
        <script>
            $(function () {
                let changeButton = document.getElementById("changeButton");
                let changeOldPassword = document.getElementById("changeOldPassword");
                let changeConfirmOldPassword = document.getElementById("changeConfirmOldPassword");
                let changePassword = document.getElementById("changePassword");
                changeButton.disabled = true;
                function checkPassword(password) {
                    let strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
                    return strongRegex.test(password);
                }
                function checkPasswordMatch(password, passwordCheck) {
                    return password == passwordCheck;
                }
                function checkFieldsAreEmpty(){
                    return changeOldPassword.value != "" && changeConfirmOldPassword.value != "" && changePassword != ""; 
                }
                function disabledButton(){
                   if(checkPassword(changePassword.value) && checkPasswordMatch(changeOldPassword.value, changeConfirmOldPassword.value) && checkFieldsAreEmpty()){
                       changeButton.disabled = false; 
                       
                    }else{
                        changeButton.disabled = true; 
                        
                    } 
                }
                function samePassword(){
                    if ( checkPasswordMatch(changeOldPassword.value, changeConfirmOldPassword.value)) {
                        
                        document.getElementById("notTheSame").innerHTML = "";

                    } else {
                        
                        document.getElementById("notTheSame").innerHTML = "Password and Password Check are not the same.";
                    }
                }
                changePassword.onchange=function(){
                    disabledButton();
                    if(!checkPassword(this.value)){
                        
                        document.getElementById("qualityPassword").innerHTML = "The string must contain at least 1 lowercase alphabetical character. \n\
        The string must contain at least 1 uppercase alphabetical character.\n\
        The string must contain at least 1 numeric character.\n\
        The string must contain at least one special character.\n\
        The string must be eight characters or longer.";
                    }else{
                        
                        document.getElementById("qualityPassword").innerHTML = "";
                    }
                    
                }
                changeOldPassword.onchange = function(){
                    disabledButton();
                    samePassword();
                }
                changeConfirmOldPassword.onchange = function(){
                    disabledButton();
                    samePassword();
                }
            })
    
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

                    <div class="change-form">
                        
                            <div>
                                <h2>Change password</h2>
                                <p>Enter your old password and new one</p>
                                <span class="text-danger"><%=(request.getAttribute("failChange")!=null)?request.getAttribute("failChange"):""%></span>
                           
                            </div>
                            <form action="change" method="post">

                                 <div class="form-group">

                                    <input type="password" class="form-control" id="changeOldPassword" name="changeoldpassword" placeholder="Old Password">

                                </div>

                                <div class="form-group">

                                    <input type="password" class="form-control" id="changeConfirmOldPassword" name="changeconfirmpassword" placeholder="Confirmation of Old Password">
                                    <span id="notTheSame" class="text-danger"></span>
                                </div>
                                <div class="form-group">

                                    <input type="password" class="form-control" id="changePassword" name="changepassword" placeholder="New Password">
                                    <span id="qualityPassword" class="text-danger"></span>
                                </div>
                                <button id="changeButton" type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal">
                                            Confirm change
                                        </button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Activate account</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Do you want to change password?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                        <button type="submit" class="btn btn-warning">Yes</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <span id="fiiledFields" class="text-danger"></span>
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
