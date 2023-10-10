<%-- 
    Document   : showInstruction
    Created on : 16 Jun 2023, 1:27:59 pm
    Author     : 60107
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h1><b>DETAIL INSTRUCTION</b></h1>
        </div>
        <div class="form-container">
            <div class="box-orange">
                <h2>Recipe Details</h2>
                <div class="recipe-container">
                    <div class="recipe-details">
                        <div class="form-group">
                            <label for="recipeId">Recipe ID:</label>
                            <input type="text" name="recipeId" value="${recipe.recipeId}"  readonly size="25" >
                        </div>
                        <div class="form-group">
                            <label for="recipeName">Recipe Name:</label>
                            <input type="text" name="recipeName" value="${recipe.recipeName}" readonly size="25" >
                        </div>
                        <div class="form-group">
                            <label for="recipeType">Recipe Type:</label>
                            <input type="text" name="recipeType" value="${recipe.recipeType}"  readonly size="25" >
                        </div>
                        <div class="form-group">
                            <label for="recipeDescription">Recipe Description:</label>
                            <textarea name="recipeDescription" rows="6" cols="50" readonly>${recipe.recipeDesc}</textarea>
                        </div>
                    </div>
                    <div class="recipe-image">
                        <img src="${recipe.recipeImg}" alt="Recipe Image">
                    </div>
                </div>
            </div>
            <div class="box-orange">
                <h2>Instruction Details</h2>
                <div class="instruction-container">
                    <div class="form-group">
                        <label for="instructionId">Instruction ID:</label>
                        <input type="text" name="instructionId" value="${instruction.insId}" readonly size="25" required>
                    </div>
                </div>
                <div class="form-group">
                        <label for="insDesc">Instruction:</label>
                        <textarea name="insDesc" rows="6" cols="50" readonly required>${instruction.insDesc}</textarea>
                    </div>
            </div>
            <input type="hidden" name="action" value="insert">
            <div class="button-container">
                  <a  class="button" href="listInstructionRetrieve"><input class="button" type="submit" value="Submit" name="GO TO LIST"/></a>
                
            </div>
        </div>
    </body>
</html>
