/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.Ingredient;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ingredientDAO {
    
    private final String jdbcURL="jdbc:mysql://localhost:3306/NutriSmartGuide";
    private final String username="root";
    private final String password="";
    
    private static final String INSERT_INGREDIENT="INSERT INTO ingredient (ingName,ingMeasure,ingCal) VALUES (?,?,?)";
    private static final String SELECT_ALL_INGREDIENT= "SELECT * FROM ingredient";
    private static final String SELECT_STUDENT_BY_INGREDIENT="SELECT * FROM ingredient WHERE ingId=?;";
    private static final String UPDATE_INGREDIENT="UPDATE ingredient SET ingName=?,ingMeasure=?, ingCal=?  WHERE ingId=?;";
    private static final String DELETE_INGREDIENT="DELETE FROM ingredient WHERE ingId=?;";
    
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
    
    public void addIngredient(Ingredient ingredient) throws SQLException{
        try{
            Connection connection=getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement(INSERT_INGREDIENT);
            preparedStatement.setString(1,ingredient.getIngName());
            preparedStatement.setString(2,ingredient.getIngMeasure());
            preparedStatement.setInt(3,ingredient.getIngCal());
            preparedStatement.executeUpdate();    
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    public boolean deleteIngredient(int ingId) throws SQLException{
        boolean recordDeleted;
        try(Connection connection=getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement(DELETE_INGREDIENT)){ 
           preparedStatement.setInt(1,ingId);
           recordDeleted=preparedStatement.executeUpdate()>0;          
        }
         
        return recordDeleted;
    }
    
    public boolean updateIngredient(Ingredient ingredient){
        boolean recordUpdated=false;
        try(Connection connection=getConnection()){
            PreparedStatement preparedStatement= connection.prepareStatement(UPDATE_INGREDIENT);            
            preparedStatement.setString(1,ingredient.getIngName());
            preparedStatement.setString(2,ingredient.getIngMeasure());
            preparedStatement.setInt(3,ingredient.getIngCal());
            preparedStatement.setInt(4,ingredient.getIngId());
            recordUpdated=preparedStatement.executeUpdate()>0;
        }
         catch(SQLException e){
            e.printStackTrace();
        }
         return recordUpdated;
    }
    public List<Ingredient> selectAllIngredient(){
        List<Ingredient> ingredients= new ArrayList<>();
        try{
            Connection connection=getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_INGREDIENT);
            ResultSet rs=preparedStatement.executeQuery();
            while(rs.next()){
                int ingId=rs.getInt("ingId");
                String ingName=rs.getString("ingName");
                String ingMeasure=rs.getString("ingMeasure");
                int ingCal=rs.getInt("ingCal");
                ingredients.add(new Ingredient(ingId,ingName,ingMeasure,ingCal));    
            }
        }
         catch(SQLException e){
            e.printStackTrace();
        }
        return ingredients;
    }
    
    public Ingredient getIngredientById(int ingID){
        Ingredient ingredient=null;
        try(Connection connection=getConnection()){
           PreparedStatement preparedStatement= connection.prepareStatement(SELECT_STUDENT_BY_INGREDIENT);
           preparedStatement.setInt(1,ingID);
           ResultSet rs= preparedStatement.executeQuery();
           
           while(rs.next()){
                int ingId=rs.getInt("ingId");
                String ingName=rs.getString("ingName");
                String ingMeasure=rs.getString("ingMeasure");
                int ingCal=rs.getInt("ingCal");
                ingredient=new Ingredient(ingId,ingName,ingMeasure,ingCal);              
           }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return ingredient;
    }  
}

    
