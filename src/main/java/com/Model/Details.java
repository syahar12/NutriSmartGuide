package com.Model;

public class Details {
    protected int detailsrecipeId;
    protected int detailsingId;
    protected double detailsQty;
    protected int detailsingCal;
    protected String detailsrecipeName;
    protected String detailsingName;
    protected String detailsingMeasure;
    protected int totalCal;
    
    public Details(){}
    
    public Details(int detailsrecipeId, int detailsingId, double detailsQty, int detailsingCal){
        super();
        this.detailsrecipeId = detailsrecipeId;
        this.detailsingId = detailsingId;
        this.detailsQty = detailsQty;
        this.detailsingCal = detailsingCal;
    }
    
    public Details( int detailsrecipeId, int detailsingId, double detailsQty){
        super();
        this.detailsrecipeId = detailsrecipeId;
        this.detailsingId = detailsingId;
        this.detailsQty = detailsQty;
    }
    
    public Details(int detailsrecipeId, String detailsrecipeName){
        super();
        this.detailsrecipeId = detailsrecipeId;
        this.detailsrecipeName = detailsrecipeName;
    }

    public Details(int detailsrecipeId, String detailsrecipeName, int detailsingId, String detailsingName, String detailsingMeasure, double detailsQty, int totalCal){
        super();
        this.detailsrecipeId = detailsrecipeId;
        this.detailsrecipeName = detailsrecipeName;
        this.detailsingId = detailsingId;
        this.detailsingName = detailsingName;
        this.detailsingMeasure = detailsingMeasure;
        this.detailsQty = detailsQty;
        this.totalCal = totalCal;
    }

    public Details(int detailsrecipeId, int detailsingId, int detailsQty, int detailsingCal, String detailsrecipeName, String detailsingName, String detailsingMeasure, int totalCal) {
        this.detailsrecipeId = detailsrecipeId;
        this.detailsingId = detailsingId;
        this.detailsQty = detailsQty;
        this.detailsingCal = detailsingCal;
        this.detailsrecipeName = detailsrecipeName;
        this.detailsingName = detailsingName;
        this.detailsingMeasure = detailsingMeasure;
        this.totalCal = totalCal;
    }
    public Details(int detailsingId, String detailsingName, int detailsQty, String detailsingMeasure, int detailsingCal) {
        this.detailsingId = detailsingId;
        this.detailsQty = detailsQty;
        this.detailsingCal = detailsingCal;
        this.detailsingName = detailsingName;
        this.detailsingMeasure = detailsingMeasure;
    }

    public Details(int detailsingId, String detailsingName, double detailsQty, String detailsingMeasure, int totalCal) {
        this.detailsingId = detailsingId;
        this.detailsQty = detailsQty;
        this.detailsingName = detailsingName;
        this.detailsingMeasure = detailsingMeasure;
        this.totalCal = totalCal;
    }
    

    public int getDetailsrecipeId() {
        return detailsrecipeId;
    }

    public void setDetailsrecipeId(int detailsrecipeId) {
        this.detailsrecipeId = detailsrecipeId;
    }

    public int getDetailsingId() {
        return detailsingId;
    }

    public void setDetailsingId(int detailsingId) {
        this.detailsingId = detailsingId;
    }

    public double getDetailsQty() {
        return detailsQty;
    }

    public void setDetailsQty(double detailsQty) {
        this.detailsQty = detailsQty;
    }

    public int getDetailsingCal() {
        return detailsingCal;
    }

    public void setDetailsingCal(int detailsingCal) {
        this.detailsingCal = detailsingCal;
    }

    public String getDetailsrecipeName() {
        return detailsrecipeName;
    }

    public void setDetailsrecipeName(String detailsrecipeName) {
        this.detailsrecipeName = detailsrecipeName;
    }

    public String getDetailsingName() {
        return detailsingName;
    }

    public void setDetailsingName(String detailsingName) {
        this.detailsingName = detailsingName;
    }

    public int getTotalCal() {
        return totalCal;
    }

    public void setTotalCal(int totalCal) {
        this.totalCal = totalCal;
    }

    public String getDetailsingMeasure() {
        return detailsingMeasure;
    }

    public void setDetailsingMeasure(String detailsingMeasure) {
        this.detailsingMeasure = detailsingMeasure;
    }
    
    

}