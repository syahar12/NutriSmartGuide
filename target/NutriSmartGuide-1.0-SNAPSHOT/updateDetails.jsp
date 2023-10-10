<%-- 
    Document   : insertDetails
    Created on : 19 Jun 2023, 9:01:56 pm
    Author     : irfan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/add.css" />
        <title>New Record</title>
        <style>
            <%@ include file="CSS/insertDetails.css"%>
        </style>
    </head>
    <body>
        <br/>
        <div class="header">
            <h1><b>NEW INGREDIENT</b></h1>
        </div>
        <a class="button-add" href="javascript:history.back()">RECIPE INGREDIENTS</a>
        <div class="form-container">
            <form action="updatedetails" method="post">
                <input type="hidden" name="detailsrecipeId" value="<c:out value='${details.detailsrecipeId}' />" />
                <input type="hidden" name="detailsingId" value="<c:out value='${details.detailsingId}' />" />
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Recipe&emsp;&emsp;&emsp;&emsp;</td>
                            <td>
                                <input type="text" value="${details.detailsrecipeName}" size="35" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>Ingredient&nbsp;&nbsp;</td>
                            <td>
                                <input type="text" value="${details.detailsingName}" size="35" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>Quantity&emsp;&emsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="text" name="detailsQty" size="10" required></td>
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