<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<style>
.card-body {
	background-color: #f1f1f1;
}
</style>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_components/navbar.jsp"%>
	<c:if test="${not empty updateSuccess}">
		<div class="alert alert-success" role="alert">${updateSuccess}</div>
		<c:remove var="updateSuccess" scope="session" />
	</c:if>

	<c:if test="${not empty updateFailed}">
		<div class="alert alert-danger" role="alert">${updateFailed}</div>
		<c:remove var="updateFailed" scope="session" />
	</c:if>

	<div class="container" style="margin-bottom: 90px;">
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_books.jsp">
					<div class="card mt-10">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Sell old Book</h4>
							<br>

						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="user_old_books.jsp">
					<div class="card mt-10">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Manage Your Books</h4>
							<br>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="update_profiel.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-edit fa-3x"></i>
							</div>
							<h4>Login & Security (Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>
		</div>

		<div class="row">

			<div class="col-md-6">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>


	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>