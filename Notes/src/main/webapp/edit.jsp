<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.User.Post"%>

<%
    UserDetails user1 = (UserDetails) session.getAttribute("UserD");
    if (user1 == null) {
        session.setAttribute("login-error", "Please Login First....!!");
        response.sendRedirect("login.jsp");
        return;
    }

    Integer noteid = Integer.parseInt(request.getParameter("note_id"));
    PostDAO post = new PostDAO(DBConnect.getConn());
    Post p = post.getDataByID(noteid);
%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="all_components/allcss.jsp" %>
    <title>Update Note</title>
</head>
<body>
    <%@ include file="all_components/navbar.jsp" %>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white text-center">
                        <h4 class="mb-0">Edit Your Note</h4>
                    </div>
                    <div class="card-body">
                        <form action="EditServlet" method="post">
                            <input type="hidden" name="noteid" value="<%= noteid %>">

                            <div class="mb-3">
                                <label class="form-label"><strong>Title</strong></label>
                                <input type="text" name="title" class="form-control" value="<%= p.getTitle() %>" placeholder="Enter Title" required>
                            </div>

                            <div class="mb-4">
                                <label class="form-label"><strong>Content</strong></label>
                                <textarea name="content" class="form-control" rows="10" placeholder="Write your content here..." required><%= p.getContent() %></textarea>
                            </div>

                            <div class="text-end">
                                <button type="submit" class="btn btn-success">Update Note</button>
                                <a href="showNotes.jsp" class="btn btn-secondary ms-2">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="all_components/footer.jsp" %>
</body>
</html>
