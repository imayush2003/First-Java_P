<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.User.Post"%>
<%@page import="java.util.List"%>

<%
    UserDetails user1 = (UserDetails) session.getAttribute("UserD");
    if (user1 == null) {
        session.setAttribute("login-error", "Please Login First....!!");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@ include file="all_components/allcss.jsp" %>
<title>Show Notes</title>
<%@ include file="all_components/navbar.jsp" %>

<div class="container my-5">
    <h2 class="text-center mb-4">Your Notes</h2>

    <%
        PostDAO dao = new PostDAO(DBConnect.getConn());
        List<Post> notes = dao.getData(user1.getId());

        if (notes != null && !notes.isEmpty()) {
            int count = 0;
            for (Post po : notes) {
                if (count % 3 == 0) {
    %>
    <div class="row">
    <%
                }
    %>
        <div class="col-md-4 mb-4 d-flex align-items-stretch">
            <div class="card shadow-sm w-100">
                <div class="card-body">
                    <h5 class="card-title text-primary"><%= po.getTitle() %></h5>
                    <p class="card-text"><%= po.getContent().length() > 100 ? po.getContent().substring(0, 100) + "..." : po.getContent() %></p>
                    <p class="text-muted mb-1"><small><b>Date:</b> <%= po.getPdate() %></small></p>
                    <p class="text-muted"><small><b>By:</b> <%= user1.getName() %></small></p>
                </div>
                <div class="card-footer bg-white d-flex justify-content-between">
                    <a href="edit.jsp?note_id=<%= po.getId() %>" class="btn btn-sm btn-warning text-white">Edit</a>
                    <a href="DeleteServlet?note_id=<%= po.getId() %>" class="btn btn-sm btn-danger"
                       onclick="return confirm('Are you sure you want to delete this note?');">Delete</a>
                </div>
            </div>
        </div>
    <%
                count++;
                if (count % 3 == 0 || count == notes.size()) {
    %>
    </div>
    <%
                }
            }
        } else {
    %>
    <div class="alert alert-info text-center" role="alert">
        You have no notes yet. <a href="addNotes.jsp" class="alert-link">Add your first note!</a>
    </div>
    <%
        }
    %>
</div>

<%@ include file="all_components/footer.jsp" %>
