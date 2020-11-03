<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Registration Page </title>
</head>
<body>
<div>


<h1>REGISTER</h1>

<form action="registration.do" method="POST">
 
<table>
<tr><td> Username: <input type="text" name="username" required="required" /></td></tr> 
<tr><td> Password: <input type="text" name="password" required="required"/></td></tr> 
<tr><td> First Name: <input type="text" name="firstName" required="required"/></td></tr> 
<tr><td> Last Name: <input type="text" name="lastName" required="required"/></td></tr> 
<tr><td> Email: <input type="text" name="email" required="required"/></td></tr> 
<tr><td> Profile Pic URL: <input type="text" name="profileImageUrl" required="required"/></td></tr> 
 

 
<tr><td> <input type="submit" value="Register" /></td></tr> 
 </table>
 </form>

</div>

</body>
</html>