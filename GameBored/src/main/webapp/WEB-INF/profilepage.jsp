<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
</head>
<body>
	<div>
		<!-- USER HEADER -->
		<h1>${user.firstName} ${user.lastName}'s Profile</h1>
		<table>
			<tr>
				<td><img src="${user.profileImageUrl}" alt="" border=3
					height=100 width=100></img></td>
			</tr>
		</table>

		<!-- USERS LIST OF FAVORITE BOARDGAMES -->
		<table>
			<tr>
				<th>Favorite Boardgame List</th>
			</tr>
			<c:forEach items="${user.favorites}" var="boardgames">
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

		<!-- WINS/LOSSES/ATTENDED -->
		<table>
			<tr>
				<th>Wins</th>
				<th>Losses</th>
				<th>Games Attended</th>
			</tr>
		</table>

		<!-- GAMES OWNED LIST -->
		<table>
			<tr>
				<th>Games Owned</th>
			</tr>
			<c:forEach items="${user.owned}" var="boardgames">
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

		
		<!-- CREATE NEW EVENT -->
		<button type="button">Create an Event</button>
		
		<!-- BACK TO HOME -->
		<form action="homepage.do">
    <button type="submit">Home</button>
</form>
  <a href="newGameForm.do" class="btn btn-secondary" role="button">Add a New Game </a>
	</div>
 
</body>
</html>