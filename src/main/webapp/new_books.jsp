<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDao" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
<%@include file="all_components/navbar.jsp"%>
 <div class="container ">
		<h3 class="text-center p-2">New Books</h3>
		<div class="row">
			<%
	BookDao book2=new BookDao(DBConnect.getConnection());
	List<Book> bklist2=new ArrayList<Book>();
	bklist2=book2.getAllNewBooks();
	
	for(Book bk:bklist2){
		
		%>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="" src="books/<%=bk.getPhoto() %> "
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=bk.getBookName() %></p>
						<p>Author :<%=bk.getAuthor() %></p>
						<p>Category :<%=bk.getBookCategory() %></p>
						<div class="row" style="place-content: center;">
							<a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							 <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> 299</a>
								
						</div>
					</div>
				</div>
			</div>
				<% 
	}
	%>
		
		</div>
	</div>
	<%@include file="all_components/footer.jsp" %>
</body>
</html>