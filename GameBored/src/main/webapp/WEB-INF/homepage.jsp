<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage </title>
</head>
<body>
<!-- LOGIN BUTTON  -->
<form action="loginbutton.do" method="GET">
<input type="submit" value="LOGIN" />
</form> 

<!-- REGISTRATION BUTTON -->
<form action="register.do" method="GET">
  <input type="submit" value="REGISTER"/>
</form> 

<!-- DROPDOWN SEARCH LIST -->
<form action="gameList.do" method="GET">
<select id="searchType" name="searchType">
  <option value="genre">Genre</option>
  <option value="category">Category</option>
  <option value="publisher">Publisher</option>
  <option value="numPlayers">Number of Player</option>
  <option value="keyword">Keyword</option>
</select>
<input type="text" name="searchTerm" required= "required"/>
<input type="submit" value="Submit"/>
</form>


<!-- TABLE OF LINKS -->
<table>
<c:forEach var="gameIndiv" items="${gameList}">
<tr>
<td><a href = "getGame.do?id=${gameIndiv.id}"> ${gameIndiv.name}</a><td>
 </tr>
</c:forEach>
</table>

<!-- COMMUNITY COMMENT -->
<!--After creating a new comment in the community comment, should we return the list of comments 
in the Community comment DAO (limit 5 maybe?)  -->
<!-- Also need to redirect mapping for  addCommunityComment.do to homepage -->
<form action="addCommunityComment.do" method="POST">
<p> Community Comments</p>
<c:forEach var="comment" items="${comments}"> 
 <br>
<tr>
<td>${comment.commentDate}<td>
 </tr>
<tr>
<td>${comment.commentText}<td>
 </tr>
 <br>
</c:forEach>

<p> Add a comment </p>
<textarea name="comment"></textarea>
<input type="submit" role="button"/>
</form>
<!-- https://www.smashingmagazine.com/2012/05/building-real-time-commenting-system/ -->


<!-- ADMIN CRUD BUTTON?  -->
<c:choose>
    <c:when test="${user.role} = ADMIN">
      <form action="adminCrud.do" method="GET">
	<p> Admin CRUD </p><input type="button" value="Submit" />
	</form>
	</c:when>
</c:choose>


</body>
</html>