/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller;



import com.DAO.InstructionDAO;
import com.DAO.recipeDAO;
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



@WebServlet("/InstructionServlet")
public class InstructionServlet extends HttpServlet {
      private InstructionDAO InstructionDAO;
      private recipeDAO RecipeDAO;
    
    @Override
    public void init(){
            InstructionDAO=new InstructionDAO();
            RecipeDAO=new recipeDAO();
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
            case"/InstructionServlet":
            case "/newInstruction":
                displayNewInstructionForm(request,response);
                break;
            case "/editInstruction":
                displayEditInstructionForm(request,response);
                break;
            case "/insertInstruction":
                createInstruction(request,response);
                break;
            case "/updateInstruction":
                updateInstruction(request,response);
                break;
            case "/deleteInstruction":
                deleteInstruction(request,response);
                break;
            case "/listInstructionRetrieve":
                retrieveInstruction(request,response);
            break;
            case "/showInstruction":
                showInstruction(request,response);
            break;
            default:
                retrieveInstruction(request,response);
                break;
        }
        }catch(SQLException ex){
                throw new ServletException(ex);
        }
    }
    private void retrieveInstruction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Instruction> listInstruction=InstructionDAO.selectAllInstruction();
        
        request.setAttribute("instructions", listInstruction);
        ServletContext sc=getServletContext();
        RequestDispatcher dispatcher=sc.getRequestDispatcher("/listInstruction.jsp");
        dispatcher.forward(request, response);   
    }
    private void displayNewInstructionForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext sc=getServletContext();
        RequestDispatcher dispatcher=sc.getRequestDispatcher("/addInstruction.jsp");
        dispatcher.forward(request, response);
    }
    
     private void displayEditInstructionForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int insId = Integer.parseInt(request.getParameter("id"));
        Instruction currentInstruction = InstructionDAO.getInstructionById(insId);
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/editInstruction.jsp");
        request.setAttribute("instruction", currentInstruction);
        dispatcher.forward(request, response);
    }
     
     private void createInstruction(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException {
        String insDesc=request.getParameter("insDesc");
        int recipeId=Integer.parseInt(request.getParameter("recipeId"));
        Instruction newInstruction=new Instruction(insDesc,recipeId);
        InstructionDAO.addInstruction(newInstruction);
       response.sendRedirect("listInstructionRetrieve");

    }
     
     private void updateInstruction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int insId=Integer.parseInt(request.getParameter("insId"));
        String insDesc=request.getParameter("insDesc");
        int recipeId=Integer.parseInt(request.getParameter("recipeId"));
        Instruction instruction=new Instruction(insId,insDesc,recipeId);
        InstructionDAO.updateIngredient(instruction);
        response.sendRedirect("listInstructionRetrieve");
         
     }
     private void deleteInstruction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,SQLException {
         int insId=Integer.parseInt(request.getParameter("id"));
         InstructionDAO.deleteInstruction(insId);
         response.sendRedirect("listInstructionRetrieve");  
    }

    
    private void showInstruction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int insId = Integer.parseInt(request.getParameter("id"));
      int recipeId = Integer.parseInt(request.getParameter("recipeId"));
        Instruction currentInstruction = InstructionDAO.getInstructionById(insId);
        Recipe currentRecipe = RecipeDAO.selectRecipe(recipeId);
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/showInstruction.jsp");
        request.setAttribute("instruction", currentInstruction);
        request.setAttribute("recipe", currentRecipe);
        dispatcher.forward(request, response);
    }
    
}



