/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;


import com.Model.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HUAWEI
 */
public class AdminDAO {

    Connection connection = null;
     private final String jdbcURL="jdbc:mysql://localhost:3306/NutriSmartGuide";
    private final String username="root";
    private final String password="";

    private static final String INSERT_ADMIN_SQL = "INSERT INTO admin (firstName, lastName, noPhone, birthDate, email, gender, password) VALUES"
            + "(?, ?, ?, ? ,?, ?, ?);";
    private static final String SELECT_ADMIN_BY_ADMINID = "select firstName, lastName, noPhone,birthDate, email, gender, password from admin where adminId=?";
    private static final String UPDATE_ADMIN_SQL = "update admin set firstName = ?, lastName = ?, noPhone = ?,  gender = ?,email = ?, password=? where email=? and password=?;";
    private static final String Login = "select * from admin Where email=? and password=?";

    
    public AdminDAO() {
    }

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

    public void insertAdmin(Admin admin) throws SQLException {
        System.out.println(INSERT_ADMIN_SQL);

        try (Connection connection = getConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(INSERT_ADMIN_SQL)) {
            preparedStatement.setString(1, admin.getFirstName());
            preparedStatement.setString(2, admin.getLastName());
            preparedStatement.setInt(3, admin.getNoPhone());
            preparedStatement.setString(4, admin.getBirthDate());
            preparedStatement.setString(5, admin.getEmail());
            preparedStatement.setString(6, admin.getGender());
            preparedStatement.setString(7, admin.getPassword());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public boolean LoginAdmin(String email, String password) {
        Admin admin = null;

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(Login);) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return true;

    }

    public Admin selectAdminById(int adminId) {
        Admin admins = null;

        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN_BY_ADMINID);) {
            preparedStatement.setInt(1, adminId);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int adminID = rs.getInt("adminId");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                int noPhone = rs.getInt("noPhone");
                String birthDate = rs.getString("birthDate");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String password = rs.getString("password");

                admins = new Admin(adminID, firstName, lastName, noPhone, birthDate, email, gender, password);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return admins;

    }

    public List<Admin> selectAdmin(String email,String password) {

        List<Admin> admin = new ArrayList<>();

        try (Connection connection = getConnection(); ) {
            PreparedStatement prepareStatement
                = connection.prepareStatement(Login);
            System.out.println(prepareStatement);
            prepareStatement.setString(1,email);
            prepareStatement.setString(2,password);
            ResultSet rs = prepareStatement.executeQuery();

            while (rs.next()) {
                int adminId = rs.getInt("adminId");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                int noPhone = rs.getInt("noPhone");
                String birthDate = rs.getString("birthDate");
                String Email = rs.getString("email");
                String gender = rs.getString("gender");
                String Password = rs.getString("password");
                admin.add(new Admin(adminId, firstName, lastName, noPhone, birthDate, Email, gender, Password));
            }
        } catch (SQLException e) {

            printSQLException(e);
        }
        return admin;
    }

    

    public boolean updateAdmin(Admin admin) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(UPDATE_ADMIN_SQL);) {

            statement.setString(1, admin.getFirstName());
            statement.setString(2, admin.getLastName());
            statement.setInt(3, admin.getNoPhone());
            statement.setString(4, admin.getGender());
            statement.setString(5, admin.getEmail());
            statement.setString(6, admin.getPassword());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public void updateProfile(Admin admin) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(UPDATE_ADMIN_SQL);) {
            statement.setString(1, admin.getFirstName());
            statement.setString(2, admin.getLastName());
            statement.setInt(3, admin.getNoPhone());
            statement.setString(4, admin.getBirthDate());
            statement.setString(5, admin.getEmail());
            statement.setString(6, admin.getGender());
            statement.setString(7, admin.getPassword());
            statement.setInt(8, admin.getAdminId());
            statement.executeUpdate();
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState:" + ((SQLException) e).getSQLState());
                System.err.println("Error Code:" + ((SQLException) e).getErrorCode());
                System.err.println("Message:" + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause:" + t);
                    t = t.getCause();
                }
            }
        }
    }
}

