<%@ page import="java.sql.*" %>
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
  <title>Search Recipe</title>
  
   <style>
    <%@ include file="CSS/searchRecipe.css"%>
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
                <li><a href="DisplayRecipe.html">HOME</a></li>
                <li><a href="#">ABOUT </a>
                <li><a href="#">RECIPE</a>
                    <ul class="dropdown">
                        <li><a href="recipetype?type=Breakfast">BBREAKFAST</a></li>
                        <li><a href="recipetype?type=Lunch">LUNCH</a></li>
                        <li><a href="recipetype?type=Dinner" >DINNER</a></li>
                    </ul>
                <li><a href="#">RECIPE A DAY </a>
                    <li><a href="<%=request.getContextPath()%>/userbest">BEST RECIPE</a>
                        <li><a href="search.jsp">SEARCH RECIPE </a>
                </li>
                <li><i class="gg-profile"></i></li>
                </li>
                </li>
            </ul>
        </div>
        </div>
      </div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <div class="top">
    <div>
      <h1 class="Title">NutiSmartGuide<br> UNVEILING THE WORLD OF LOW-CALORIE COOKING</h1>
      <br>
      <h5 class="tagline">Indulge in the delightful and heavenly experience of unlocking the magic within a vast collection of scrumptious, nutritious, and low-calorie recipes, igniting a journey towards a healthier lifestyle and culinary bliss</h5>
      <br>
    </div>
    <div class="input-box">
      <i class="uil uil-search"></i>
      <form action="search.jsp" method="GET">
        <input type="text" name="searchRecipe" placeholder="Search here..." />
        <button type="submit" class="button">Search</button>
      </form>
    </div>
  </div>
  
</body>
</html>
