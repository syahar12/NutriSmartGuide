/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.DAO.AdminDAO;
import com.Model.Admin;
import jakarta.servlet.ServletContext;
import java.util.List;

import javax.swing.JOptionPane;

/**
 *
 * @author HUAWEI
 */
@WebServlet("/")
public class AdminServlet extends HttpServlet {

    private AdminDAO adminDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {

                case "/signupAdmin":
                    signupAdmin(request, response);
                    break;
                case "/editFormAdmin":
                    showEditForm(request, response);
                    break;
                case "/loginAdmin":
                    showLoginPage(request, response);
                    break;

                case "/updateAdmin":
                    updateAdmin(request, response);
                    break;
                case "/profileAdmin":
                    listAdmin(request, response);
                    break;
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }//

    private void signupAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        int noPhone = Integer.parseInt(request.getParameter("noPhone"));
        String birthDate = request.getParameter("birthDate");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        Admin newAdmin = new Admin(firstName, lastName, noPhone, birthDate, email, gender, password);
        adminDAO.insertAdmin(newAdmin);
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/Login.jsp");
        dispatcher.forward(request, response);
    }

    private void showLoginPage(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Admin admin = new Admin();
        if (adminDAO.LoginAdmin(email, password)) {
            response.sendRedirect("profileAdmin?email=" + email + "&password=" + password);

        } else {
            int option = JOptionPane.showOptionDialog(null, "Account does not exist. Sign Up to create an account", "Sign Up", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, new Object[]{"Sign Up", "Cancel"}, null);

            if (option == JOptionPane.YES_OPTION) {
                response.sendRedirect("Signup.jsp");
            } else {
                response.sendRedirect("Login.jsp");
            }

        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int adminId = Integer.parseInt(request.getParameter("id"));
        Admin existingAdmin = adminDAO.selectAdminById(adminId);
        ServletContext sc=getServletContext();
        RequestDispatcher dispatcher=sc.getRequestDispatcher("/editProfile.jsp");
        request.setAttribute("admins", existingAdmin);
        dispatcher.forward(request, response);
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        int noPhone = Integer.parseInt(request.getParameter("noPhone"));
        String gender = request.getParameter("gender");
         String email = request.getParameter("email");
         String password = request.getParameter("password");

        Admin admin = new Admin();
        admin.setFirstName(firstName);
        admin.setLastName(lastName);
        admin.setNoPhone(noPhone);
        admin.setGender(gender);
        admin.setEmail(email);
        admin.setPassword(password);
        

        adminDAO.updateAdmin(admin);

        response.sendRedirect("profileAdmin?email=" + email + "&password=" + password);

    }

    private void listAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        List<Admin> listAdmin = adminDAO.selectAdmin(email, password);
        request.setAttribute("admin", listAdmin);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Profile.jsp");
        dispatcher.forward(request, response);
    }
}
