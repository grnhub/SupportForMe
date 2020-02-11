<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user/getUsers.jsp</title>
</head>
<body>
	<form action="updateUser.do">
		id :<input name="id" type="text" value="${user.id}" readonly="readonly"><br>
		pw: <input name="password" type="text" value="${user.password}"><br>
		name : <input name="name" type="text" value="${user.name}"><br>
		role :
	<select name="searchCondition">
	<c:forEach items="roleMap" var="role">
		<option value="${role.key}">${role.value}</option>
	</c:forEach>		
	</select><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>