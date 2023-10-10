<%-- 
    Document   : detailsList
    Created on : 15 Jun 2023, 3:27:26 am
    Author     : irfan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import= "java.util.List"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
        <style>
            <%@ include file="CSS/ingredient.css"%>
       </style>
    </head>
    <body>
        <nav class="sidebar">
            <a href="#" class="logo">NutriSmartGuide</a>

            <div class="menu-content">
                <ul class="menu-items">
                    <div class="menu-title"></div>

                    <li class="item">
                        <a href="#">MY PROFILE</a>
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
                                <a href="<%=request.getContextPath()%>/recipebest">BEST RECIPE</a>
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
            <h1 class="title-page">RECIPE INGREDIENTS</h1>
        </nav>
        <main class="main">
            <br>
            <a class="button-add" href="<%=request.getContextPath()%>/listrecipe">RECIPE LIST</a>
            <a class="button-add" href="RecipeDetailsServlet?action=newdetails&detailsrecipeId=${detailsrecipeId}">ADD INGREDIENT</a>
      
            <br>
            <br>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>                        
                        <th>INGREDIENT</th>
                        <th>MEASUREMENT</th>
                        <th>QUANTITY</th>
                        <th>CALORIE</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listDetails}" var="details" varStatus="status">
                        <tr>                            
                            <td>${status.index + 1}</td>
                            <td><c:out value="${details.detailsingName}"/></td>
                            <td><c:out value="${details.detailsingMeasure}"/></td>
                            <td><c:out value="${details.detailsQty}"/></td>
                            <td><c:out value="${details.totalCal}"/></td>
                            <td>
                                <div class="button-container">
                                    <a class="button" href="editdetails?detailsrecipeId=${details.detailsrecipeId}">UPDATE</a>
                                    <a class="button" href="deletedetails?detailsrecipeId=${details.detailsrecipeId}&detailsingId=${details.detailsingId}&detailsQty=${details.detailsQty}">DELETE</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
           <script>
           <%@ include file="JS/dashboard.js"%>
      </script>
        </main>
    </body>
</html>
