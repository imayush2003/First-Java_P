<!-- Code Start for (This page will not open without Login  -->
<%
	UserDetails user1=(UserDetails)session.getAttribute("UserD");
	if(user1==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error", "Please Login First....!!");
	}
%>
<!-- Code End for (This page will not open without Login  -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<%@ include file="all_components/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container-fluid p-0">
		<div class="card py-5">
			<div class="card-body text-center">
				<img class="card-img-top" src="image/images.jpg" style="width: 150px;" alt="Card image cap">
				<h1 class="card-title">Start Your Notes</h1>
				<a href="addNotes.jsp" type="button" class="btn btn-primary">Add Note</a>
			</div>
		</div>

	</div>
	
	<%@ include file="all_components/footer.jsp"%>
</body>
</html>