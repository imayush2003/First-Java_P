<!-- Code Start for(This page will not be open without login -->
<%
UserDetails user1 = (UserDetails) session.getAttribute("UserD");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login First....!!");
}
%>
<!-- Code Ends -->

<%@page import="com.DAO.PostDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.User.Post"%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="all_components\allcss.jsp"%>
<title>Update Note</title>
</head>
<body>
	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	PostDAO post = new PostDAO(DBConnect.getConn());
	Post p = post.getDataByID(noteid);
	%>
	<%@ include file="all_components\navbar.jsp"%>
	<div class="container mb-5">
		<h1 class="text-center mb-5">Update Your Note</h1>
		<div class="row">
			<div class="col-md-12">
				<form action="EditServlet" method="post">

					<div class="form-group">
						<input type="hidden" value="<%=noteid%>" name="noteid"
							class="form-control">
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">Enter Title</label>
						<input type="text" name="title" value="<%=p.getTitle()%>" class="form-control" id="" aria-describedby="" placeholder="Enter Title">
					</div>

					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea name="content" rows="12" cols="6" class="form-control" id=""><%=p.getContent()%></textarea>
					</div>
					<button type="submit" class="btn btn-primary">Update Note</button>
				</form>

			</div>
		</div>
	</div>

	<%@ include file="all_components/footer.jsp"%>
</body>
</html>