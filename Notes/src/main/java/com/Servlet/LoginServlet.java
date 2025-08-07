package com.Servlet;
import java.io.IOException;

import com.DAO.DAO;
import com.Db.DBConnect;
import com.User.UserDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword");

        HttpSession session = request.getSession();

        // ✅ Check for empty email or password
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            session.setAttribute("login-failed", "Email and password cannot be empty.");
            response.sendRedirect("login.jsp");
            return;
        }

        UserDetails us = new UserDetails();
        us.setemail(email);
        us.setpassword(password);

        DAO dao = new DAO(DBConnect.getConn());
        UserDetails user = dao.loginUser(us);

        if (user != null) {
            session.setAttribute("UserD", user);
            response.sendRedirect("welcome.jsp");
        } else {
            session.setAttribute("login-failed", "Invalid User or Password..!!");
            response.sendRedirect("login.jsp");
        }
    }
}