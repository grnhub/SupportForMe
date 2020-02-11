<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	var path = "<c:url value='/'/>";
	function Confirm(){
		var check = confirm('정말 탈퇴 하시겠습니까?');
		if(check){
			var form = document.getElementById('frm');
			form.submit();
		}
	}
</script>
<style>
._form {
	margin: 0 auto;
	width: 800px;
	margin-top: 200px;
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

h3 {
	margin-top: 50px;
}
</style>
<body>
<h3>회원 탈퇴</h3>
<hr>
<h3>회원 탈퇴를 하시려면 비밀번호를 입력하여 주세요.</h3>
	<form id="frm" action="<c:url value='/'/>forme/MemberDeletePassWordCheck" method="post" class="_form">
		<div class="input-group">
			<input type="password" name="password" id = password class="form-control" style="width:550px;">
			<input type="submit" onclick="Confirm()" value="확인" style="width:150px;" class="btn _btn ">
		</div>
	</form>
</body>
</html>