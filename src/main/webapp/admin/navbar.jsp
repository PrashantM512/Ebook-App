<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty userObj }">
<c:redirect url="../login.jsp"/>
</c:if>
<div class="container-fluid p-3" style="background-color:white;">
<div class="row">
<div class="col-md-3 text-success">
<h3><i class="fa-solid fa-book"></i>&nbsp;E-Books</h3>
</div>
<div class="col-md-6">
<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>
<div class="col-md-3">

<c:if test="${not empty userObj }">
<a class="btn btn-primary text-white"><i class="fas fa-user"></i> ${userObj.name}</a>
<a href="" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-sign-out-alt"></i> Logout</a>
</c:if>

<c:if test="${empty userObj }">
<a href="../login.jsp" class="btn btn-success">Login</a>
<a href="../register.jsp" class="btn btn-primary">Register</a>
</c:if>
</div>
</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     <!--  <li class="nav-item active">
        <a class="nav-link" href="#">New Books</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">Recent Books</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">Old Books</a>
      </li> -->
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
     
      <button class="btn btn-light my-2 my-sm-0 " type="submit"><i class="fa-solid fa-gear"></i> Settings</button>
       <button class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-phone"></i> Contact Us</button>
    </form>
  </div>
</nav>