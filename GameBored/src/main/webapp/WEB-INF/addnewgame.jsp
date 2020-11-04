<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Homepage </title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">gameBored</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <c:choose>
    <c:when test="${loggedInUser.id>0}">
      <li class="nav-item">
        <a class="nav-link" href="/profilepage.do">Profile</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/getUsers.do">Search for other users </a>
      </li>
 
      </c:when>
	</c:choose>
	
      <li class="nav-item">
        <a class="nav-link" href="/loginbutton.do">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/register.do">Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/logout.do">Logout</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown link
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
  <div>
    <h1 style="text-align:center">Admin Only! </h1>
  	<br>
  	 <c:choose>
  	    	<c:when test="${sessionScope.loggedInUser.role eq 'ADMIN'}">
  	      
  	   		 <form action="addGame.do" method="POST">
				<label for="name">Board Game Name:</label>
			      <input type="text" name="name" value="name">
			      <br>
				<label for="description">Description of Board Game:</label>
			      <input type="text" name="description" value="description">
			      <br>
				<label for="minPlayers">Minimum # of Players:</label>
			      <input type="text" name="minPlayers" value="2">
			      <br>
				<label for="maxPlayers">Maximum # of Players:</label>
			      <input type="text" name="maxPlayers" value="4">
			      <br>
				<label for="playTimeMinutes">Avg Time to Play:</label>
			      <input type="text" name="playTimeMinutes" value="30">minutes
			      <br>
			  	<label for="category">Category/Play Style:</label>
			      <select name="catId" id="category">   
					<c:forEach items="${categories}" var="cat">
					<option value="${cat.id}">${cat.name}</option>
					</c:forEach>      
			      </select>
			  	<label for="genre">Genre:</label>
			      <select name="genId" id="genre">   
					<c:forEach items="${genres}" var="gen">
					<option value="${gen.id}">${gen.name}</option>
					</c:forEach>      
			      </select>
			  	<label for="publisher">Publisher:</label>
			      <select name="pubId" id="publisher">   
					<c:forEach items="${publishers}" var="pub">
					<option value="${pub.id}">${pub.name}</option>
					</c:forEach>      
			      </select>
			    <label for="cost">Cost:</label>
			      <input type="text" name="cost" value="">
			      <br>
			    <label for="boxArtUrl">Box Art URL:</label>
			      <input type="text" name="boxArtUrl" value="">
			      <br>
			      <input type="submit" class="btn btn-secondary" value="submit">
      		</form>
  	   </c:when>
  	  	<c:otherwise>
  	  	<div class="container"> <h2>I'm sorry, this page is for Admin only</h2><br>
				<p>
				<a href="profilePage.do" class="btn btn-secondary" role="button">Go to Profile Page </a>
				</p>
				<p>
				<a href="homepage.do" class="btn btn-secondary" role="button">Go to Home page </a>
				</p>
				</div>
  	  	</c:otherwise>
  	  </c:choose> 
  </div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html> 