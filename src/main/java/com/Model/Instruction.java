/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author 60107
 */
public class Instruction {
    private int insId;
    private String insDesc;
    private int recipeId;
    private String recipeName;

    public Instruction(int insId, String insDesc, int recipeId) {
        this.insId = insId;
        this.insDesc = insDesc;
        this.recipeId = recipeId;
    }

    public Instruction(int insId, String insDesc, int recipeId, String recipeName) {
        this.insId = insId;
        this.insDesc = insDesc;
        this.recipeId = recipeId;
        this.recipeName = recipeName;
    }
    

    public Instruction(String insDesc, int recipeId) {
        this.insDesc = insDesc;
        this.recipeId = recipeId;
    }

    public int getInsId() {
        return insId;
    }

    public void setInsId(int insId) {
        this.insId = insId;
    }

    public String getInsDesc() {
        return insDesc;
    }

    public void setInsDesc(String insDesc) {
        this.insDesc = insDesc;
    }

    public int getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }
    
    
    

    
}
