/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.Recipe;
import com.Model.Details;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecipeDetailsDAO {
    private final String jdbcURL="jdbc:mysql://localhost:3306/NutriSmartGuide";
    private final String username="root";
    private final String password="";
    
    private static final String INSERT_DETAILS
            = "INSERT INTO recipedetails (recipeId, ingId, detailsQty) VALUES (?, ?, ?);";
    private static final String SELECT_ALL_DETAILS
            = "SELECT recipe.recipeName, ingredient.ingId, ingredient.ingName, ingredient.ingMeasure, recipedetails.detailsQty, ingredient.ingCal * recipedetails.detailsQty AS totalCal "
            + "FROM recipe JOIN recipedetails ON recipe.recipeId = recipedetails.recipeId "
            + "JOIN ingredient ON recipedetails.ingId = ingredient.ingId "
            + "WHERE recipe.recipeId = ?;";
    private static final String DELETE_DETAILS
            = "DELETE FROM recipedetails where recipeId = ? AND ingId = ? AND detailsQty = ? LIMIT 1;";
    private static final String UPDATE_DETAILS
            = "UPDATE recipedetails SET recipeId = ?, ingId = ?,detailsQty = ? "
            + "WHERE recipeId = ? and ingId = ? LIMIT 1;";
    private static final String ADD_RECIPE_CALORIE
            = "UPDATE recipe\n"
            + "SET recipeCal = (\n"
            + "SELECT SUM(ingredient.ingCal * recipedetails.detailsQty)\n"
            + "FROM recipedetails\n"
            + "JOIN ingredient ON recipedetails.ingId = ingredient.ingId\n"
            + "WHERE recipedetails.recipeId = ?\n"
            + ")\n"
            + "WHERE recipeId = ?;";
    private static final String SELECT_ONE_RECIPE=
           "SELECT recipe.recipeName, ingredient.ingId, ingredient.ingName, ingredient.ingMeasure, recipedetails.detailsQty, ingredient.ingCal * recipedetails.detailsQty AS totalCal "
            + "FROM recipe JOIN recipedetails ON recipe.recipeId = recipedetails.recipeId "
            + "JOIN ingredient ON recipedetails.ingId = ingredient.ingId "
            + "WHERE recipe.recipeId = ?;";
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
   
    public  List<Details> getAllDetailsByRecipeId(int recipeId) {
    List<Details> listdetailsrecipe = new ArrayList<>();
    try {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ONE_RECIPE);
        preparedStatement.setInt(1, recipeId); // Set the recipe ID in the prepared statement
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            
            int ingId = rs.getInt("ingId");
            String ingName = rs.getString("ingName");  
            double detailsQty = rs.getDouble("detailsQty");
            String detailsingMeasure = rs.getString("ingMeasure");
            int totalCal = rs.getInt("totalCal");
            // No need to retrieve recipeId and recipeName here, as they are already provided as parameters
            listdetailsrecipe.add(new Details(ingId,ingName,detailsQty,detailsingMeasure,totalCal));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return listdetailsrecipe;
    }
    public void insertDetails(Details details) throws SQLException {
        System.out.println(INSERT_DETAILS);
        //try with resources statement will autoclose the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DETAILS)) {
            preparedStatement.setInt(1, details.getDetailsrecipeId());
            preparedStatement.setInt(2, details.getDetailsingId());
            preparedStatement.setDouble(3, details.getDetailsQty());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Details selectDetails(int detailsrecipeId) {
        Details details = null;
        //Step 1: Establishing a connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connecton object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DETAILS);) {
            preparedStatement.setInt(1, detailsrecipeId);
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object
            while (rs.next()) {
                String detailsrecipeName = rs.getString("recipeName");
                int detailsingId = rs.getInt("ingId");
                String detailsingName = rs.getString("ingName");
                String detailsingMeasure = rs.getString("ingMeasure");
                double detailsQty = rs.getDouble("detailsQty");
                int totalCal = rs.getInt("totalCal");
                details = new Details(detailsrecipeId, detailsrecipeName, detailsingId, detailsingName, detailsingMeasure, detailsQty, totalCal);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return details;
    }

    public List<Details> selectAllDetails(int detailsrecipeId) {
        List<Details> details = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DETAILS);
            preparedStatement.setInt(1, detailsrecipeId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String detailsrecipeName = rs.getString("recipeName");
                int detailsingId = rs.getInt("ingId");
                String detailsingName = rs.getString("ingName");
                String detailsingMeasure = rs.getString("ingMeasure");
                double detailsQty = rs.getDouble("detailsQty");
                int totalCal = rs.getInt("totalCal");
                details.add(new Details(detailsrecipeId, detailsrecipeName, detailsingId, detailsingName, detailsingMeasure, detailsQty, totalCal));
            }

            while (rs.next()) {
                String detailsrecipeName = rs.getString("recipeName");
                details.add(new Details(detailsrecipeId, detailsrecipeName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return details;
    }

    public boolean deleteDetails(Details details) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); //Step 2: Create a statement using connecton object
                 PreparedStatement statement = connection.prepareStatement(DELETE_DETAILS);) {
            statement.setInt(1, details.getDetailsrecipeId());
            statement.setInt(2, details.getDetailsingId());
            statement.setDouble(3, details.getDetailsQty());

            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateDetails(Details details) throws SQLException {

        boolean rowUpdated;
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement statement = connection.prepareStatement(UPDATE_DETAILS);) {
            statement.setInt(1, details.getDetailsrecipeId());
            statement.setInt(2, details.getDetailsingId());
            statement.setDouble(3, details.getDetailsQty());
            statement.setInt(4, details.getDetailsrecipeId());
            statement.setInt(5, details.getDetailsingId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
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