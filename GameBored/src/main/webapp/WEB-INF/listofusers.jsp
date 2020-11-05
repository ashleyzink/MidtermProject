<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Login </title>
</head>
<body>
<div class="container-fluid">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="image-cropper">
  <a class="navbar-brand" href="/homepage.do"> <img src="imgs/logo.png" class="profile-pic" class="img-thumbnail" border=0 style="border:0; text-decoration:none; outline:none" width="100" height="100" >
</div>
</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="homepage.do">HOME <span class="sr-only">(current)</span></a>
      </li>
      
      <c:choose>
    <c:when test="${loggedInUser.id>0}">
      <li class="nav-item">
        <a class="nav-link" href="/profilepage.do">PROFILE</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/getUsers.do">SEARCH FOR OTHER USERS </a>
      </li>
 
      </c:when>
	</c:choose>
	
      <li class="nav-item">
        <a class="nav-link" href="/loginbutton.do">LOGIN</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/register.do">REGISTER</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/logout.do">LOGOUT</a>
      </li>
    </ul>
  </div>
</nav>

		<!-- USER HEADER -->
		<br>
<div class="container">
  <div class="row">
    <div class="col-md-auto">
     <div class="jumbotron jumbotron-fluid">
  <div class="container">
  	<br>
		<br>
		<br>
		<br>
		<br><br>
		<br><br>
		<br>
    <h1 class="display-4">D I S C O V E R</h1>
   
	<br>
    <h1 class="display-4">U S E R S</h1>
    <p class="lead"></p>
    <br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
  </div>
  </div>
</div>
   <div class="col">
    <c:forEach var="user" items="${users}">
<a href="getUserById.do?id=${user.id}"><h3 class="text-left">${user.username}</h3></a>
 <img src="${user.profileImageUrl}" alt="" border=3
					height=270 width=270></img> 
							<br>
							<br>
							<br>
							<br>
		<br>
</c:forEach>
    </div>
    </div>
  </div>


</div>
		
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html> 