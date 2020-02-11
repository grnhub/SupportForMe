<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user/getUsers.jsp</title>
</head>
<script>
	function go_page(p){
		document.frm.page.value=p;
		document.frm.submit();
		
	}
	
	function sort(s){
		document.frm.sort.value= s;
		document.frm.submit();
	}
</script>
<body>
<img src="./resources/images/images.jpg" style="width:200px;">
<form action="getUsers.do" name="frm">
	<input type="hidden" name="page" value="1">
	<input type="hidden" name="sort" value="">
	Role:
	
	<select name="role">
	<option value="" selected="selected">전체</option>
	<c:forEach items="${roleMap}" var="role">
		<option value="${role.key}">${role.value}</option>
	</c:forEach>		
	</select>
		<script>
		document.frm.searchCondition.value ='${userSearchDTO.searchCondition}';
	</script>
	<script>
		document.frm.role.value ='${userSearchDTO.role}';
	</script>
	
	<select name="searchCondition">
		<option value="id"<c:if test="${userSearchDTO.searchCondition}== id"><%out.print("selected='selected'"); %></c:if>>아이디</option>	
		<option value="name" <c:if test="${userSearchDTO.searchCondition}== name"><%out.print("selected='selected'"); %></c:if>>이름</option>
	</select>
	<script>
		document.frm.searchCondition.value ='${userSearchDTO.searchCondition}';
	</script>
	<input type="text" name="searchKeyword" value="${userSearchDTO.searchKeyword}">
	<input type="submit" value="검색">
</form>
<table border="1" style="width:500px;">
	<tr>
		<td><a href="#" onclick="sort('id')">아이디</a></td>
		<td><a href="#" onclick="sort('name')">이름</a></td>
		<td>패스워드</td>
		<td>롤</td>
		</tr>
	<c:forEach items="${list}" var="user">
		<tr><td><a href="updateUserForm.do?id=${user.id}">${user.id}</a></td><td>${user.name}</td><td>${user.password}</td><td>${user.role}</td></tr>
	</c:forEach>
</table>
<my:paging paging="${paging}"/>
<input type="button" value="가입하기" onclick="location.href='insertUserForm.do'">
</body>
</html>