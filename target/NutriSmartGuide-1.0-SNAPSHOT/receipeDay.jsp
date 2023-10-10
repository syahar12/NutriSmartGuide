<!DOCTYPE html>
<html>

<head>

    <title>Recipe</title>
    <title> Recipe </title>
    <link rel="stylesheet" type="text/css" href="recipeADay.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chokokutai&family=Dancing+Script:wght@700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-m1NQ5Z0lIaYkd5oal9uwqVQz68rYZvsf2ecKvriYP6RK2wgbq0XJftz4L3InMw8B3CF5eIe0VfNTL6dCV8Ln0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
       
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='https://unpkg.com/css.gg@2.0.0/icons/css/profile.css' rel='stylesheet'>
  <style>
        <%@ include file="CSS/header.css"%>
          <%@ include file="CSS/recipeDay.css"%>
   
  </style>
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
   <br><br><br><br>
   <!----------------insert line title-----------------
   <div class="line" >
    <img src="lineTitle.png">
   </div>-->

   <!-------------------------title-------------------->
   <div class="sub-title">
    <h2>RECIPE A DAY</h2>
</div>

   <!----------------top menu------------------------->

   
   <div class="order">
    <div class="card">
        <div class="type">
            <p>BREAKFAST</p>
        </div>
        <div class="imgBx">
            <img src="https://www.thespruceeats.com/thmb/Hn65vI6v55aIBCwMQaf0SWcVLYI=/2048x1360/filters:fill(auto,1)/vegetarian-bean-and-rice-burrito-recipe-3378550-9_preview-5b2417e1ff1b780037a58cda.jpeg" />
        </div>
        <h2 class="title_pf">Burrito <br /><span></span></h2>
        <button class="btn-more">Recipe</button>
    </div>

    <div class="card">
        <div class="type">
            <p>LUNCH</p>
        </div>
        <div class="imgBx">
            <img src="https://foolproofliving.com/wp-content/uploads/2017/12/Greek-Yogurt-Parfait-Recipe.jpg" />
        </div>
        <h2 class="title_pf">Greek Yogurt Parfait <br /><span></span></h2>
        <button class="btn-more">Recipe</button>
    </div>

    <div class="card">
        <div class="type">
            <p>DINNER</p>
        </div>
        <div class="imgBx">
            <img src="https://static.wixstatic.com/media/e4747b_83c86f876daf4600b3cc204a42481912~mv2.jpeg/v1/fill/w_1280,h_960,al_c/e4747b_83c86f876daf4600b3cc204a42481912~mv2.jpeg" />
        </div>
        <h2 class="title_pf">Laksa Sarawak <br /><span></span></h2>
        <button class="btn-more">Recipe</button>
    </div>
        </div>