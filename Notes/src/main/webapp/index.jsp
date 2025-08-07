<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <%@ include file="all_components/allcss.jsp" %>

    <style>
        .back-img {
            background: url('image/pexel.jpg') no-repeat center center;
            background-size: cover;
            width: 100%;
            height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 60px 40px;
            border-radius: 16px;
            backdrop-filter: blur(5px);
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }

        .overlay h1 {
            color: #ffc107;
            margin-bottom: 30px;
            font-size: 3rem;
        }

        .btn-custom {
            padding: 12px 28px;
            font-size: 1.1rem;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <%@ include file="all_components/navbar.jsp" %>

    <div class="container-fluid back-img">
        <div class="overlay text-center text-white">
            <h1>Save Your Notes</h1>
            <a href="login.jsp" class="btn btn-dark btn-custom me-3">Login</a>
            <a href="register.jsp" class="btn btn-outline-light btn-custom">Register</a>
        </div>
    </div>

    <%@ include file="all_components/footer.jsp" %>
</body>
</html>
