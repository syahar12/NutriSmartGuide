/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller;

import com.DAO.ingredientDAO;
import com.Model.Ingredient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.SQLException;
import java.util.List;




@WebServlet("/IngredientServlet")
public class IngredientServlet extends HttpServlet {
    
    private ingredientDAO IngredientDAO;
    
    @Override
    public void init(){
            IngredientDAO=new ingredientDAO();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action=request.getServletPath();
        try{   
        switch(action){
            case"/IngredientServlet":
            case "/new":
                displayNewIngredientForm(request,response);
                break;
            case "/edit":
                displayEditIngredientForm(request,response);
                break;
            case "/insert":
                createIngredient(request,response);
                break;
            case "/update":
                updateIngredient(request,response);
                break;
            case "/delete":
                deleteIngredient(request,response);
                break;
            case "/list":
                retrieveIngredient(request,response);
            break;
            default:
                retrieveIngredient(request,response);
                break;
        }
        }catch(SQLException ex){
                throw new ServletException(ex);
        }
    }
    private void retrieveIngredient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Ingredient> listIngredient=IngredientDAO.selectAllIngredient();
        getServletContext().setAttribute("ingredients", listIngredient);
        ServletContext sc=getServletContext();
        RequestDispatcher dispatcher=sc.getRequestDispatcher("/listIngredient.jsp");
        dispatcher.forward(request, response);
 
    }
    private void displayNewIngredientForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext sc=getServletContext();
        RequestDispatcher dispatcher=sc.getRequestDispatcher("/addIngredient.jsp");
        dispatcher.forward(request, response);
    }
    
     private void displayEditIngredientForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ingId=Integer.parseInt(request.getParameter("id"));
        Ingredient currentIngredient= IngredientDAO.getIngredientById(ingId);
        ServletContext sc=getServletContext();
        RequestDispatcher dispatcher=sc.getRequestDispatcher("/editIngredient.jsp");
        request.setAttribute("ingredient", currentIngredient);
        dispatcher.forward(request, response);
    }
     
     private void createIngredient(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException {
        String ingName=request.getParameter("ingName");
        String ingMeasure=request.getParameter("ingMeasure");
        String ingQty=request.getParameter("ingQty");
        int ingCal=Integer.parseInt(request.getParameter("ingCal"));
        Ingredient newingredient=new Ingredient(ingName,ingMeasure,ingCal);
        IngredientDAO.addIngredient(newingredient);
         response.sendRedirect("list");
    }
     
     private void updateIngredient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int ingId=Integer.parseInt(request.getParameter("ingId"));
        String ingName=request.getParameter("ingName");
        String ingMeasure=request.getParameter("ingMeasure");
        String ingQty=request.getParameter("ingQty");
        int ingCal=Integer.parseInt(request.getParameter("ingCal"));
        
        Ingredient ingredient=new Ingredient(ingId,ingName,ingMeasure,ingCal);
        IngredientDAO.updateIngredient(ingredient);
         response.sendRedirect("list");
        
          
     }
     private void deleteIngredient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,SQLException {
         int ingId=Integer.parseInt(request.getParameter("id"));
         IngredientDAO.deleteIngredient(ingId);
          response.sendRedirect("list");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
