<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDao" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<style>
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}</style>
<body>
<%@include file="all_components/navbar.jsp"%>
<%
User user=(User)session.getAttribute("userObj");
%>
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
							<%
							if(user==null){ %>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%	
							}else{
							%>
							<a href="CartServlet?bid=<%=bk.getBookId() %>&&uid=<%=user.getId() %>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							}
							%>
							 <a href="view_book.jsp?id=<%=bk.getBookId() %>"
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