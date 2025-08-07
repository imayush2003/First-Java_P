<%
    UserDetails user1 = (UserDetails) session.getAttribute("UserD");
    if (user1 == null) {
        session.setAttribute("login-error", "Please Login First....!!");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@ include file="all_components/allcss.jsp" %>
<title>Add Note</title>

<%@ include file="all_components/navbar.jsp" %>

<style>
    body {
        background: linear-gradient(135deg, #f8f9fa, #e9ecef);
        min-height: 100vh;
    }

    .note-card {
        border-radius: 1.5rem;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        padding: 2rem;
        background-color: #fff;
    }

    .note-card label {
        font-weight: 600;
        margin-bottom: 0.5rem;
    }

    .note-card textarea {
        resize: vertical;
    }

    .btn-custom {
        border-radius: 30px;
        padding: 10px 30px;
        font-size: 1.1rem;
    }
</style>

<div class="container d-flex justify-content-center mt-5 mb-5">
    <div class="col-md-8">
        <div class="note-card">
            <h2 class="text-center mb-4 text-primary">Add Your Note</h2>
            <form action="AddNotes" method="post">

                <%
                    UserDetails us = (UserDetails) session.getAttribute("UserD");
                    if (us != null) {
                %>
                <input type="hidden" name="uid" class="form-control" value="<%= us.getId() %>">
                <%
                    }
                %>

                <div class="form-group mb-3">
                    <label for="title">Title</label>
                    <input type="text" name="title" class="form-control" id="title" placeholder="Enter note title" required>
                </div>

                <div class="form-group mb-4">
                    <label for="content">Content</label>
                    <textarea name="content" rows="10" class="form-control" id="content" placeholder="Write your note here..." required></textarea>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-custom">Add Note</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="all_components/footer.jsp" %>
