<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<c:if test="${not empty added }">
		<div class="alert alert-success" role="alert">${added}</div>
		<c:remove var="added" scope="session" />
	</c:if>
	<c:if test="${not empty failed}">
		<div class="alert alert-danger" role="alert">${failed }</div>
		<c:remove var="added" scope="session" />
	</c:if>

	<diV class="container">
		<diV class="row">
			<diV class="col-md-4 offset-md-4">
				<diV class="card" style="margin-top: 10px;">
					<diV class="card-body">
						<h3 class="text-center text-primary">Sell Old Book</h3>
						<form action="AddOldBook" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="useremail" value="${userObj.email}">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="exampleFormControl File1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Upload
								Book</button>
						</form>
					</diV>
				</diV>
			</diV>
		</diV>
	</diV>

	<%@include file="all_components/footer.jsp"%>
</body>
</html>