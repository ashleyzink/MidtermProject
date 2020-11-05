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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="image-cropper">
  <a class="navbar-brand" href="homepage.do"> <img src="imgs/logo.png" class="profile-pic" class="img-thumbnail" border=0 style="border:0; text-decoration:none; outline:none" width="100" height="100" >
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
        <a class="nav-link" href="profilepage.do">PROFILE</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="getUsers.do">SHOW USERS </a>
      </li>
 
      </c:when>
	</c:choose>
	
      <li class="nav-item">
        <a class="nav-link" href="loginbutton.do">LOGIN</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="register.do">REGISTER</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.do">LOGOUT</a>
      </li>
    </ul>
  </div>
</nav>
  <div>
    <h1 style="text-align:center">Admin Only! </h1>
  	<br>
  	 <c:choose>
  	    	<c:when test="${sessionScope.loggedInUser.role eq 'ADMIN'}">
  	      
  	      	<h3>
			BoardGame ID: ${game.id} <br> BoardGame Name: ${game.name} <br>
			BoardGame Description: ${game.description} <br>
			</h3>
  	   		 <form action="updateGame.do" method="POST">
  	   		 	  <input type="hidden" name="id" value="${game.id}"> 
				<label for="name">Board Game Name:</label>
			      <input type="text" name="name" value="${game.name}">
			      <br>
				<label for="description">Description of Board Game:</label>
			      <input type="text" name="description" value="${game.description}">
			      <br>
				<label for="minPlayers">Minimum # of Players:</label>
			      <input type="text" name="minPlayers" value="${game.minPlayers}">
			      <br>
				<label for="maxPlayers">Maximum # of Players:</label>
			      <input type="text" name="maxPlayers" value="${game.maxPlayers}">
			      <br>
				<label for="playTimeMinutes">Avg Time to Play:</label>
			      <input type="text" name="playTimeMinutes" value="${game.playTimeMinutes}">minutes
			      <br>
			  	<label for="category">Category/Play Style:</label>
			      <select name="catId" id="category">   
					<option value="${game.category.id}" selected>${game.category.name}</option>
					<c:forEach items="${categories}" var="cat">
					<option value="${cat.id}" >${cat.name}</option>
					</c:forEach>      
			      </select>
			      <br>
			  	<label for="genre">Genre:</label>
			      <select name="genId" id="genre" >  
					<option value="${game.genre.id}" selected>${game.genre.name}</option>
					<c:forEach items="${genres}" var="gen">
					<option value="${gen.id}">${gen.name}</option>
					</c:forEach>      
			      </select>
			      <br>
			  	<label for="publisher">Publisher:</label>
			      <select name="pubId" id="publisher">   
					<option value="${game.publisher.id}" selected>${game.publisher.name}</option>
					<c:forEach items="${publishers}" var="pub">
					<option value="${pub.id}" >${pub.name}</option>
					</c:forEach>      
			      </select>
			      <br>
			    <label for="cost">Cost:</label>
			      <input type="text" name="cost" value="${game.cost}">
			      <br>
			    <label for="boxArtUrl">Box Art URL:</label>
			      <input type="text" name="boxArtUrl" value="${game.boxArtUrl}">
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
</body>
</html>