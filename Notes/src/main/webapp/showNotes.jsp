<!-- Code Start for (This page will not open without Login  -->
<%
	UserDetails user1=(UserDetails)session.getAttribute("UserD");
	if(user1==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error", "Please Login First....!!");
	}
%>
<!-- Code End for (This page will not open without Login-->




<%@ include file="all_components/allcss.jsp"%>
<title>Show Notes</title>

<%@ include file="all_components/navbar.jsp"%>
	<h1 class="text-center">Show Notes</h1>

<%@ include file="all_components/footer.jsp"%>