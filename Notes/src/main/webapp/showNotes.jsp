<%
UserDetails user1 = (UserDetails) session.getAttribute("UserD");
if (user1 == null) {
    response.sendRedirect("login.jsp");
    session.setAttribute("login-error", "Please Login First....!!");
}
%>

<%@page import="com.DAO.PostDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.User.Post"%>

<%@ include file="all_components/allcss.jsp"%>
<title>Show Notes</title>
<%@ include file="all_components/navbar.jsp"%>

<div class="container">
    <h1 class="text-center">Show Notes</h1>

<%
    if (user1 != null) {
        PostDAO ob = new PostDAO(DBConnect.getConn());
        List<Post> post = ob.getData(user1.getId());
        int count = 0;
        int total = post.size();

        for (Post po : post) {
            if (count % 3 == 0) {
%>
        <div class="row">
<%
            }
%>
            <div class="col-md-4 d-flex align-items-stretch mb-4">
                <div class="card w-100" style="min-height: 360px;">
                    <div class="card-body p-4">
                        <h4 class="card-title">Title: <%=po.getTitle()%></h4>
                        <p><b>Content:</b> <%=po.getContent()%></p>
                        <p><b>Uploaded By:</b> <%=user1.getName()%></p>
                        <p><b>Date:</b> <%=po.getPdate()%></p>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <a href="edit.jsp?note_id=<%=po.getId()%>" class="btn btn-warning btn-sm text-white">Edit</a>
                        <a href="DeleteServlet?note_id=<%=po.getId()%>" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this note?');">Delete</a>
                    </div>
                </div>
            </div>
<%
            count++;
            if (count % 3 == 0 || count == total) {
%>
        </div>
<%
            }
        }
    }
%>

</div>

<%@ include file="all_components/footer.jsp"%>
