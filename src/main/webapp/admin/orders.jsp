<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.DAO.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>


	<c:if test="${not empty completed}">
		<div class="alert alert-success" role="alert">${completed}</div>
		<c:remove var="completed" scope="session" />
	</c:if>

<h4 class="text-center pt-2">Welcome Admin</h4>
<div class="container pt-3">
<table class="table">
  <thead class="table-dark">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email </th>
      <th scope="col">Address</th>
      <th scope="col">Phone</th>
      <th scope="col">Book Name</th>
      <th scope="col">Price</th>
      <th scope="col">Payment</th>
       <th scope="col">Landmark</th>
        <th scope="col">City</th>
         <th scope="col">State</th>
          <th scope="col">Pin Code</th>
           <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
   <%
   OrderDAO od=new OrderDAO(DBConnect.getConnection());
   List<Order> list=new ArrayList<Order>();
   list=od.getAllOrders();
   for(Order ord:list){
	   %>
    <tr>
      <th scope="row"><%=ord.getOrderId() %></th>
      <td><%=ord.getUserName() %></td>
     <td><%=ord.getEmail() %></td>
    <td><%=ord.getAddress() %></td>
        <td><%=ord.getPhone() %></td>
     <td><%=ord.getBookName() %></td>
    <td><%=ord.getPrice() %></td>
      <td><%=ord.getPayment() %></td>
     <td><%=ord.getLandmark() %></td>
    <td><%=ord.getCity() %></td>
       <td><%=ord.getState() %></td>
     <td><%=ord.getPincode() %></td>
        <td><a href="../CompleteOrder?id=<%=ord.getOrderId() %>" class="btn btn-danger">Complete</a></td>
    </tr>
    	 <%   
   }
   %>
  </tbody>
</table>
</div>
<div style="margin-top:150px">
<%@include file="footer.jsp" %>
</div>

</body>
</html>