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
  <link href='https://unpkg.com/css.gg@2.0.0/icons/css/profile.css' rel='stylesheet'>
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
      </div>
  <!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
  <div class="top">
    <div>
      <h1 class="Title">UNVEILING THE WORLD OF LOW-CALORIE COOKING</h1>
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
  
  <div class="recipe-box">
    <% 
    String searchRecipe = request.getParameter("searchRecipe");
    if (searchRecipe != null) {
      try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/NutriSmartGuide", "root", "");
        
        // Use a prepared statement to prevent SQL injection
        String sqlQuery = "SELECT * FROM recipe WHERE LOWER(recipeName) LIKE ?";
        PreparedStatement statement = conn.prepareStatement(sqlQuery);
        statement.setString(1, "%" + searchRecipe.toLowerCase() + "%");
        
        // Execute the SQL query
        ResultSet resultSet = statement.executeQuery();
        
        // Loop through the result set and display recipe details
        boolean found = false;
        while (resultSet.next()) {
          found = true;
          String recipeName = resultSet.getString("recipeName");
          String recipeDesc = resultSet.getString("recipeDesc");
          String recipeId = String.valueOf(resultSet.getInt("recipeId"));
    %>
    <div class="recipe">
      <div class="recipe-image">
        <img src="<%= resultSet.getString("recipeImg") %>" alt="<%=recipeName%>" />
      </div>
      <div class="recipe-details">
        <h2><%= recipeName %></h2>
        <p><%= recipeDesc %></p>
        <a class="button" href="showDetailOnceRecipe?recipeId=<%= recipeId %>">Find out more</a>

      
      </div>
    </div>
    <% 
        }
        
        // If no recipes were found, display a message using JavaScript alert
        if (!found) {
    %>
    <script>
      alert("Sorry, there are no matching recipes.");
    </script>
    <%
        }
        
        // Close database resources
        resultSet.close();
        statement.close();
        conn.close();
      } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
      }
    }
    %>
  </div>
</body>
</html>
