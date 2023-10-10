/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author 60107
 */

public class Admin  {
    private int adminId;
    private String firstName;
    private String lastName;
    private int noPhone;
    private String birthDate;
    private String email;
    private String gender;
    private String password;

    //default constructor
    public Admin() {
    }

    public Admin(String firstName, String lastName, int noPhone, String birthDate, String email, String gender, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.noPhone = noPhone;
        this.birthDate = birthDate;
        this.email = email;
        this.gender = gender;
        this.password = password;
    }

    public Admin(int adminId, String firstName, String lastName, int noPhone, String birthDate, String email, String gender, String password) {
        this.adminId = adminId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.noPhone = noPhone;
        this.birthDate = birthDate;
        this.email = email;
        this.gender = gender;
        this.password = password;
    }

    public Admin(String firstName, String lastName, int noPhone,String gender, String email,  String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.noPhone = noPhone;
        this.email = email;
        this.gender = gender;
        this.password = password;
    }
    

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getNoPhone() {
        return noPhone;
    }

    public void setNoPhone(int noPhone) {
        this.noPhone = noPhone;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
    
}
