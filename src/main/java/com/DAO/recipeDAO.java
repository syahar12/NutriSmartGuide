/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.Recipe;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class recipeDAO {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/NutriSmartGuide";
    private final String username = "root";
    private final String password = "";

    private static final String INSERT_RECIPE
            = "INSERT INTO recipe (recipeName, recipeImg, recipeType, recipeDesc) VALUES (?,?,?,?);";
    private static final String SELECT_RECIPE_ID
            = "SELECT * FROM recipe where recipeId = ?";    
    private static final String SELECT_RECIPENAME
            = "SELECT recipeName FROM recipe WHERE recipeId = ?";    
    private static final String SELECT_ALL_RECIPE
            = "SELECT * FROM recipe";
    private static final String SELECT_ALL_RECIPE_BYTYPE
            = "SELECT * FROM recipe WHERE recipeType=?";
    private static final String SELECT_BEST_RECIPE
            = "SELECT * FROM recipe ORDER BY recipeCal ASC";
    private static final String DELETE_RECIPE
            = "DELETE FROM recipe where recipeId = ?";
    private static final String UPDATE_RECIPE
            = "UPDATE recipe SET recipeName = ?, recipeImg = ?, recipeType = ?, recipeDesc = ? where recipeId = ?";
    private static final String ADD_RECIPE_CALORIE
            = "UPDATE recipe\n"
            + "SET recipeCal = (\n"
            + "SELECT SUM(ingredient.ingCal * recipedetails.detailsQty)\n"
            + "FROM recipedetails\n"
            + "JOIN ingredient ON recipedetails.ingId = ingredient.ingId\n"
            + "WHERE recipedetails.recipeId = ?\n"
            + ")\n"
            + "WHERE recipeId = ?;";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertRecipe(Recipe recipe) throws SQLException {
        System.out.println(INSERT_RECIPE);
        //try with resources statement will autoclose the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RECIPE)) {
            preparedStatement.setString(1, recipe.getRecipeName());
            preparedStatement.setString(2, recipe.getRecipeImg());
            preparedStatement.setString(3, recipe.getRecipeType());
            preparedStatement.setString(4, recipe.getRecipeDesc());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Recipe selectRecipeName(int recipeId){
        Recipe recipe = null;
        //Step 1: Establishing a connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connecton object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RECIPENAME);) {
            preparedStatement.setInt(1, recipeId);
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            //Step 4: Process the ResultSet object
            while (rs.next()) {
                String recipeName = rs.getString("recipeName");
                recipe = new Recipe(recipeId, recipeName);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return recipe;
    }
    public Recipe selectRecipe(int recipeId) {
        Recipe recipe = null;
        //Step 1: Establishing a connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connecton object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RECIPE_ID);) {
            preparedStatement.setInt(1, recipeId);
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object
            while (rs.next()) {
                String recipeName = rs.getString("recipeName");
                String recipeImg = rs.getString("recipeImg");
                int recipeCal = rs.getInt("recipeCal");
                String recipeType = rs.getString("recipeType");
                String recipeDesc = rs.getString("recipeDesc");
                recipe = new Recipe(recipeId, recipeName, recipeImg, recipeCal, recipeType, recipeDesc);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return recipe;
    }

    public List<Recipe> selectAllRecipe() {
        //using try-with-resources to avoid closing resurces(boiler plate code)
        List<Recipe> recipe = new ArrayList<>();
        //Step 1: Establishing a connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connecton object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RECIPE);) {
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: process the resultset object
            while (rs.next()) {
                int recipeId = rs.getInt("recipeId");
                String recipeName = rs.getString("recipeName");
                String recipeImg = rs.getString("recipeImg");
                int recipeCal = rs.getInt("recipeCal");
                String recipeType = rs.getString("recipeType");
                String recipeDesc = rs.getString("recipeDesc");
                recipe.add(new Recipe(recipeId, recipeName, recipeImg, recipeCal, recipeType, recipeDesc));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return recipe;
    }

    public boolean deleteRecipe(int recipeId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); //Step 2: Create a statement using connecton object
                 PreparedStatement statement = connection.prepareStatement(DELETE_RECIPE);) {
            statement.setInt(1, recipeId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateRecipe(Recipe recipe) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); //Step 2: Create a statement using connecton object
                 PreparedStatement statement = connection.prepareStatement(UPDATE_RECIPE);) {
            statement.setString(1, recipe.getRecipeName());
            statement.setString(2, recipe.getRecipeImg());
            statement.setString(3, recipe.getRecipeType());
            statement.setString(4, recipe.getRecipeDesc());
            statement.setInt(5, recipe.getRecipeId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    } 
     public List<Recipe> selectBestRecipe() {
    List<Recipe> recipeBest = new ArrayList<>();
    
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BEST_RECIPE)) {
        System.out.println(preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();

        while (rs.next()) {
            int recipeId = rs.getInt("recipeId");
            String recipeName = rs.getString("recipeName");
            String recipeImg = rs.getString("recipeImg");
            int recipeCal = rs.getInt("recipeCal");
            String recipeType = rs.getString("recipeType");
            String recipeDesc = rs.getString("recipeDesc");
            recipeBest.add(new Recipe(recipeId, recipeName, recipeImg, recipeCal, recipeType, recipeDesc));
        }
    } catch (SQLException e) {
        printSQLException(e);
    }
    
    return recipeBest;
}
     public boolean addRecipeCalorie(int recipeId) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); //Step 2: Create a statement using connecton object
                 PreparedStatement statement = connection.prepareStatement(ADD_RECIPE_CALORIE);) {
            statement.setInt(1, recipeId);
            statement.setInt(2, recipeId);

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
     public List<Recipe> selectAllRecipeByType(String recipeType) {
        //using try-with-resources to avoid closing resurces(boiler plate code)
        List<Recipe> recipetype = new ArrayList<>();
        //Step 1: Establishing a connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connecton object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RECIPE_BYTYPE);) {
            preparedStatement.setString(1, recipeType); // Set the recipe ID in the prepared statement
            ResultSet rs = preparedStatement.executeQuery();
     

            //Step 4: process the resultset object
            while (rs.next()) {
                int recipeId = rs.getInt("recipeId");
                String recipeName = rs.getString("recipeName");
                String recipeImg = rs.getString("recipeImg");
                int recipeCal = rs.getInt("recipeCal");
                String RecipeType = rs.getString("recipeType");
                String recipeDesc = rs.getString("recipeDesc");
                recipetype.add(new Recipe(recipeId, recipeName, recipeImg, recipeCal, RecipeType, recipeDesc));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return recipetype;
    }



    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
