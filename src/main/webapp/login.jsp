<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<div class="container p-2 pb-20">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<form action="LoginServlet" method="post">
							<h4 class="text-center">Login Here</h4>
							<c:if test="${not empty invalid }">
							<p class="text-center text-danger">${invalid}</p>
							<c:remove var="invalid" scope="session"/>
							</c:if>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" name="password" class="form-control"
									id="exampleInputPassword1" required>
							</div>
							
							<button type="submit" class="btn btn-primary full-btn">Submit</button>
						</form>
						<a href="register.jsp" class="btn btn-success full-btn mt-1">Not
							Member? Register</a>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>