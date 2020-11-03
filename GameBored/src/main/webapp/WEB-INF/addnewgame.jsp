<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Board Game</title>
</head>
<body>
  <div>
    <h1 style="text-align:center">Admin Only! </h1>
  	<br>
  	<h6>${session} Testing if this prints</h6>
  	  <%-- <c:choose>
  	    	<c:when test="${session.loggedInUser.role eq 'ADMIN'}"> --%>
  	      
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
			      <select name="category" id="category">   
					<c:forEach items="${categories}" var="cat">
					<option value="${cat.id}">${cat.name}</option>
					</c:forEach>      
			      </select>
			  	<label for="genre">Genre:</label>
			      <select name="genre" id="genre">   
					<c:forEach items="${genres}" var="gen">
					<option value="${gen.id}">${gen.name}</option>
					</c:forEach>      
			      </select>
			  	<label for="publisher">Publisher:</label>
			      <select name="publisher" id="publisher">   
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
      		</form>
  	   	<%--  </c:when>
  	  	<c:otherwise>
  	  	<div class="container"> <h2>I'm sorry, this page is for Admin only</h2><br>
				<h3>Y </h3><br>
				<p>
				<a href="profilePage.do" class="btn btn-secondary" role="button">Go to Profile Page </a>
				</p>
				<p>
				<a href="homepage.do" class="btn btn-secondary" role="button">Go to Home page </a>
				</p>
				</div>
  	  	</c:otherwise>
  	  </c:choose> --%>
  </div>
</body>
</html>