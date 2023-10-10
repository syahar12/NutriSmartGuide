
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/add.css" />
        <style>
            <%@ include file="CSS/editIngredient.css"%>
       </style>
        <title>Edit Ingredient</title>
    </head>
    <body>
        <br/>
        <div class="header">
            <h1><b>EDIT INGREDIENT</b></h1>
        </div>
        <div class="form-container">
        <form name="frmAddIngredient" action="update" method="POST">
        <table border="0">
            <tbody>
            <tr>
            <td class="requireForm">Ingredient ID &nbsp;&nbsp;:</td>
                <td><input type="text" class="form-edit" name="ingId"  value="<c:out value='${ingredient.ingId}' />" size="40" readonly="readonly"></td>   
            </tr>
            <tr>
                <td class="requireForm">Name&emsp;&emsp;&emsp;&emsp;:</td>
                <td><input type="text" class="form-edit" name="ingName" value="<c:out value='${ingredient.ingName}' />" size="40" required></td>   
            </tr>
            <tr>
                <td class="requireForm">Measurement&nbsp;&nbsp;:</td>
                <td><input type="text" class="form-edit" name="ingMeasure"value="<c:out value='${ingredient.ingMeasure}' />" size="25" required></td>
            </tr>
            
            <tr>
                <td class="requireForm">Calories&emsp;&emsp;&nbsp;&nbsp;&nbsp;:</td>
                <td><input type="text" class="form-edit" name="ingCal" value="<c:out value='${ingredient.ingCal}' />" size="15" required> cal</td>
            </tr>
            <tr>
                <td >
                <div class="button-container">
                    <input class="button" type="submit" value="Submit" name="SUBMIT"/>
                </div>
                </td>
            </tr>
            </tbody>
        </table>
        </form>
    </div>
    </body>
</html>

