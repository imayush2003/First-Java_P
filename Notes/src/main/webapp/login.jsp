<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@ include file="all_components/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container-fluid mt-5 mb-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header">
						<h1>Login</h1>
					</div>
					<%
					String invalidMsg = (String) session.getAttribute("login-failed");
					if (invalidMsg != null) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=invalidMsg%>
					</div>
					<%
					session.removeAttribute("login-failed");
					}
					%>
					<div class="card-body">
						<form method="post" action="LoginServlet">


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="uemail" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="upassword" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<button type="submit" class="btn btn-primary">Login</button>
						</form>
					</div>
				</div>

			</div>
		</div>


	</div>
	<%@ include file="all_components/footer.jsp"%>

</body>
</html>