<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page import="com.DAO.BookDao" %>
  		<%@page import="com.DB.DBConnect" %>
  		<%@page import="java.util.*" %>
  		<%@page import="com.entity.*" %>
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
	
	<%
	int id=Integer.parseInt(request.getParameter("id"));
	BookDao book=new BookDao(DBConnect.getConnection());
	Book bk=book.getBookById(id);
	%>

	<div class="container pt-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Edit Books</h4>
						<c:if test="">
						<p class="text-center text-success"></p>
						<c:remove var="added" scope="session"/>
						</c:if>
						<c:if test="">
						<p class="text-center text-success"></p>
						<c:remove var="failed" scope="session"/>
						</c:if>
						<form action="../" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" value="<%=bk.getBookName() %>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" value="<%=bk.getAuthor() %>" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									name="price" value="<%=bk.getPrice() %>" type="number" class="form-control" id="exampleInputPassword1">
							</div>
							
							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState"  name="btype" class="form-control">
									<option value="<%=bk.getBookCategory() %>" selected><%=bk.getBookCategory() %></option>
									<option value="New">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option value="<%=bk.getStatus() %>" selected><%=bk.getStatus() %></option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControl File1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Edit</button>
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