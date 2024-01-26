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
<title>Manage old Books</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<c:if test="${not empty deleted }">
		<div class="alert alert-success" role="alert">${deleted}</div>
		<c:remove var="added" scope="session" />
	</c:if>
	<c:if test="${not empty failed}">
		<div class="alert alert-danger" role="alert">${failed }</div>
		<c:remove var="added" scope="session" />
	</c:if>
	<div class="container">
		<div class="card mt-2">
			<div class="card-body">
				<h3 class="text-center text-success">Your Old Books</h3>
				<div class="cart-table-container"
					style="max-height: 400px; overflow-y: auto;">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Sr.No.</th>
								<th scope="col">Photo</th>
								<th scope="col">BookName</th>
								<th scope="col">Author</th>
								<th scope="col">Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>


							<%
							BookDao book = new BookDao(DBConnect.getConnection());
							List<Book> list = new ArrayList<Book>();
							User user = (User) session.getAttribute("userObj");
							list = book.getUserOldBooksById("old", user.getEmail());
							int i = 1;
							for (Book bk : list) {
							%>

							<tr>
								<th><%=i%></th>
								<th><img Style="height: 80px; width: 60px"
									src="books/<%=bk.getPhoto()%>"></th>
								<th><%=bk.getBookName()%></th>
								<td><%=bk.getAuthor()%></td>
								<td><%=bk.getPrice()%></td>
								<td><a href="UserOldBookDelete?id=<%=bk.getBookId()%>"
									class="btn btn-danger">Delete</a></td>
							</tr>

							<%
							i++;
							}
							%>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>




	<%@include file="all_components/footer.jsp"%>
</body>
</html>