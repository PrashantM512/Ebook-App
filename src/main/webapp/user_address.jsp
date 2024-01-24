<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/allCss.jsp" %>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>

<diV class="container">
<diV class="row pt-5 pb-5">
<diV class="col-md-6 offset-md-4">
<diV class="card" style=" background-color: #f1f1f1;">
<diV class="card-body">
<h3 class="text-center" style="padding-bottom:5px;">Add Your Address</h3>
<form action="">
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Address</label>
      <input type="text" value="" class="form-control" id="inputEmail4" placeholder="Address">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">landmark</label>
      <input value=""  type="text" class="form-control" id="inputPassword4" placeholder="landmark">
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">City</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="city">
    </div>
    <div class="form-group col-md-6">
     
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" value="" class="form-control" id="inputEmail4" placeholder="State">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Zip</label>
      <input value=""  type="text" class="form-control" id="inputPassword4" placeholder="zip">
    </div>
  </div>

    </div>
  </div>
     <div class="form-group">
    <button type="submit" class="btn btn-warning">Add Address</button>
   </div>

</form>

</diV>
</diV>
</diV>
</diV>
</diV>
<%@include file="all_components/footer.jsp" %>
</body>
</html>