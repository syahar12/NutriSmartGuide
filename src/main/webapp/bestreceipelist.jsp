<%-- 
    Document   : bestreceipelist
    Created on : 21 Jun 2023, 7:54:36 am
    Author     : 60107
--%>
<%-- 
    Document   : ingredient
    Created on : 3 Jun 2023, 1:48:01 pm
    Author     : 60107
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
   <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>List RECEIPE</title>
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
      <h1 class="title-page">BEST RECEIPE LIST</h1>
    </nav>
     
    <main class="main">
       <h3>Best Recipes:</h3>
    <table>
      <thead>
        <tr>
          <th>Recipe ID</th>
          <th>Recipe Name</th>
          <th>Calories</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${recipeBest}" var="bestRecipe">
          <tr>
            <td>${bestRecipe.recipeId}</td>
            <td>${bestRecipe.recipeName}</td>
            <td>${bestRecipe.recipeCal}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    

      <script>
           <%@ include file="JS/dashboard.js"%>
      </script>
  </body>
</html>
