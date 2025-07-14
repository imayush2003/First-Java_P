<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="index.jsp">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse"
    data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent" aria-expanded="false"
    aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
      <li class="nav-item"><a class="nav-link" href="addNotes.jsp">Add Notes</a></li>
      <li class="nav-item"><a class="nav-link" href="#">Show Notes</a></li>
    </ul>

    <form class="form-inline my-2 my-lg-0 ml-auto">
      <a class="btn btn-outline-light my-2 my-sm-0 mx-1" href="login.jsp">Login</a>
      <a class="btn btn-outline-light my-2 my-sm-0 mx-1" href="register.jsp">Register</a>
    </form>
  </div>
</nav>
