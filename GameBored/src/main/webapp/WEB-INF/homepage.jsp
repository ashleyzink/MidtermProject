<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage </title>
</head>
<body>
<div>




<form action="login.do" method="GET">
 <p>LOGIN</p>p>
 
 Username: <input type="text" name="username"/>
 Password: <input type="text" name="password"/>
  <input type="submit" value="Login " />

</form> 

<form action="register.do" method="GET">
 <p>REGISTER</p>
  <input type="button" value="Register " />

</form> 



</body>
</html>