<%-- 
    Document   : Signup
    Created on : Jun 22, 2023, 8:26:26 PM
    Author     : HUAWEI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        
        <style>
            body{
    background-color: #344a72;
    font-family: 'Roboto', sans-serif;
}
.signup-box {
    margin-top: 4%;
    margin-left: 38%;
    width:360px;
    height:660px;
    
    background-color: white;
    border-radius: 3px;
}

.topic h1 {
    font-size: 50px;
    color: aliceblue;
     font-family: 'Diphylleia', serif;
}


h1 {
    text-align: center;
    padding-top: 15px;
    
}
h4 {
    text-align: center;

}

form {
    width: 300px;
    margin-left: 20px;


}

form label {
    display: flex;
    margin-top: 25px;
    font-size: 18px;

}

form input {
    width: 100%;
    padding: 7px;
    border: none;
    border: 1px solid gray;
    border-radius: 6px;
    outline: none;
}
input[type="submit"] {
    width: 320px;
    height: 35px;
    margin-top: 20px;
    border: none;
    background-color: #344a72;
    color: white;
    font-size: 15px;
}

p {
    text-align: center;
    padding-top: 15px;
    font-size: 15px;
    color: white;

}
.para-2 {
    text-align: center;
    color: white;
    font-size: 15px;
    margin-top: -10px;

}
.para-2 a {
    color: rgb(161, 161, 222);
}

        </style>
    </head>
    <body>
          <div class="topic">

        <h1>NutriSmartGuide</h1>
    </div>
    <div class="signup-box">
        <h1>Sign Up</h1>
        <form action="signupAdmin" method="post">


            <label>First Name</label>
            <input type="text" name="firstName" placeholder="" required="required">
           
            <label>Last Name</label>
            <input type="text" name="lastName" placeholder="" required="required">
           
            <label>Phone Number</label>
            <input type="text" name="noPhone" placeholder="" required="required">
          
            <label for="birthday">Birthday:</label>
            <input type="date" id="birthday" name="birthDate">
           
            <label>Email</label>
            <input type="text" name="email" placeholder="" required="required">
           
            <label>Gender</label>
            <select name="gender" id="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
           
            <label>Password</label>
            <input type="password" name="password" required="required">
            
            <input type="submit" value="Submit">
            
            
        </form>
    </div>
    
    </body>
</html>