<%@ include file="all_components/allcss.jsp"%>
<title>Add Note</title>

<%@ include file="all_components/navbar.jsp"%>
<div class="container">
	<h1 class="text-center mt-5 mb-5">Add Your Note</h1>
	<div class="row">
	<div class="col-md-12">
	<form>
  <div class="form-group">
    <label for="exampleInputEmail1">Enter Title</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Title">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Content</label>
    <textarea rows="12" class="form-control" id="" ></textarea>
  </div>
 
  <button type="submit" class="btn btn-primary">Add Note</button>
</form>
	
		</div>
	</div>
</div>

<%@ include file="all_components/footer.jsp"%>