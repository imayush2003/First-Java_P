package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.DAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("fname");
        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword");

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        // ✅ Empty field check
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {

            session.setAttribute("registration-failed", "All fields are required.");
            response.sendRedirect("register.jsp");
            return;
        }

        UserDetails us = new UserDetails();
        us.setName(name);
        us.setemail(email);
        us.setpassword(password);

        DAO dao = new DAO(DBConnect.getConn());

        boolean f = dao.addUser(us);

        if (f) {
            // ✅ JavaScript alert and redirect
            out.println("<script type='text/javascript'>");
            out.println("alert('Registered Successfully!');");
            out.println("location='login.jsp';");
            out.println("</script>");
        } else {
            session.setAttribute("registration-failed", "Registration failed. Try again.");
            response.sendRedirect("register.jsp");
        }
    }
}
