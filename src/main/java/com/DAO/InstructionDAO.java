/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.Instruction;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InstructionDAO {
    
    private final String jdbcURL="jdbc:mysql://localhost:3306/NutriSmartGuide";
    private final String username="root";
    private final String password="";
    
     private static final String INSERT_INSTRUCTION="INSERT INTO instruction (insDesc,recipeId) VALUES (?,?)";
   private static final String SELECT_ALL_INSTRUCTION = "SELECT insId, insDesc, instruction.recipeId, recipe.recipeName FROM instruction JOIN recipe ON instruction.recipeId = recipe.recipeId";
    private static final String SELECT_INSTRUCTION_BY_INSTRUCTION="SELECT * FROM instruction WHERE insId=?;";
    private static final String SELECT_INSTRUCTION_BY_RECIPEID = "SELECT insId, insDesc, instruction.recipeId, recipe.recipeName FROM instruction JOIN recipe ON instruction.recipeId = recipe.recipeId WHERE instruction.recipeId = ?";
    private static final String UPDATE_INSTRUCTION="UPDATE instruction SET insDesc=?,recipeId=?  WHERE insId=?;";
    private static final String DELETE_INSTRUCTION="DELETE FROM instruction WHERE insId=?;";
    
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
     public void addInstruction(Instruction instruction ) throws SQLException{
        try{
            Connection connection=getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement(INSERT_INSTRUCTION);
            preparedStatement.setString(1,instruction.getInsDesc());
            preparedStatement.setInt(2,instruction.getRecipeId());
            preparedStatement.executeUpdate();    
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    public boolean deleteInstruction(int insId) throws SQLException{
        boolean recordDeleted;
        try(Connection connection=getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement(DELETE_INSTRUCTION)){ 
           preparedStatement.setInt(1,insId);
           recordDeleted=preparedStatement.executeUpdate()>0;          
        }
         
        return recordDeleted;
    } 
    public boolean updateIngredient(Instruction instruction){
        boolean recordUpdated=false;
        try(Connection connection=getConnection()){
            PreparedStatement preparedStatement= connection.prepareStatement(UPDATE_INSTRUCTION);            
            preparedStatement.setString(1,instruction.getInsDesc());
            preparedStatement.setInt(2,instruction.getRecipeId());
            preparedStatement.setInt(3,instruction.getInsId());
            recordUpdated=preparedStatement.executeUpdate()>0;
        }
         catch(SQLException e){
            e.printStackTrace();
        }
         return recordUpdated;
    }
    public List<Instruction> selectAllInstruction() {
    List<Instruction> instructions = new ArrayList<>();
    try {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_INSTRUCTION);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            int insId = rs.getInt("insId");
            String insDesc = rs.getString("insDesc");
            int recipeId = rs.getInt("recipeId");
            String recipeName = rs.getString("recipeName");
            instructions.add(new Instruction(insId, insDesc, recipeId, recipeName));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return instructions;
    }
    
    public Instruction getInstructionById(int insID){
        Instruction instruction=null;
        try(Connection connection=getConnection()){
           PreparedStatement preparedStatement= connection.prepareStatement(SELECT_INSTRUCTION_BY_INSTRUCTION);
           preparedStatement.setInt(1,insID);
           ResultSet rs= preparedStatement.executeQuery();
           
           while(rs.next()){
                int insId=rs.getInt("insId");
                 String insDesc=rs.getString("insDesc");
                int recipeId=rs.getInt("recipeId");
                instruction=new Instruction(insId,insDesc,recipeId);          
           }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return instruction;
    } 
   public List<Instruction> getInstructionByRecipeId(int recipeId) {
    List<Instruction> instructions = new ArrayList<>();
    try {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_INSTRUCTION_BY_RECIPEID);
        preparedStatement.setInt(1, recipeId); // Set the recipe ID in the prepared statement
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            int insId = rs.getInt("insId");
            String insDesc = rs.getString("insDesc");
            // No need to retrieve recipeId and recipeName here, as they are already provided as parameters
            instructions.add(new Instruction(insId, insDesc, recipeId));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return instructions;
}

}

    

    

