<%-- 
    Document   : recipeList
    Created on : 7 Jun 2023, 10:21:50 pm
    Author     : irfan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recipe List</title>
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
            <h1 class="title-page">RECIPE LIST</h1>
        </nav>

        <main class="main">
            <br>
            <a class="button-add" href="<%=request.getContextPath()%>/newrecipe">ADD RECIPE</a>
            <br>
            <br>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>RECIPE NAME</th>
                        <th>IMAGE</th>
                        <th>CALORIES</th>
                        <th>TYPE</th>
                        <th>DESCRIPTION</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listRecipe}" var="recipe" varStatus="status">
                        <tr>
                            <td>${status.index +1}</td>
                            <td><c:out value="${recipe.recipeId}"/></td>
                            <td><c:out value="${recipe.recipeName}"/></td>
                            <td><img src="<c:out value="${recipe.recipeImg}"/>" alt="<c:out value="${recipe.recipeName}"/>" width="150" height="100"></td>
                            <td><c:out value="${recipe.recipeCal}"/></td>
                            <td><c:out value="${recipe.recipeType}"/></td>
                            <td><c:out value="${recipe.recipeDesc}"/></td>
                            <td >
                                <div class="button-container">
                                    <a class="button" href="viewdetails?detailsrecipeId=${recipe.recipeId}">DETAILS</a>
                                    <a  class="button" href="editrecipe?recipeId=${recipe.recipeId}"">UPDATE</a>
                                    <a  class="button" href="deleterecipe?recipeId=${recipe.recipeId}">DELETE</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>

        <script>
            const sidebar = document.querySelector(".sidebar");
            const sidebarClose = document.querySelector("#sidebar-close");
            const menu = document.querySelector(".menu-content");
            const menuItems = document.querySelectorAll(".submenu-item");
            const subMenuTitles = document.querySelectorAll(".submenu .menu-title");

            sidebarClose.addEventListener("click", () => sidebar.classList.toggle("close"));

            menuItems.forEach((item, index) => {
                item.addEventListener("click", () => {
                    menu.classList.add("submenu-active");
                    item.classList.add("show-submenu");
                    menuItems.forEach((item2, index2) => {
                        if (index !== index2) {
                            item2.classList.remove("show-submenu");
                        }
                    });
                });
            });

            subMenuTitles.forEach((title) => {
                title.addEventListener("click", () => {
                    menu.classList.remove("submenu-active");
                });
            });

        </script>
    </body>
</html>
