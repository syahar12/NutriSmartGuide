<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Recipe</title>
        <style>        
             <%@ include file="CSS/everytype.css"%>
        </style>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Chokokutai&family=Dancing+Script:wght@700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-m1NQ5Z0lIaYkd5oal9uwqVQz68rYZvsf2ecKvriYP6RK2wgbq0XJftz4L3InMw8B3CF5eIe0VfNTL6dCV8Ln0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
          <link href='https://unpkg.com/css.gg@2.0.0/icons/css/profile.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <!--header-->
    <header>
        <div class="head-title"> </div>
        <p class="title"> NutriSmartGuide</p>

        <!-- Add the social icons at the top left -->

        <nav>
            <ul class="social-icons">
                <li><a href="#"><i class="fab fa-facebook" ></i></a></li>
                <li><a href="#"><i class="fab fa-whatsapp"></i></a></li>
                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
            </ul>
        </nav>
    </header>
    <body>
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
        <br><br><br><br>
        <c:choose>
            <c:when test="${param.recipeType == 'Breakfast'}">
                <div class="sub-title">
                    <h2>BREAKFAST</h2>
                </div>
                <!-- Code for displaying Breakfast recipes -->
                <c:forEach items="${recipetype}" var="recipe">
                    <c:if test="${recipe.recipeType == 'Breakfast'}">
                        <div class="order">
                            <div class="card">
                                <div class="imgBx">
                                    <img src="<c:out value="${recipe.recipeImg}"/>" />
                                </div>
                                <h2 class="title_pf"><c:out value="${recipe.recipeName}"/> <br /><span></span></h2>
                                 <a href="showDetailOnceRecipe?recipeId=${recipe.recipeId}"><button class="btn-more">Recipe</button></a>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:when test="${param.recipeType == 'Lunch'}">
                <div class="sub-title">
                    <h2>LUNCH</h2>
                </div>
                <!-- Code for displaying Lunch recipes -->
                <c:forEach items="${recipetype}" var="recipe">
                    <c:if test="${recipe.recipeType == 'Lunch'}">
                        <div class="order">
                            <div class="card">
                                <div class="imgBx">
                                    <img src="<c:out value="${recipe.recipeImg}"/>" />
                                </div>
                                <h2 class="title_pf"><c:out value="${recipe.recipeName}"/> <br /><span></span></h2>
                                <a href="showDetailOnceRecipe?recipeId=${recipe.recipeId}"><button class="btn-more">Recipe</button></a>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:when test="${param.recipeType == 'Dinner'}">
                <div class="sub-title">
                    <h2>DINNER</h2>
                </div>
                <!-- Code for displaying Dinner recipes -->
                <c:forEach items="${recipetype}" var="recipe">
                    <c:if test="${recipe.recipeType == 'Dinner'}">
                        <div class="order">
                            <div class="card">
                                <div class="imgBx">
                                    <img src="<c:out value="${recipe.recipeImg}"/>" />
                                </div>
                                <h2 class="title_pf"><c:out value="${recipe.recipeName}"/> <br /><span></span></h2>
                                <a href="showDetailOnceRecipe?recipeId=${recipe.recipeId}"><button class="btn-more">Recipe</button></a>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <!-- Default code for displaying all recipes -->
                <c:forEach items="${recipetype}" var="recipe">
                    <div class="order">
                        <div class="card">
                            <div class="imgBx">
                                <img src="<c:out value="${recipe.recipeImg}"/>" />
                            </div>
                            <h2 class="title_pf"><c:out value="${recipe.recipeName}"/> <br /><span></span></h2>
                            <a href="showDetailOnceRecipe?recipeId=${recipe.recipeId}"><button class="btn-more">Recipe</button></a>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>
