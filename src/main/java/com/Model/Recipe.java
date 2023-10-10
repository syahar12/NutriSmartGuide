package com.Model;

public class Recipe {   
    protected int recipeId;
    protected String recipeName;
    protected String recipeImg;
    protected int recipeCal;
    protected String recipeType;
    protected String recipeDesc;

    public Recipe(){}
    
    public Recipe(int recipeId, String recipeName, String recipeImg, int recipeCal, String recipeType, String recipeDesc){
        super();
        this.recipeId = recipeId;
        this.recipeName =recipeName;
        this.recipeImg = recipeImg;
        this.recipeCal = recipeCal;  
        this.recipeType = recipeType;
        this.recipeDesc = recipeDesc;
    }
    
    public Recipe(int recipeId, String recipeName, String recipeImg, String recipeType, String recipeDesc){
        super();
        this.recipeId = recipeId;
        this.recipeName =recipeName;
        this.recipeImg = recipeImg;
        this.recipeType = recipeType;
        this.recipeDesc = recipeDesc;
    }
    
    public Recipe(String recipeName, String recipeImg, String recipeType, String recipeDesc){
        super();        
        this.recipeName =recipeName;
        this.recipeImg = recipeImg;       
        this.recipeType = recipeType;
        this.recipeDesc = recipeDesc;
    }
    
    public Recipe (int recipeId, String recipeName){
        super();
        this.recipeName = recipeName;
        this.recipeId = recipeId;
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

    public String getRecipeImg() {
        return recipeImg;
    }

    public void setRecipeImg(String recipeImg) {
        this.recipeImg = recipeImg;
    }

    public int getRecipeCal() {
        return recipeCal;
    }

    public void setRecipeCal(int recipeCal) {
        this.recipeCal = recipeCal;
    }

    public String getRecipeType() {
        return recipeType;
    }

    public void setRecipeType(String recipeType) {
        this.recipeType = recipeType;
    }

    public String getRecipeDesc() {
        return recipeDesc;
    }

    public void setRecipeDesc(String recipeDesc) {
        this.recipeDesc = recipeDesc;
    }
    
    
    
}
