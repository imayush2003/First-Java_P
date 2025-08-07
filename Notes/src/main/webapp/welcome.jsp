<%
    UserDetails user1 = (UserDetails) session.getAttribute("UserD");
    if (user1 == null) {
        session.setAttribute("login-error", "Please Login First....!!");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <%@ include file="all_components/allcss.jsp" %>
    <style>
        body {
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            min-height: 100vh;
        }

        .welcome-card {
            border: none;
            border-radius: 1.5rem;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        .welcome-card img {
            width: 150px;
            border-radius: 0%;
            margin-bottom: 1rem;
        }

        .btn-custom {
            padding: 10px 30px;
            font-size: 1.1rem;
            border-radius: 30px;
        }
    </style>
</head>
<body>

<%@ include file="all_components/navbar.jsp" %>

<div class="container d-flex justify-content-center align-items-center mt-5">
    <div class="col-md-6">
        <div class="card welcome-card text-center p-4 bg-white">
            <div class="card-body">
                <img src="image/images.jpg" alt="Welcome Image">
                <h2 class="card-title text-primary mb-3">Welcome, <%= user1.getName() %>!</h2>
                <p class="card-text mb-4">Start taking notes and stay organized.</p>
                <a href="addNotes.jsp" class="btn btn-primary btn-custom">Add Note</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="all_components/footer.jsp" %>

</body>
</html>
