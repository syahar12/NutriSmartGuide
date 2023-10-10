<%-- 
    Document   : Profile
    Created on : Jun 22, 2023, 8:48:35 PM
    Author     : HUAWEI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%--
<jsp:useBean id="admin" class="com.Model.Admin" scope="request"/>
<jsp:setProperty name="admin" property="*"/>
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <style>
            * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

.sidebar {
    position: fixed;
    height: 100%;
    width: 260px;
    background: #0A192F;
    padding: 15px;
    z-index: 99;
}

.logo {
    font-size: 25px;
    padding: 0 15px;
}

.sidebar a {
    color: #fff;
    text-decoration: none;
}

.menu-content {
    position: relative;
    height: 100%;
    width: 100%;
    margin-top: 40px;
    overflow-y: scroll;
}

.menu-content::-webkit-scrollbar {
    display: none;
}

.menu-items {
    height: 100%;
    width: 100%;
    list-style: none;
    transition: all 0.4s ease;
}

.submenu-active .menu-items {
    transform: translateX(-56%);
}

.menu-title {
    color: #fff;
    font-size: 14px;
    padding: 15px 20px;
}

.item a,
.submenu-item {
    padding: 16px;
    display: inline-block;
    width: 100%;
    border-radius: 12px;
}

.item i {
    font-size: 12px;
}

.item a:hover,
.submenu-item:hover,
.submenu .menu-title:hover {
    background: rgba(255, 255, 255, 0.1);
}

.submenu-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #fff;
    cursor: pointer;
}

.submenu {
    position: absolute;
    height: 100%;
    width: 100%;
    top: 0;
    right: calc(-100% - 26px);
    height: calc(100% + 100vh);
    display: none;
}

.show-submenu~.submenu {
    display: block;
}

.submenu .menu-title {
    border-radius: 12px;
    cursor: pointer;
}

.submenu .menu-title i {
    margin-right: 10px;
}

.navbar,
.main {
    left: 260px;
    width: calc(100% - 260px);
    transition: all 0.5s ease;
    z-index: 1000;
}

.sidebar.close~.navbar,
.sidebar.close~.main {
    left: 0;
    width: 100%;
}

.navbar {
    position: fixed;
    color: #fff;
    padding: 15px 20px;
    font-size: 25px;
    background:#1D3557;
    cursor: pointer;
}

.navbar #sidebar-close {
    cursor: pointer;
}
.navbar{
    display: flex;
    flex-direction: row;
}
.title-page{
    text-align: center;
    align-items: center;
    padding-left: 35%;
    font-family: 'Merriweather', serif;
}

/* DBHSBDS*/
.profile-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 20px;
            color: #fff;
        }

        .profile-info {
            margin-bottom: 20px;
        }

        .profile-info label {
            font-weight: bold;
        }

        .profile-info p {
            margin: 5px 0;
        }

        .profile-actions {
            text-align: right;
        }

        .profile-actions a {
            display: inline-block;
            padding: 8px 16px;
            background-color: #506982;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .profile-actions a:hover {
            background-color: #3b4b66;
        }
    
  
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #506982;
            color: #fff;
            padding: 10px;
        }

        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        .navbar li {
            float: left;
        }

        .navbar li a {
            display: block;
            color: #fff;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar li a:hover {
            background-color: #3b4b66;
        }

        .content {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
.profile-container  {
    margin-top: 5%;
    margin-left: 40%;
   border: solid rgb(7, 7, 7);
   background-color: #456e978f;
}

.profile-container label {
    font-size: 18px;
}

.con-title{
    display: flex;
    margin: 20px 0;

}

input[type="submit"] {
    width: 70px;
    height: 35px;
    margin-top: 20px;
    border: none;
    background-color: #344a72;
    color: white;
    font-size: 15px;
    text-align: center;
   
}
      
        </style>
            
    </head>
    <body>
         
        <nav class="sidebar">
      <a href="#" class="logo">NutriSmartGuide</a>

      <div class="menu-content">
        <ul class="menu-items">
          <div class="menu-title">Your menu title</div>

          <li class="item">
            <a href="#">DASHBOARD</a>
          </li>
          <li class="item">
            <a href="profile.html">MY PROFILE</a>
          </li>
          <li class="item">
            <a href="<%=request.getContextPath()%>/list">INGREDIENT</a>
          </li>
          <li class="item">
            <div class="submenu-item">
              <span>RECIPE</span>
              <i class="fa-solid fa-chevron-right"></i>
            </div>
            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                RECIPE MANAGEMENT
              </div>
               <li class="item">
                    <a href="<%=request.getContextPath()%>/listrecipe">MANAGE</a>
                </li>
              <li class="item">
                <a href="#">BEST RECIPE</a>
              </li>
            </ul>
          </li>
          <li class="item">
            <a href="<%=request.getContextPath()%>/listInstructionRetrieve">INSTRUCTION</a>
          </li>
        </ul>
      </div>
    </nav>

    <nav class="navbar">
        <i class="fa-solid fa-bars" id="sidebar-close"></i>
        <h1 class="title-page">MY PROFILE</h1>
      </nav><br>
   <!-------------------MAINNNNNNN-------------->
   <div class="profile-container">
    <div class="con-title">
    <h1>Admin NutriSmartGuide</h1>
</div>

    <br>
    <c:forEach items="${admin}" var="admin" varStatus="status">
    <label>First Name&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;: <c:out value="${admin.firstName}"/></label>
    <br><br>
    
    <label>Last Name&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;: <c:out value="${admin.lastName}"/></label>  
    <br><br>
    <label>Phone Number&nbsp;&nbsp;&nbsp; : <c:out value="${admin.noPhone}"/></label>
   
    <br> <br>
    <label>Gender&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <c:out value="${admin.gender}"/></label>
    
    <br> <br>
    <label>Email&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <c:out value="${admin.email}"/></label>
        
    <br><br>
    <a class="button" href="editFormAdmin?id=<c:out value='${admin.adminId}'/>">UPDATE</a>
    </c:forEach>
    </body>
</html>
