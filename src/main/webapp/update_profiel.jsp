<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Profile</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Update Profile</h4>

						<c:if test="${not empty wrongPass}">
							<p class="text-center text-danger">${wrongPass}</p>
							<c:remove var="wrongPass" scope="session" />
						</c:if>

						<%
						User usobj = (User) session.getAttribute("userObj");
						int id = usobj.getId();
						UserDAOImpl us = new UserDAOImpl(DBConnect.getConnection());
						User user = us.getUserById(id);
						%>
						<form action="UpdateProfileServlet?id=<%=id%>" method="post">

							<input name="id" value="<%=id%>" type="hidden">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Name</label>
								<input type="text" value="<%=user.getName()%>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" value="<%=user.getEmail()%>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Mobile</label>
								<input type="number" value="<%=user.getPhone()%>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="phone" required>
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password"
									id="exampleInputPassword1" required>
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>