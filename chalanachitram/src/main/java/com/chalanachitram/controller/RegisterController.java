package com.chalanachitram.controller;

import com.chalanachitram.service.UserService;
import com.chalanachitram.dao.UserDAO;
import com.chalanachitram.util.HibernateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        UserDAO userDAO = new UserDAO(HibernateUtil.getSessionFactory());
        userService = new UserService(userDAO);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobile_number");

        // Validate input
        if (!validateInput(username, password, confirmPassword, email, mobileNumber, request)) {
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Attempt registration
        if (userService.registerUser(username, password, email, mobileNumber)) {
            response.sendRedirect(request.getContextPath() + "/login?registered=true");
        } else {
            request.setAttribute("error", "Username or email already exists");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    private boolean validateInput(String username, String password, String confirmPassword, 
            String email, String mobileNumber, HttpServletRequest request) {
        if (username == null || username.trim().length() < 3) {
            request.setAttribute("error", "Username must be at least 3 characters long");
            return false;
        }

        if (password == null || password.length() < 8) {
            request.setAttribute("error", "Password must be at least 8 characters long");
            return false;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            return false;
        }

        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("error", "Invalid email format");
            return false;
        }

        if (mobileNumber == null || !mobileNumber.matches("\\d{10}")) {
            request.setAttribute("error", "Mobile number must be 10 digits");
            return false;
        }

        return true;
    }
}