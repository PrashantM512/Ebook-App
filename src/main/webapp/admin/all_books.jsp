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
<title>All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h4 class="text-center pt-2">Welcome Admin</h4>
	<c:if test="${not empty editSuccess }">
		<p class="text-center text-success">${editSuccess}</p>
		<c:remove var="editSuccess" scope="session" />
	</c:if>
	<c:if test="${not empty editFailed }">
		<p class="text-center text-success">${editFailed}</p>
		<c:remove var="editFailed" scope="session" />
	</c:if>
	<c:if test="${not empty deleteSuccess }">
		<p class="text-center text-success">${deleteSuccess}</p>
		<c:remove var="deleteSuccess" scope="session" />
	</c:if>
	<c:if test="${not empty deleteFailed }">
		<p class="text-center text-success">${deleteFailed}</p>
		<c:remove var="deleteFailed" scope="session" />
	</c:if>
	<div class="container pt-3">
		<table class="table">
			<thead class="table-dark">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">photo</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookDao book = new BookDao(DBConnect.getConnection());
				List<Book> blist = book.getBooks();

				for (Book b : blist) {
				%>
				<tr>
					<td><%=b.getBookId()%></td>
					<td><img Style="height: 50px; width: 50px"
						src="../books/<%=b.getPhoto()%>"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>
					<td>
					<%-- <td><c:url value="edit_book.jsp" var="editBookUrl">
							<c:param name="id" value="${b.getBookId()}" />
						</c:url> <a href="${editBookUrl}" class="btn btn-sm btn-primary">Edit</a> --%>
               
						<a href="../GetBookServlet?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary">Edit</a>
						<a href="../DeleteBookServlet?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a>
						</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div style="margin-top: 175px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>