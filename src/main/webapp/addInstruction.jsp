<%-- 
    Document   : addInstruction
    Created on : 16 Jun 2023, 9:17:30 am
    Author     : 60107
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="ins.css" />
    <title>New Instruction</title>
</head>
        <style>
            <%@ include file="CSS/addInstruction.css"%>
       </style>
       <body>
    <br/>
    <div class="header">
        <h1><b>NEW INSTRUCTION</b></h1>
    </div>
    <div class="form-container">
        <form name="frmAddUser" action="insertInstruction" method="POST">
            <div class="form-group">
                <label for="insDesc">Instruction:</label>
                <textarea name="insDesc" rows="6" cols="50" required></textarea>
            </div>
            <div class="form-group">
                <label for="recipeId">Recipe Name*&emsp;:</label>
                <select id="recipeId" name="recipeId" required>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/NutriSmartGuide", "root", "");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT recipeId,recipeName FROM recipe");

                                while (rs.next()) {
                                    int recipeId = rs.getInt("recipeId");
                                    String recipeName = rs.getString("recipeName");
                                    out.println("<option value='" + recipeId + "'>" + recipeName + "</option>");
                                }

                                rs.close();
                                stmt.close();
                                conn.close();
                            %>
                        </select>
            </div>
            <input type="hidden" name="action" value="insertInstruction">
            <div class="button-container">
                <input class="button" type="submit" value="Submit" name="SUBMIT"/>
                <input class="button" type="reset" value="Cancel" name="CANCEL"/>
            </div>
        </form>
    </div>
</body>
</html>
  