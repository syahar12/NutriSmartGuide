/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller;

import com.DAO.InstructionDAO;
import com.DAO.RecipeDetailsDAO;
import com.DAO.recipeDAO;
import com.Model.Details;
import com.Model.Instruction;
import com.Model.Recipe;

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

/**
 *
 * @author 60107
 */
@WebServlet("/RecipeDetailsServlet")
public class RecipeDetailsServlet extends HttpServlet {

     private RecipeDetailsDAO RecipeDetailsDAO ;
    private InstructionDAO InstructionDAO;
    private recipeDAO recipeDAO ;
    

    public void init(){
            RecipeDetailsDAO=new RecipeDetailsDAO();
            recipeDAO=new recipeDAO();
            InstructionDAO=new InstructionDAO();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/RecipeDetailsServlet":
                case "/newdetails":
                    showNewDetails(request, response);
                    break;
                case "/insertdetails":
                    insertDetails(request, response);
                    break;
                case "/deletedetails":
                    deleteDetails(request, response);
                    break;
                case "/editdetails":
                    showEditDetails(request, response);
                    break;
                case "/updatedetails":
                    updateDetails(request, response);
                    break;
                case "/viewdetails":
                    listDetails(request, response);
                    break;
                case "/showDetailOnceRecipe":
                    showDetailOneRecipe(request, response);
                    break;
                default:
                    listDetails(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listDetails(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int detailsrecipeId = Integer.parseInt(request.getParameter("detailsrecipeId"));
        request.setAttribute("detailsrecipeId", detailsrecipeId);
        List<Details> listDetails = RecipeDetailsDAO.selectAllDetails(detailsrecipeId);
        request.setAttribute("listDetails", listDetails);
        RequestDispatcher dispatcher = request.getRequestDispatcher("detailsList.jsp");
        dispatcher.forward(request, response);

    }

    private void showNewDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int detailsrecipeId = Integer.parseInt(request.getParameter("detailsrecipeId"));
        Recipe existingDetails = recipeDAO.selectRecipeName(detailsrecipeId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("insertDetails.jsp");
        request.setAttribute("details", existingDetails);
        request.setAttribute("detailsrecipeId", detailsrecipeId);
        dispatcher.forward(request, response);
    }

    private void showEditDetails(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int detailsrecipeId = Integer.parseInt(request.getParameter("detailsrecipeId"));
        Details existingDetails = RecipeDetailsDAO.selectDetails(detailsrecipeId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateDetails.jsp");
        request.setAttribute("details", existingDetails);
        dispatcher.forward(request, response);
    }

    private void insertDetails(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int detailsrecipeId = Integer.parseInt(request.getParameter("detailsrecipeId"));
        recipeDAO.selectRecipe(detailsrecipeId);
        int detailsingId = Integer.parseInt(request.getParameter("detailsingId"));
        double detailsQty = Double.parseDouble(request.getParameter("detailsQty"));
        Details newDetails = new Details(detailsrecipeId, detailsingId, detailsQty);
        RecipeDetailsDAO.insertDetails(newDetails);
        updaterecipecal(request, response);
    }

    private void updateDetails(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int detailsrecipeId = Integer.parseInt(request.getParameter("detailsrecipeId"));
        int detailsingId = Integer.parseInt(request.getParameter("detailsingId"));
        double detailsQty = Double.parseDouble(request.getParameter("detailsQty"));
        Details newDetails = new Details(detailsrecipeId, detailsingId, detailsQty);
        RecipeDetailsDAO.updateDetails(newDetails);
        updaterecipecal(request, response);
    }

    private void deleteDetails(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int detailsrecipeId = Integer.parseInt(request.getParameter("detailsrecipeId"));
        int detailsingId = Integer.parseInt(request.getParameter("detailsingId"));
        double detailsQty = Double.parseDouble(request.getParameter("detailsQty"));
        Details deleteDetails = new Details(detailsrecipeId, detailsingId, detailsQty);
        RecipeDetailsDAO.deleteDetails(deleteDetails);
        updaterecipecal(request, response);
    }

    private void updaterecipecal(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int recipeId = Integer.parseInt(request.getParameter("detailsrecipeId"));
        RecipeDetailsDAO.addRecipeCalorie(recipeId);
        response.sendRedirect("viewdetails?detailsrecipeId=" + recipeId);
    }
  
   private void showDetailOneRecipe(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
    int recipeId = Integer.parseInt(request.getParameter("recipeId"));
    List<Instruction> listInstruction =InstructionDAO.getInstructionByRecipeId(recipeId); // Call getInstructionByRecipeId
    List<Details> listdetail=RecipeDetailsDAO.getAllDetailsByRecipeId(recipeId);
    Recipe existingRecipe = recipeDAO.selectRecipe(recipeId);
    ServletContext sc = getServletContext();
    RequestDispatcher dispatcher = sc.getRequestDispatcher("/eachRecipe.jsp");
    request.setAttribute("instructions", listInstruction);
    request.setAttribute("listdetailsrecipe", listdetail);
    request.setAttribute("recipe", existingRecipe);
    dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}