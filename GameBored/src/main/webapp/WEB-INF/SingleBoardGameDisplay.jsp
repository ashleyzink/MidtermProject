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
        <a class="nav-link" href="/homepage.do">HOME <span class="sr-only">(current)</span></a>
      </li>
      
      <c:choose>
    <c:when test="${loggedInUser.id>0}">
      <li class="nav-item">
        <a class="nav-link" href="/profilepage.do">PROFILE</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/getUsers.do">SEARCH FOR OTHER USERS </a>
      </li>
 
      </c:when>
	</c:choose>
	
      <li class="nav-item">
        <a class="nav-link" href="/loginbutton.do">LOGIN</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/register.do">REGISTER</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/logout.do">LOGOUT</a>
      </li>
    </ul>
  </div>
</nav>
<c:choose>
			<c:when test="${! empty game}">
	<h3>ID: ${game.id }</h3>
	
	<h1>${game.name }</h1>
	
	<img src="${game.boxArtUrl}" alt="" border=3 height=100 width=100></img>
	
	<h3>Publisher: ${game.publisher.name }</h3>
	
	<img src="${game.publisher.logoUrl}" alt="" border=3 height=50 width=50></img>
	
<p>${game.description} </p>


	<ul>
	   <li>Min Players: ${game.minPlayers }</li>
	   <li>Max Players: ${game.maxPlayers }</li>
	   <li>Cost: ${game.cost }</li>
	   <li>Play Time ${game.playTimeMinutes } mins</li>
	</ul> 
	   <table>
	   
          <c:forEach var="comment" items="${game.boardGameComments}">
               <tr>
               <td>${comment.user.username}: </td>
               <td>${comment.commentText}</td>
               </tr>
          </c:forEach>    
       </table> 
       
       <c:choose>
       <c:when test="${loggedInUser.id>0 }">

         <form action="addBoardGameComment.do" method="POST">	
     
            <textarea name="commentText"></textarea>

            <input type= "hidden" value="${game.id}" name="id" >


            <input type="submit" value="submit"/>
      
          </form>
        </c:when>
       </c:choose>
       <h4> Users with this game in their favorites list</h4>
       <c:forEach var="user" items="${game.userWithFavs}">
		       <tr>

               <td>${user.firstName} ${user.lastName}  --- UserName: ${user.username} </td>

               </tr>
	   </c:forEach> 
	   	   <c:set var="containsFav" value="false" />
<c:forEach var="item" items="${loggedInUser.favorites}">
  <c:if test="${item.name eq game.name}">
    <c:set var="containsFav" value="true" />
  </c:if>
</c:forEach>
	  
                <c:choose>
      <c:when test="${containsFav eq false and loggedInUser.id > 0 }">
                <form action="addToFavs.do" method="GET">	
            <input type= "hidden" value="${game.id}" name="gameId" >
            <input type= "hidden" value="${loggedInUser.id}" name="userId" >
          
            <input type="submit" value="Add this game to your favorites"/>
             </form>
	    </c:when>
       </c:choose>
      
      
       <h4> Users with this game in their owned list</h4>
       <c:forEach var="user" items="${game.userWithOwned}">
		       <tr>

               <td>${user.firstName}, ${user.lastName}   --- UserName: ${user.username} </td>

               </tr>
	   </c:forEach> 
	   
	   <c:set var="contains" value="false" />
<c:forEach var="item" items="${loggedInUser.owned}">
  <c:if test="${item.name eq game.name}">
    <c:set var="contains" value="true" />
  </c:if>
</c:forEach>
	   
	     <c:choose>
       <c:when test="${contains eq false and loggedInUser.id > 0}">
                <form action="addToOwned.do" method="GET">	
            <input type= "hidden" value="${game.id}" name="gameId" >
            <input type= "hidden" value="${loggedInUser.id}" name="userId" >
          
            <input type="submit" value="Add this game to your owned list"/>
             </form>
               </c:when>
       </c:choose>
       
       
       
       
			</c:when>
			<c:otherwise>
			<h2>We could not find your game in our current inventory.</h2>
				</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${sessionScope.loggedInUser.role eq 'ADMIN'}">
			<form action="goToUpdateForm.do" method="GET">
					<button type="submit" name="id" value="${game.id}">Update</button>
			</form>
			</c:when>
		</c:choose>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

</body>
</html> 