<%-- 
    Document   : ingredient
    Created on : 3 Jun 2023, 1:48:01 pm
    Author     : 60107
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>List Ingredient</title>
        <style>
            <%@ include file="CSS/ingredient.css"%>
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
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
            <h1 class="title-page">INGREDIENT LIST</h1>
        </nav>

        <main class="main">
            <br>
            <a class="button-add" href="<%=request.getContextPath()%>/new">ADD INGREDIENT</a>
            <br>
            <br>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>INGREDIENT ID</th>
                        <th>NAME</th>
                        <th>MEASUREMENT</th>
                        <th>CALORIES</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ingredients}" var="ingredient" varStatus="status">
                        <tr>
                            <td>${status.index +1}</td>
                            <td><c:out value="${ingredient.ingId}"/></td>
                            <td><c:out value="${ingredient.ingName}"/></td>
                            <td><c:out value="${ingredient.ingMeasure}"/></td>
                            <td><c:out value="${ingredient.ingCal}"/></td>
                            <td >
                                <div class="button-container">
                                    <a  class="button" href="edit?id=<c:out value='${ingredient.ingId}'/>">UPDATE</a>
                                    <a  class="button" href="delete?id=<c:out value='${ingredient.ingId}'/>">DELETE</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </main>


        <script>
            <%@ include file="JS/dashboard.js"%>
        </script>
    </body>
</html>
