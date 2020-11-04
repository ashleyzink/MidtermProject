<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Users</title>
</head>
<body>

		<!-- USER HEADER -->
<c:forEach var="user" items="${users}">
${user.firstName}<td>
</c:forEach>
		
</body>
</html>