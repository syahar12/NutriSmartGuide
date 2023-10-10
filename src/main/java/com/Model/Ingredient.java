/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author 60107
 */
public class Ingredient {
    private int ingId;
    private String ingName;
    private String ingMeasure;
    private int ingCal;

    public Ingredient(int ingId, String ingName, String ingMeasure,  int ingCal) {
        this.ingId = ingId;
        this.ingName = ingName;
        this.ingMeasure = ingMeasure;
        this.ingCal = ingCal;
    }

    public Ingredient(String ingName, String ingMeasure , int ingCal) {
        this.ingName = ingName;
        this.ingMeasure = ingMeasure;
        this.ingCal = ingCal;
    }

    

    public int getIngId() {
        return ingId;
    }

    public void setIngId(int ingId) {
        this.ingId = ingId;
    }

    public String getIngName() {
        return ingName;
    }

    public void setIngName(String ingName) {
        this.ingName = ingName;
    }

    public String getIngMeasure() {
        return ingMeasure;
    }



    public int getIngCal() {
        return ingCal;
    }

    public void setIngCal(int ingCal) {
        this.ingCal = ingCal;
    }

    
    
    
    
    
}
