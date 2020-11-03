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
			<c:forEach items="${boardgames}" var="boardgames">
				<tr>
					<td>${user.favorites}</td>
				</tr>
			</c:forEach>
			<tr>
				<td>
					<!-- ADD FAVORITE BUTTON -->
					<form action = "gameList.do" method= "GET">
				<button type="submit">Add a favorite</button>
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
				<th>games owned by user</th>
			</tr>
			<c:forEach items="${boardgames}" var="boardgames">
				<tr>
					<td>${user.owned}</td>
				</tr>
			</c:forEach>
			<tr>
				<!-- ADD OWNED BOARDGAME -->
				<td>
				<form action = "gameList.do" method= "GET">
				<button type="submit">Add an owned game</button>
				</form>
				</td>				
			</tr>
		</table>

		
		<!-- CREATE NEW EVENT -->
		<button type="button">Create an Event</button>
		
		<!-- BACK TO HOME -->
		<button type="button">Home</button>
	
	</div>
 
</body>
</html>