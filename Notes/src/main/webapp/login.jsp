<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Page</title>
  <%@ include file="all_components/allcss.jsp" %>
  <style>
    body {
      background: linear-gradient(135deg, #f8f9fa, #e9ecef);
      min-height: 100vh;
    }
    .card {
      border: none;
      border-radius: 1rem;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    .form-label {
      font-weight: 500;
    }
  </style>
</head>
<body>

  <%@ include file="all_components/navbar.jsp" %>

  <div class="container d-flex justify-content-center align-items-center mt-5 mb-5">
    <div class="col-md-6 col-lg-5">
      <div class="card p-4">
        <div class="card-body">
          <h3 class="card-title text-center mb-4 text-primary">Login to Your Account</h3>

          <%-- Display messages if any --%>
          <%
            String invalidMsg = (String) session.getAttribute("login-failed");
            if (invalidMsg != null) {
          %>
            <div class="alert alert-danger" role="alert">
              <%= invalidMsg %>
            </div>
          <%
              session.removeAttribute("login-failed");
            }

            String authMsg = (String) session.getAttribute("login-error");
            if (authMsg != null) {
          %>
            <div class="alert alert-danger" role="alert">
              <%= authMsg %>
            </div>
          <%
              session.removeAttribute("login-error");
            }
          %>

          <form method="post" action="LoginServlet">
            <div class="mb-3">
              <label for="email" class="form-label">Email address</label>
              <input type="email" name="uemail" class="form-control" id="email" placeholder="Enter email" required>
            </div>

            <div class="mb-4">
              <label for="password" class="form-label">Password</label>
              <input type="password" name="upassword" class="form-control" id="password" placeholder="Enter password" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Login</button>
          </form>

          <div class="text-center mt-3">
            <a href="register.jsp" class="text-decoration-none">Don't have an account? Register</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="all_components/footer.jsp" %>
</body>
</html>
