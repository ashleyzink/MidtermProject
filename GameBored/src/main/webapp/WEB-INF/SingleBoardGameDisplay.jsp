<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
</head>
<body>
<c:choose>
			<c:when test="${! empty game}">
	<h3>ID: ${game.id }</h3>
	
	<h1>${game.name }</h1>
	
	<img src="${game.boxArtUrl}" alt="" border=3 height=100 width=100></img>
	
	<h3>${game.publisher.name }</h3>
	
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
           <input type= "text" value="${game.id}" name="id" >
           
           
       
      
            <input type="submit" value="submit"/>
      
       </form>


       </c:when>
       
       </c:choose>
       
       
		
		
		
			</c:when>
			<c:otherwise>
			<h2>We could not find your game in our current inventory.</h2>
				</c:otherwise>
		</c:choose>
</body>
</html>