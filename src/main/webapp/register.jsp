<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Register Here</h4>
						
						<c:if test="${not empty success}">
						<p class="text-center text-success">${success}</p>
						<c:remove var="success" scope="session"/>
						</c:if>
						<c:if test="${not empty exist}">
						<p class="text-center text-danger">${exist}</p>
						<c:remove var="exist" scope="session"/>
						</c:if>
						
						<c:if test="${not empty unsuccess}">
						<p class="text-center text-danger">${unsuccess}</p>
						<c:remove var="unsuccess" scope="session"/>
						</c:if>
						
						<c:if test="${not empty check}">
						<p class="text-center text-danger">${check}</p>
						<c:remove var="check" scope="session"/>
						</c:if>
						
						<form action="RegisterServlet" method="post">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Name</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name" required >
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" name="email" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Mobile</label>
								<input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" name="phone" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password"
									id="exampleInputPassword1" required>
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1" >Agree terms and conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>