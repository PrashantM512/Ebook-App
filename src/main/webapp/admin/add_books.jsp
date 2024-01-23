<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
<%@include file="allCss.jsp"%>
<style>
.form-group {
    margin-bottom: 0.5rem !important;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container pt-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty added }">
						<p class="text-center text-success">${added }</p>
						<c:remove var="added" scope="session"/>
						</c:if>
						<c:if test="${not empty failed }">
						<p class="text-center text-success">${failed}</p>
						<c:remove var="failed" scope="session"/>
						</c:if>
						<form action="../AdminAddBookServlet" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									name="price" type="number" class="form-control" id="exampleInputPassword1">
							</div>
							
							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="btype" class="form-control">
									<option selected>--select--</option>
									<option value="New">New Book</option>
									<option value="old">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControl File1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div style="margin-top:150px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>