<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<%@include file="all_components/allCss.jsp" %>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>
<c:if test="${not empty removed }">
<div class="alert alert-success" role="alert">
  ${removed}
</div>
<c:remove var="removed" scope="session"/>
</c:if>

<c:if test="${not empty failedRemove }">
<div class="alert alert-danger" role="alert">
 ${failedRemove}
</div>
<c:remove var="removed" scope="session"/>
</c:if>

<div class="container">
    <div class="row">
    
        <div class="col-md-6">
            <div class="card mt-2">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Selected Items</h3>
                    <div class="cart-table-container" style="max-height: 400px; overflow-y: auto;">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Sr.No.</th>
                                    <th scope="col">BookName</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                              	int  uid = Integer.parseInt(request.getParameter("uid"));
                                CartDAO ckt = new CartDAO(DBConnect.getConnection());
                                List<Cart> list = new ArrayList<Cart>();
                                list = ckt.getCartProducts(uid);
                                int i = 1;
                                for (Cart crt : list) {
                                %>
                                <tr>
                                    <th><%=i %></th>
                                    <th><%=crt.getBookName() %></th>
                                    <td><%=crt.getAuthor() %></td>
                                    <td><%=crt.getPrice() %></td>
                                    <td><a href="RemoveFromCart?cid=<%=crt.getCid()%>&&uid=<%=uid %>" class="btn btn-danger">Remove</a></td>
                                </tr>
                                
                                <c:set var="total" value="<%=crt.getTotalPrice() %>">
                                
                                </c:set>

                                <%
                        
                                i++;
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <table style=" margin-top: 45px; font-size: larger; min-width: -webkit-fill-available;">
                    <thead class="thead-dark">
                                <tr style=" background-color:#cfcfcf;height:40px">
                                    <th scope="col" style="padding-left:25px;">Total</th>
                                    <th style="text-align: center;" scope="col"><c:out value="${total }"></c:out></th>
                                </tr>
                            </thead>
                    </table>
                </div>
            </div>
        </div>

<div class="col-md-6">
<div class="card mt-2">
<div class="card-body">
<h3 class="text-center text-success">Address and Details </h3>
<form action="">
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" value="${userObj.name }" class="form-control" id="inputEmail4" disabled placeholder="Full Name">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input value="${userObj.email }" disabled type="email" class="form-control" id="inputPassword4" placeholder="Email">
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Mobile no.</label>
      <input type="number" value="${userObj.phone }" disabled class="form-control" id="inputEmail4" placeholder="Mobile">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Address</label>
      <input type="text" class="form-control" id="inputPassword4" placeholder="Address">
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">landmark</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="landmark">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">City</label>
      <input type="text" class="form-control" id="inputPassword4" placeholder="City">
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="State">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Pincode</label>
      <input type="number" class="form-control" id="inputPassword4" placeholder="Pincode">
    </div>
  </div>
  <div class="form-group">
      <label for="inputState">Payment Type</label>
      <select id="inputState" class="form-control">
        <option selected>Choose...</option>
        <option>...</option>
      </select>
    </div>
    <div class="form-row">
     <div class="form-group col-md-6">
    <button style=" width: inherit;" type="submit" class="btn btn-success">Order Now</button>
    </div>
     <div class="form-group col-md-6">
    <a href="new_books.jsp" style=" width: inherit;" type="submit" class="btn btn-warning">Continue Shopping</a>
   </div>
   </div>
</form>

</div>
</div>
</div>
</div>
</div>



<%@include file="all_components/footer.jsp" %>
</body>
</html>