<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="index.jsp">Navbar</a>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="addNotes.jsp">Add
					Notes</a></li>
			<li class="nav-item active"><a class="nav-link" href="showNotes.jsp">Show Notes</a></li>

			<%
			UserDetails user = (UserDetails) session.getAttribute("UserD");
			if (user != null) {
			%>

		</ul>

		<form class="form-inline my-2 my-lg-0">
			<a class="btn btn-outline-dark my-2 my-sm-0 mx-1" type="submit" href="login.jsp"><%=user.getName()%>
			</a>
			<a class="btn btn-outline-dark my-2 my-sm-0 mx-1" type="submit"
				href="LogoutServlet">Logout</a>
		</form>
		
		<%
		} else {
		%>
		
		<form class="form-inline my-2 my-lg-0">
			<a class="btn btn-outline-dark my-2 my-sm-0 mx-1" type="submit" href="login.jsp">Login</a>
			<a class="btn btn-outline-dark my-2 my-sm-0 mx-1" type="submit"
				href="register.jsp">Register</a>
		</form>
		
		<%
		}
		%>
		
	</div>
</nav>
