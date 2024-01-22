<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="allCss.jsp"%>
</head>
<body>

		<%@include file="navbar.jsp"%>

		<div class="container">
			<div class="row p-5">

				<div class="col-md-3">
					<a href="add_books.jsp">
						<div class="card">
							<div class="card-body text-center">
								<i class="fas fa-plus-square fa-3x text-primary"></i>
								<h4>Add Books</h4>
								------------
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-3x text-danger"></i>
							<h4>All Books</h4>
							------------
						</div>
					</div>
					</a>
				</div>
				<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-3x text-warning"></i>
							<h4>Orders</h4>
							------------
						</div>
					</div>
					</a>
				</div>
				<div class="col-md-3">
			
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-3x text-primary"></i>
							<h4>Logout</h4>
							------------
						</div>
					</div>
				</div>
			</div>
		</div>

	
</body>
</html>