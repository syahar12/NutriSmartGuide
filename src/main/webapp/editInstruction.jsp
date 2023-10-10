<%-- 
    Document   : showInstruction
    Created on : 16 Jun 2023, 1:27:59 pm
    Author     : 60107
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Record</title>
        <style>
            <%@ include file="CSS/addInstruction.css"%>
            <%@ include file="CSS/editInstruction.css"%>
       </style>
        
    </head>
    <body>
        <br/>
        <div class="header">
            <h1><b>EDIT INSTRUCTION</b></h1>
        </div>
         <form name="frmEditInstruction" action="updateInstruction" method="POST">
        <div class="form-container">
            <div class="box-orange">
                <h2>Instruction Details</h2>
                <div class="instruction-container">
                    <div class="form-group">
                        <label for="insId">Instruction ID:</label>
                        <input type="text" name="insId" value="${instruction.insId}" readonly size="25" required>
                    </div>
                </div>
                <div class="form-group">
                        <label for="insDesc">Instruction:</label>
                        <textarea name="insDesc" rows="6" cols="50" required>${instruction.insDesc}</textarea>
                </div>
                <div class="form-group">
                         <label for="recipeIdId">Recipe ID:</label>
                         <input type="text" name="recipeIdId" value="${instruction.recipeId}" readonly="" size="25" required>
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
            </div>
            <div class="button-container">
                <input class="button" type="submit" value="Submit" name="SUBMIT"/>
            </div>
        </div>
         </form>
    </body>
</html>
