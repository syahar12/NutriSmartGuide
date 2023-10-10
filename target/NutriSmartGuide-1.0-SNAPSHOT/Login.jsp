<%-- 
    Document   : Login
    Created on : Jun 22, 2023, 8:19:02 PM
    Author     : HUAWEI
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            body{
    background-color: #344a72;
    font-family: 'Roboto', sans-serif;
}

.login-box {
    width: 360px;
    height: 280px;
    margin-top: 4%;
    margin-left: 38%;
    border-radius: 3px;
    background-color: white;
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
    <div class="login-box">
      <h1>Admin Login</h1>
      
      <form action="loginAdmin" method="get" >
        <label>Email</label>
        <input type="text" name="email" placeholder="Enter the email" />
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter the password" />
        <input type="submit" value="Submit" href="login"/>
      </form>
    </div>
    
   
    </body>
</html>