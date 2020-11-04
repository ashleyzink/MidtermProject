<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

</head>
<body>
	

	<title>Homepage</title>
	<div class="jumbotron" >
  <h1 class="display-4 text-center">Game Bored</h1>
  <p class="lead text-center"">The Board Game social media platform</p>
</div>
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
        <a class="nav-link" href="/homepage.do">Home <span class="sr-only">(current)</span></a>
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
	<!-- DROPDOWN SEARCH LIST -->
	<form action="gameList.do" method="GET" class="d-flex justify-content-center md-form form-sm">
		<select id="searchType" name="searchType">
			<option value="genre">Genre</option>
			<option value="category">Category</option>
			<option value="publisher">Publisher</option>
			<option value="numPlayers">Number of Player</option>
			<option value="keyword">Keyword</option>
		</select> 
		
		<input name="searchTerm" required="required" class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Search"
    aria-label="Search" /> 
	</form>

<div class="container" >
  <div class="row">
    <div class="col">
	<!-- TABLE OF LINKS -->
	<br>
	<br>
	<table><tr><th>BoardGames</th></tr></table>
	<br>
	<table class="table table-striped">
		<c:forEach var="gameIndiv" items="${gameList}">
			<tr>
				<td><a href="getGame.do?id=${gameIndiv.id}">
						${gameIndiv.name}</a>
				<td>
			</tr>
		</c:forEach>
	</table>
    </div>
    <div class="col">
	<!-- COMMUNITY COMMENT -->
<br>
<br>
	<table><tr><th>Community Comments</th></tr></table>
	<br>
	<table class="table table-striped">
	<c:forEach var="commentL" items="${commentsList}">
		<tr>
			<td>${commentL.commentDate}
			<td>
		</tr>
		<tr>
			<td>${commentL.commentText}
			<td>
		</tr>
	</c:forEach>
	</table>

	<c:choose>
		<c:when test="${loggedInUser.id>0}">
			<form action="addCommunityComment.do" method="POST">
				<p>Add a comment</p>
				<textarea name="commentText"></textarea>
				<input type="submit" role="button" />
			</form>
		</c:when>
	</c:choose>
    </div>
  </div>
</div>



	<!-- ADMIN CRUD BUTTON?  -->
	<c:choose>
		<c:when test="${user.role} = ADMIN">
			<form action="adminCrud.do" method="GET">
				<p>Admin CRUD</p>
				<input type="button" value="Submit" />
			</form>
		</c:when>
	</c:choose>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html> 