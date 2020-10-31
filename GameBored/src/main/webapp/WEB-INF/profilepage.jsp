<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page </title>
</head>
<body>
<div>
<h1>Profile</h1>
 <p>USERNAME: ${user.username}</p>
 <p>FIRST NAME: ${user.firstName}</p>
 <p>LAST NAME:${user.lastName}</p>
 <p>EMAIL: ${user.Email}</p>
</div>

</body>
</html>