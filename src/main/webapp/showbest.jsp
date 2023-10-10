<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link  rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Chokokutai&family=Dancing+Script:wght@700&display=swap">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
  integrity="sha512-m1NQ5Z0lIaYkd5oal9uwqVQz68rYZvsf2ecKvriYP6RK2wgbq0XJftz4L3InMw8B3CF5eIe0VfNTL6dCV8Ln0g=="
  crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link href='https://unpkg.com/css.gg@2.0.0/icons/css/profile.css' rel='stylesheet'>
    <title>Top 5 Best Recipes</title>
    <style>
        <%@ include file="CSS/showbest.css"%>
          <%@ include file="CSS/header.css"%>
    </style>
</head>
<body>
       <div class="all-top">
    <!--header-->
    <header>
        <div class="head-title"> </div>
            <p class="title"> NutriSmartGuide</p>
    <!-- Add the social icons at the top left -->
    <nav>
        <ul class="social-icons">
            <li><a href="#"><i class="fab fa-facebook"></i></a></li>
            <li><a href="#"><i class="fab fa-whatsapp"></i></a></li>
            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
        </ul>
    </header>

    <!--navigation bar-->
         <div class="navbar">
            <div class="function">
            <ul>
                <li><a href="homepage.jsp">HOME</a></li>
                <li><a href="homepage.jsp">ABOUT </a>
                <li><a href="#">RECIPE</a>
                    <ul class="dropdown">
                        <li><a href="recipetype?type=Breakfast">BBREAKFAST</a></li>
                        <li><a href="recipetype?type=Lunch">LUNCH</a></li>
                        <li><a href="recipetype?type=Dinner" >DINNER</a></li>
                    </ul>
                <li><a href="receipeDay.jsp">RECIPE A DAY </a>
                    <li><a href="<%=request.getContextPath()%>/userbest">BEST RECIPE</a>
                        <li><a href="search.jsp">SEARCH RECIPE </a>
                            <a href="login.jsp"><li><i class="gg-profile"></i></li></a>
                </li>
                </li>
                </li>
            </ul>
        </div>
        </div>
    
    <div class="container">
    <h1>Top 5 Best Recipes</h1>
        
    <div class="recipe-list">
        <c:forEach items="${recipeBest}" var="recipe" varStatus="status">
            <c:if test="${status.index <= 4}">
                <div class="recipe-card">
                    <img src="${recipe.recipeImg}" alt="${recipe.recipeName}">
                    <h2>${recipe.recipeName}</h2>
                    <p>${recipe.recipeDesc}</p>
                    <div class="button-container">
                        <a href="showDetailOnceRecipe?recipeId=${recipe.recipeId}">Read More</a>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>
</body>
</html>

