<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"	rel="stylesheet">
<style>
._form {
	/* margin: 0 auto;
	width: 800px;
	margin-top: 200px; */
	margin-top:15px;
} 

._btn {
	margin-left: 15px;
	background: rgb(26, 188, 156);
	color: white;
}

._btn:hover {
	background: grey;
	color: white;
}
</style>

</head>

<body>
<div style="height:70px"></div>
<h3>프로필 설정</h3>
<hr>
<div style="margin-left:auto;margin-right:auto;width:1100px;margin-top:100px;height:300px">
<h3>비밀번호를 입력하여 주세요.</h3>

<form action="<c:url value='/'/>forme/MemberUpdatePassWordCheck" method="post" class="_form">
	<div class="input-group">
		<input type="password" class="form-control" name="password" id = "password" style="width:550px;">
		<input type="submit" value="확인" style="width:150px;" class="btn _btn " >
	</div>
</form>
</div>
</body>
</html>