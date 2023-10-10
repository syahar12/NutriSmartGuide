

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/add.css" />
        <title>New Record</title>
        <style>
            <%@ include file="CSS/recipeForm.css"%>
       </style>
    </head>
    <body>
        <br/>
        <c:if test="${recipe == null}">
            <div class="header">
                <h1><b>NEW RECIPE</b></h1>
            </c:if>
            <c:if test="${recipe != null}">
                <div class="header">
                    <h1><b>EDIT RECIPE</b></h1>
                </div>
            </c:if>    
        </div>
        <a class="button-add" href="<%=request.getContextPath()%>/listrecipe">RECIPE LIST</a>
        <div class="form-container">
            <c:if test="${recipe != null}">
                <form action="updaterecipe" method="post">
                </c:if>
                <c:if test="${recipe == null}">
                    <form action="insertrecipe" method="POST">
                    </c:if>
                    <c:if test="${recipe != null}">
                        <input type="hidden" name="recipeId" value="<c:out value='${recipe.recipeId}' />" />
                    </c:if>
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>Name*&emsp;&emsp;&emsp;&emsp;</td>
                                <td><input type="text" value="<c:out value='${recipe.recipeName}' />" name="recipeName" size="35" required="required"></td>   
                            </tr>
                            <tr>
                                <td>Image*&nbsp;&nbsp;</td>
                                <td><input type="text" name="recipeImg" value="<c:out value='${recipe.recipeImg}' />" size="25" required></td>
                            </tr>
                            <tr>
                                <td>Type*&emsp;&emsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><input type="text" value="<c:out value='${recipe.recipeType}' />" size="15" readonly>
                                    <select name="recipeType">
                                        <option value="Breakfast">Breakfast</option>
                                        <option value="Lunch">Lunch</option>
                                        <option value="Dinner">Dinner</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Description*&emsp;&emsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><input type="text" name="recipeDesc" value="<c:out value='${recipe.recipeDesc}' />" size="35" required></td>
                            </tr>                            
                            <tr>
                                <td colspan="2">
                                    <div class="button-container">
                                        <input class="button" type="submit" value="Submit" name="SUBMIT"/>
                                        <input class="button" type="reset" value="Cancel" name="CANCEL"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
        </div>
    </body>
</html>