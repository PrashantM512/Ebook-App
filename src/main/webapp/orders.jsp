<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.DAO.OrderDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Orders</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container">
		<h3 class="mt-2 mb-2 text-center">Your Orders</h3>
		<table class="table mt-3 mb-2">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Sr.NO.</th>
					<th scope="col">Book Name</th>
					<th scope="col">Price</th>
					<th scope="col">Timestamp</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User us = (User) session.getAttribute("userObj");
				int uid = us.getId();
				OrderDAO order = new OrderDAO(DBConnect.getConnection());
				List<Order> list = order.getOrdersByUid(uid);
				int i = 1;
				for (Order od : list) {
				%>

				<tr>
					<th scope="row"><%=i%></th>
					<td><%=od.getBookName()%></td>
					<td><%=od.getPrice()%></td>
					<td><%=od.getDate()%></td>
					<td><%=od.getPayment()%></td>
				</tr>
				<%
				i++;
				}
				%>
			</tbody>
		</table>
	</div>
	<div class="mt-5 pt-5">
		<%@include file="all_components/footer.jsp"%>
	</div>
</body>
</html>