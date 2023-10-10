<%-- 
    Document   : addIngredient
    Created on : 3 Jun 2023, 3:58:19 pm
    Author     : 60107
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <style>
            <%@ include file="CSS/add.css"%>
       </style>
        <title>New Record</title>
    </head>
    <body>
        <br/>
        <div class="header">
            <h1><b>NEW INGREDIENT</b></h1>
        </div>
        <a class="button-add" href="javascript:history.back()">INGREDIENT LIST</a>
        <div class="form-container">
            <form name="frmAddIngredient" action="insert" method="POST">
        <table border="0">
            <tbody>
            <tr>
                <td>Name*&emsp;&emsp;&emsp;&emsp;:</td>
                <td><input type="text" name="ingName" value="" size="40" required></td>   
            </tr>
            <tr>
                <td>Measurement*&nbsp;&nbsp;:</td>
                <td><input type="text" name="ingMeasure" value="" size="25" required></td>
            </tr>
            <tr>
                <td>Calories*&emsp;&emsp;&nbsp;&nbsp;&nbsp;:</td>
                <td><input type="text" name="ingCal" value="" size="15" required>cal</td>
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
