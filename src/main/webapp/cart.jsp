<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<%@include file="all_components/allCss.jsp" %>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-6">
<div class="card mt-2">
<div class="card-body">
<h3 class="text-center text-success">Your Selected Items</h3>
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
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
      <input type="text" class="form-control" id="inputEmail4" placeholder="Full Name">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" placeholder="Email">
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Mobile no.</label>
      <input type="number" class="form-control" id="inputEmail4" placeholder="Mobile">
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
    <button  style=" width: inherit;" type="submit" class="btn btn-warning">Continue Shopping</button>
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