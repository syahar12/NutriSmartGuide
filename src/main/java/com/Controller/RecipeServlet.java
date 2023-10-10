package com.Controller;

import com.DAO.recipeDAO;
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

@WebServlet("/RecipeServlet")
public class RecipeServlet extends HttpServlet {
    private recipeDAO recipeDAO ;

    @Override
    public void init() {
        recipeDAO = new recipeDAO();
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
                case "/RecipeServlet":
                    listRecipe(request, response);
                    break;
                case "/newrecipe":
                    showNewForm(request, response);
                    break;
                case "/insertrecipe":
                    insertRecipe(request, response);
                    break;
                case "/deleterecipe":
                    deleteRecipe(request, response);
                    break;
                case "/editrecipe":
                    showEditForm(request, response);
                    break;
                case "/updaterecipe":
                    updateRecipe(request, response);
                    break;
                case "/recipetype":
                    typeRecipe(request, response);
                    break;
                 case "/recipebest":
                    bestRecipe(request, response);
                    break;
                  case "/userbest":
                    showDetailBestRecipe(request, response);
                    break;
                
                
                default:
                    listRecipe(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listRecipe(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Recipe> listRecipe = recipeDAO.selectAllRecipe();
        getServletContext().setAttribute("listRecipe", listRecipe);
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/recipeList.jsp");
        dispatcher.forward(request, response);
    }
    

    private void typeRecipe(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String recipeType = request.getParameter("type");
        List<Recipe> listRecipe = recipeDAO.selectAllRecipeByType(recipeType);  
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/recipeTypeList.jsp");
        request.setAttribute("recipetype", listRecipe);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/recipeForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));
        ServletContext sc = getServletContext();
        Recipe existingRecipe = recipeDAO.selectRecipe(recipeId);
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/recipeForm.jsp");
        request.setAttribute("recipe", existingRecipe);
        dispatcher.forward(request, response);
    }

    private void insertRecipe(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String recipeName = request.getParameter("recipeName");
        String recipeImg = request.getParameter("recipeImg");
        String recipeType = request.getParameter("recipeType");
        String recipeDesc = request.getParameter("recipeDesc");
        Recipe newRecipe = new Recipe(recipeName, recipeImg, recipeType, recipeDesc);
        recipeDAO.insertRecipe(newRecipe);
        response.sendRedirect("listrecipe");
    }

    private void updateRecipe(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));
        String recipeName = request.getParameter("recipeName");
        String recipeImg = request.getParameter("recipeImg");
        String recipeType = request.getParameter("recipeType");
        String recipeDesc = request.getParameter("recipeDesc");
        Recipe recipe = new Recipe(recipeId, recipeName, recipeImg, recipeType, recipeDesc);
        recipeDAO.updateRecipe(recipe);
        response.sendRedirect("listrecipe");
    }

    private void deleteRecipe(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));
        recipeDAO.deleteRecipe(recipeId);
        response.sendRedirect("listrecipe");
    }
    private void bestRecipe(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {
    List<Recipe> listRecipe = recipeDAO.selectBestRecipe();
    getServletContext().setAttribute("recipeBest", listRecipe);
    ServletContext sc = getServletContext();
    RequestDispatcher dispatcher = sc.getRequestDispatcher("/bestreceipelist.jsp");
    dispatcher.forward(request, response);
    }
    private void showDetailBestRecipe(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
    List<Recipe> listRecipe = recipeDAO.selectBestRecipe();
    request.setAttribute("recipeBest", listRecipe);
    ServletContext sc = getServletContext();
    RequestDispatcher dispatcher = sc.getRequestDispatcher("/showbest.jsp");
    dispatcher.forward(request, response);
    
    }
    

   

    
}
