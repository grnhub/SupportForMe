<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
${user }<hr>
	<form action="login.do" method="post">
		id :<input name="id" type="text" value="${user.id}" ><br>
		pw: <input name="password" type="text" value="${user.password}"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>