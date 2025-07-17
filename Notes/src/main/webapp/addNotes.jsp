<!-- Code Start for (This page will not open without Login  -->
<%
	UserDetails user1=(UserDetails)session.getAttribute("UserD");
	if(user1==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error", "Please Login First....!!");
	}
%>
<!-- Code End for (This page will not open without Login  -->



<%@ include file="all_components/allcss.jsp"%>
<title>Add Note</title>

<%@ include file="all_components/navbar.jsp"%>
<div class="container">
	<h1 class="text-center mt-5 mb-5">Add Your Note</h1>
	<div class="row">
	<div class="col-md-12">
	<form action="AddNotes" method="post">
	
		<div class="form-group">
		<%
			UserDetails us=(UserDetails)session.getAttribute("UserD");
			if(us!=null){
		%>
			    <input type="hidden" name="uid" class="form-control" value="<%=us.getId()%>">
			
		<%
			}     
		%>
		</div>
  <div class="form-group">
    <label for="exampleInputEmail1">Enter Title</label>
    <input type="text" name="title" class="form-control" id="" aria-describedby="" placeholder="Enter Title">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Content</label>
    <textarea name="content" rows="12" class="form-control" id="" ></textarea>
  </div>
 
  <button type="submit" class="btn btn-primary">Add Note</button>
</form>
	
		</div>
	</div>
</div>

<%@ include file="all_components/footer.jsp"%>