<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@ include file="all_components/allcss.jsp"%>
<style>
.back-img {
	background: url(image/pexel.jpg);
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>


	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-warning">Save Your Notes</h1>
			<a class="btn bg-dark text-light my-2 my-sm-0 mr-3" href="login.jsp"
				type="submit">Login</a> <a
				class="btn bg-dark text-light my-2 my-sm-0 mr-3" href="register.jsp"
				type="submit">Register</a>
		</div>
	</div>
	<%@ include file="all_components/footer.jsp"%>
</body>
</html>