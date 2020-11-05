<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<title>Homepage </title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/homepage.do"> <img src="imgs/logo.png" class="profile-pic" class="img-thumbnail" border=0 style="border:0; text-decoration:none; outline:none" width="100" height="100" >
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/homepage.do"> HOME <span class="sr-only">(current)</span></a>
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
    </ul>
  </div>
</nav>
<br>
<br>
<br>
<br>
<br>

		<!-- USER HEADER -->
		<div class="container">
  		<div class="row">
  		<div class="col-sm">
  		<br>
<br>
<br>

<br>
<br>
<img src="imgs/ticket.png" class="img-fluid" alt="Responsive image">
    </div>
			<div class="col-sm">
		<h1 class ="centered">${loggedInUser.firstName} ${loggedInUser.lastName}'s Profile</h1>
		<br>
		<table>
			<tr>
				<td><img src="${loggedInUser.profileImageUrl}" alt="" border=3
					height=100 width=100></img></td>
			</tr>
		</table>
	<br>
	<br>
		<!-- USERS LIST OF FAVORITE BOARDGAMES -->
		<table>
			<tr>
				<th>Favorite Boardgame List</th>
			</tr>
			<c:forEach items="${loggedInUser.favorites}" var="boardgames">
				<tr>
					<td>${boardgames.name}</td>
				</tr>
			</c:forEach>
			<tr>
		
				<td>
					<!-- ADD FAVORITE BUTTON -->
					<form action = "homepage.do" method= "GET">
				<button type="submit">Add Favorite Game</button>
				</form>
				</td>
				<td>
					<!-- REMOVE FAVORITE BUTTON -->
					<button type="button">Remove a favorite</button>
	
				</td>
			</tr>
		</table>
	<br>
		<br>
		<!-- WINS/LOSSES/ATTENDED -->
		<table>
			<tr>
				<th>Wins</th>
				<th>Losses</th>
				<th>Games Attended</th>
			</tr>
		</table>
	<br>
		<br>
		<!-- GAMES OWNED LIST -->
		<table>
			<tr>
				<th>Games Owned</th>
			</tr>
			<c:forEach items="${loggedInUser.owned}" var="boardgames">
				<tr>
					<td>${boardgames.name}</td>
				</tr>
			</c:forEach>
			<tr>
				<!-- ADD OWNED BOARDGAME -->
				<td>
				<form action = "homepage.do" method= "GET">
				<button type="submit">Add Owned Game</button>
				</form>
				</td>				
			</tr>
		</table>
			<br>	
			<br>

		
		<!-- CREATE NEW EVENT -->
		<button type="button">Create an Event</button>
			<br>
				<br>
		
  <a href="newGameForm.do" class="btn btn-secondary" role="button">Add a New Game </a>
		<!-- BACK TO HOME -->
		<!-- <form action="homepage.do">
    <button type="submit">Home</button>
</form> -->
	</div>
	 </div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html> 