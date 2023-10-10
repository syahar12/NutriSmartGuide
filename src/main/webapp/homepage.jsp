<%-- 
    Document   : homepage
    Created on : 23 Jun 2023, 10:15:55 am
    Author     : 60107
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <title>Recipe</title>
    <title> Recipe </title>
    <link rel="stylesheet" type="text/css" href="main.css">
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
    <style>
        
             <%@ include file="CSS/homepage.css"%>
        </style>

</head>
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
    <main>
        <div class="intro">
            <h1>WELCOME TO<br> NutriSmartGuide </h1>
            <p>.</p>
        </div>


        <div class="about-us">
            <div class="about-us-text">
                <h2>About Us</h2>
                <br><h3> Recommended website to share the low-calorie recipes and foods</h3>
                    <p>NutriSmartGuide is designated to aid users to giving information and healthy dietary decisions by
                    providing a convenient and user-friendly platform for discovering and selecting low-calorie foods.</p>
                </p>
                <br>
         
            </div>

            <img src="https://i.pinimg.com/564x/34/65/54/3465547762931302ec8c64211ef478c7.jpg" alt="me">
           
    </div>
    </div>
    </main>
    <footer class="footer">
        <div class="copy">© 2023 Developer NutriSmart</div>

    </footer>



    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>

</html>