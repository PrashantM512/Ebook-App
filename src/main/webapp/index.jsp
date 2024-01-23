<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDao" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<style>
.back-img {
	background-image: url("img/book.jpg");
	height: 80vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.title {
	color: #7484a9 !important;
}
body{
  background-color: #efefef;
}
.btn-view{
  width: 85%;
}
</style>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center title Bold pt-3">
			<i class="fa-solid fa-book"></i>&nbsp;E-Book management System
		</h2>
	</div>	
	
	<!-- Recent books section -->
	<div class="container ">
		<h3 class="text-center p-2">Recent Books</h3>
		<div class="row">
			<%
	BookDao book=new BookDao(DBConnect.getConnection());
	List<Book> bklist=new ArrayList<Book>();
	bklist=book.getRecentBooks();
	
	for(Book bk:bklist){
		
		%>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="" src="books/<%=bk.getPhoto() %> "
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=bk.getBookName() %></p>
						<p><%=bk.getAuthor() %></p>
						<p>Categories:<%=bk.getBookCategory() %></p>
						<div class="row" style="place-content: center;">
						<%
						if(bk.getBookCategory().equals("New")){
							%>
							<a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a>
					<% 	}
						%>
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
	<div class="text-center mt-2">
	<a href="" class="btn btn-outline-primary btn-view pt-1">View all</a>
	</div>
	<!-- End of recent books -->
	<hr>

    <!-- start of new books -->
    <div class="container ">
		<h3 class="text-center p-2">New Books</h3>
		<div class="row">
			<%
	BookDao book2=new BookDao(DBConnect.getConnection());
	List<Book> bklist2=new ArrayList<Book>();
	bklist=book.getNewBooks();
	
	for(Book bk:bklist){
		
		%>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="" src="books/<%=bk.getPhoto() %> "
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=bk.getBookName() %></p>
						<p><%=bk.getAuthor() %></p>
						<p>Categories:<%=bk.getBookCategory() %></p>
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
	<div class="text-center mt-2">
	<a href="" class="btn btn-outline-primary btn-view pt-1">View all</a>
	</div>
    <!-- end of recent books -->
    <hr>
    <!-- start of old books -->
    <div class="container ">
		<h3 class="text-center p-2">Old Books</h3>
		<div class="row">
			<%
	BookDao book3=new BookDao(DBConnect.getConnection());
	List<Book> bklist3=new ArrayList<Book>();
	bklist=book.getOldBooks();
	
	for(Book bk:bklist){
		
		%>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="" src="books/<%=bk.getPhoto() %> "
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=bk.getBookName() %></p>
						<p><%=bk.getAuthor() %></p>
						<p>Categories:<%=bk.getBookCategory() %></p>
						<div class="row" style="place-content: center;">
						
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
	<div class="text-center mt-2">
	<a href="" class="btn btn-outline-primary btn-view pt-1">View all</a>
	</div>
    <!-- end of old books -->

<%@include file="all_components/footer.jsp" %>
</body>
</html>
