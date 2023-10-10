<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="showdeco.css">
    <link rel="stylesheet" type="text/css" href="main.css">
     
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
        
    <title>Recipe Detail</title>
    <style>
            
            <%@ include file="CSS/eachRecipe.css"%>
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
    <form id="downloadForm" action="Bestrecipe" method="post">
    <!-- _________________________________________________________________________________________________________________________________________________________________________________ -->
    <div class="container">
        <div class="conImage">
            <img class="photo-image" src="<c:out value='${recipe.recipeImg}'/>" alt="Recipe Photo">
            <div class="recipe-info">
                <h2 class="recipe-name"><c:out value="${recipe.recipeName}"/><br><c:out value="${recipe.recipeCal}"/> Calories</h2>
                <p class="recipe-description"><c:out value="${recipe.recipeDesc}"/></p>
            </div>
        </div>
        <div class="detail-con">
            <h1 class="namepage">RECIPE DETAIL</h1>
                    <div class="ingredient-table">
             <table>
                 <c:forEach items="${listdetailsrecipe}" var="detail" varStatus="status">
                     <tr>
                         <td><c:out value="${detail.detailsingName}" /></td>
                         <td>
                             <c:choose>
                                <c:when test="${detail.detailsQty < 1}">
                                    <c:out value="${detail.detailsQty}" />&nbsp; <c:out value="${detail.detailsingMeasure}" />
                                </c:when>
                                <c:otherwise>
                                   <fmt:formatNumber value="${detail.detailsQty}" pattern="#"/>&nbsp; <c:out value="${detail.detailsingMeasure}" />
                                </c:otherwise>
                            </c:choose>
                       
                         </td>
                       
                     </tr>
                 </c:forEach>
                 
             </table>
         </div>

         <div class="instruction-list">
             <ol>
                 <c:forEach items="${instructions}" var="instruction" varStatus="status">
                     <li><c:out value="${instruction.insDesc}" /></li>
                 </c:forEach>
             </ol>
         </div>
        <div>
              <button onclick="printFunction()" class="button" type="button">
            <span class="button__text">Download</span>
            <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 35 35" id="bdd05811-e15d-428c-bb53-8661459f9307" data-name="Layer 2" class="svg"><path d="M17.5,22.131a1.249,1.249,0,0,1-1.25-1.25V2.187a1.25,1.25,0,0,1,2.5,0V20.881A1.25,1.25,0,0,1,17.5,22.131Z"></path>
                <path d="M17.5,22.693a3.189,3.189,0,0,1-2.262-.936L8.487,15.006a1.249,1.249,0,0,1,1.767-1.767l6.751,6.751a.7.7,0,0,0,.99,0l6.751-6.751a1.25,1.25,0,0,1,1.768,1.767l-6.752,6.751A3.191,3.191,0,0,1,17.5,22.693Z"></path>
                <path d="M31.436,34.063H3.564A3.318,3.318,0,0,1,.25,30.749V22.011a1.25,1.25,0,0,1,2.5,0v8.738a.815.815,0,0,0,.814.814H31.436a.815.815,0,0,0,.814-.814V22.011a1.25,1.25,0,1,1,2.5,0v8.738A3.318,3.318,0,0,1,31.436,34.063Z"></path></svg></span>
            </button>
            

    <script>
      function printFunction() { 
        window.print(); 
      }
    </script>
           

    
        </div>
    </div>
              </form>
</body>
</html>
