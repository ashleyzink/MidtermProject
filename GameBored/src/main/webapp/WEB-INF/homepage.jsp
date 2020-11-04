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
	<div class="jumbotron">
  <h1 class="display-4">Game Bored</h1>
  <p class="lead">The Board Game social media platform</p>
</div>
	<!-- LOGIN BUTTON  -->
	<form action="loginbutton.do" method="GET">
		<input type="submit" value="LOGIN" />
	</form>

	<!-- REGISTRATION BUTTON -->
	<form action="register.do" method="GET">
		<input type="submit" value="REGISTER" />
	</form>

	<!-- DROPDOWN SEARCH LIST -->
	<form action="gameList.do" method="GET">
		<select id="searchType" name="searchType">
			<option value="genre">Genre</option>
			<option value="category">Category</option>
			<option value="publisher">Publisher</option>
			<option value="numPlayers">Number of Player</option>
			<option value="keyword">Keyword</option>
		</select> <input type="text" name="searchTerm" required="required" /> <input
			type="submit" value="Submit" />
	</form>



<div class="container">
  <div class="row">
    <div class="col">
	<!-- TABLE OF LINKS -->
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

	<p>Community Comments</p>
	<table class="table table-striped">
	<c:forEach var="commentL" items="${commentsList}">
		<br>
		<tr>
			<td>${commentL.commentDate}
			<td>
		</tr>
		<tr>
			<td>${commentL.commentText}
			<td>
		</tr>
		<br>
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

	<!-- LOGIN BUTTON  -->
	<form action="logout.do" method="GET">
		<input type="submit" value="LOGOUT" />
	</form>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>