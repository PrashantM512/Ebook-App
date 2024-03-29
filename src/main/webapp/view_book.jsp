<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDao"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book</title>
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

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDao book = new BookDao(DBConnect.getConnection());
	Book bk = book.getBookById(id);
	%>
	<%
	User user = (User) session.getAttribute("userObj");
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=bk.getPhoto()%>"
					style="height: 190px; width: 150px"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=bk.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=bk.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=bk.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=bk.getBookName()%></h2>

				<%
				if ("old".equals(bk.getBookCategory())) {
				%>
				<h5>Contact To Seller</h5>

				<h5>
					<i class="far fa-envelope"></i> EMail:
					<%=bk.getEmail()%></h5>

				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if (bk.getBookCategory().equals("old")) {
				%>
				<div class=" text-center p-3">
					<a href="index.jsp" class="btn btn-primary"><i
						class="fas fa-cart-plus"></i> Continue Shopping</a> <a href=""
						class="btn btn-danger"><i class="fas fa-rupee-sign"></i> <%=bk.getPrice()%></a>
				</div>
				<%
				} else {
				%>
				<div class=" text-center p-3">

					<%
					if (user == null) {
					%>
					<a href="login.jsp" class="btn btn-primary btn ml-2"><i
						class="fa-solid fa-cart-shopping"></i> Add Cart</a>
					<%
					} else {
					%>
					<a
						href="CartServlet?bid=<%=bk.getBookId()%>&&uid=<%=user.getId()%>"
						class="btn btn-primary btn ml-2"><i
						class="fa-solid fa-cart-shopping"></i> Add Cart</a>
					<%
					}
					%>
					<a href="" class="btn btn-danger"> <i class="fas fa-rupee-sign"></i>
						<%=bk.getPrice()%></a>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>

	<%@include file="all_components/footer.jsp"%>
</body>
</html>