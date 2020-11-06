<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>Login</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="image-cropper">
			<a class="navbar-brand" href="homepage.do"> <img
				src="imgs/logo.png" class="profile-pic" class="img-thumbnail"
				border=0 style="border: 0; text-decoration: none; outline: none"
				width="100" height="100">
			</a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="homepage.do">HOME <span class="sr-only">(current)</span></a>
				</li>
				<c:choose>
					<c:when test="${loggedInUser.id>0}">
						<li class="nav-item"><a class="nav-link"
							href="profilepage.do">PROFILE</a></li>
						<li class="nav-item"><a class="nav-link" href="getUsers.do">SHOW
								USERS </a></li>
					</c:when>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="loginbutton.do">LOGIN</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="register.do">REGISTER</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="logout.do">LOGOUT</a>
				</li>
			</ul>
		</div>
	</nav>
	<!-- USER HEADER -->
	<br>
	<div class="jumbotron">
		<div class="row align-items-center">
			<div class="col mx-auto">
				<h1 class="serif display-4 text-center">${loggedInUser.firstName}
					${loggedInUser.lastName}'s Profile</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col">
				<table>
					<tr>
						<td><img src="${loggedInUser.profileImageUrl}" alt=""
							border=3 height=300 width=300></img></td>
					</tr>
				</table>
			</div>
			<!-- USERS LIST OF FAVORITE BOARDGAMES -->
			<div class="col">
				<table class="table w-90 bg-info text-white">
					<tr>
						<th>Favorite Board Game List</th>
					</tr>
				</table>
				<table class="table table-striped w-90">
					<c:forEach var="boardgames" items="${loggedInUser.favorites}">
						<tr>
							<td><a href="getGame.do?id=${boardgames.id}">
						<h5>${boardgames.name}</h5></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br> <br> <br>
			<!-- GAMES OWNED LIST -->
			<div class="col">
				<table class="table w-90 bg-info text-white">
					<tr>
						<th>Game Owned</th>
					</tr>
				</table>
				<table class="table table-striped w-90">
					<c:forEach var="boardgames" items="${loggedInUser.owned}">
						<tr>
							<td><a href="getGame.do?id=${boardgames.id}">
						<h5>${boardgames.name}</h5></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<br> <br> <br>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg align-self-center">
					<h5 class="text-center">Game Events Attended</h5>
					<p class="text-center">GAMA Expo: March 9-12 Peppermill Resort in Reno, Nevada
						Booth #445</p>
					<br> 
					<br>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col align-self-center">
					<!-- CREATE NEW EVENT -->
					<button type="submit" class="btn btn-info btn-sm">Create
						an Event</button>
					<br> <br>
					<!--  <a href="newGameForm.do" class="btn btn-secondary" role="button">Add a New Game </a> -->
				</div>
				<c:choose>
					<c:when test="${sessionScope.loggedInUser.role eq 'ADMIN'}">
						<form action="newGameForm.do" method="GET">
							<button type="submit" class="btn btn-info btn-sm">Add
								New Game</button>
						</form>
					</c:when>
				</c:choose>
				<!-- BACK TO HOME -->
				<!-- <form action="homepage.do">
    <button type="submit">Home</button>
</form> -->
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
			integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
			integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
			crossorigin="anonymous"></script>
</body>
</html>