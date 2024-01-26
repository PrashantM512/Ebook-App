<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.DAO.BookDao"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Book</title>
<%@include file="allCss.jsp"%>
<style>
.form-group {
	margin-bottom: 0.5rem !important;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${not empty bookObj }">
		<p class="text-center text-danger"></p>
		<c:remove var="invalid" scope="session" />
	</c:if>

	<div class="container pt-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Edit Books</h4>

						<c:if test="${not empty editFailed}">
							<p class="text-center text-danger">${editFailed}</p>
							<c:remove var="editFailed" scope="session" />
						</c:if>
						<form action="../EditBookServlet" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="bid" value="${bookObj.bookId }">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" value="${bookObj.bookName}" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" value="${bookObj.author }" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									name="price" value="${bookObj.price }" type="number"
									class="form-control" id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="btype" class="form-control">
									<option value="${bookObj.bookCategory }" selected>${bookObj.bookCategory }</option>
									<option value="New">New Book</option>
									<option value="old">Old Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option value="${bookObj.status }" selected>${bookObj.status }</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControl File1">Upload Photo</label> <input
									name="bimg" required type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div style="margin-top: 150px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>