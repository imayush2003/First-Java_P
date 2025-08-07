<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="index.jsp">Navbar</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
            <li class="nav-item active"><a class="nav-link" href="addNotes.jsp">Add Notes</a></li>
            <li class="nav-item active"><a class="nav-link" href="showNotes.jsp">Show Notes</a></li>
        </ul>

        <ul class="navbar-nav ml-auto">
            <%
            UserDetails user = (UserDetails) session.getAttribute("UserD");
            if (user != null) {
            %>
                <li class="nav-item">
                    <button type="button" class="btn btn-warning my-2 my-sm-0 mx-1" data-toggle="modal" data-target="#exampleModal">
                        <%=user.getName()%>
                    </button>
                </li>
                <li class="nav-item">
                    <a class="btn btn-danger my-2 my-sm-0 mx-1" href="LogoutServlet">Logout</a>
                </li>
            <%
            } else {
            %>
                <li class="nav-item">
                    <a class="btn btn-success my-2 my-sm-0 mx-1" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-dark my-2 my-sm-0 mx-1" href="register.jsp">Register</a>
                </li>
            <%
            }
            %>
        </ul>
    </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Info</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Welcome, <strong><%= user != null ? user.getName() : "Guest" %></strong>!</p>
        <p>Email: <%= user != null ? user.getemail() : "Not available" %></p>
        <p>User ID: <%= user != null ? user.getId() : "N/A" %></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="LogoutServlet" class="btn btn-danger">Logout</a>
      </div>
    </div>
  </div>
</div>
