<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 비밀번호 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<style>
._btn, .input-group-addon{
	background-color: rgb(26, 188, 156) ;
	color: white; 
}
.input-group {
    margin-top: 1em;
    margin-bottom: 1em;
} 



.login-box {
    line-height: 2.3em;
    font-size: 1em;
    color: #aaa;
    margin-top: 1em;
    margin-bottom: 1em;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
}


</style>
<script>
 	function OnSubmitCheck(){
 		alert('메일 발송까지  최대 2분 걸립니다.\n메일이 정상 발송되면 메시지가 출력됩니다.\n잠시만 기다려 주세요. ');
 	}
</script>
</head>
<body>
<div>
		<div class="row" style="height:800px">
			<div class="col-md-3" style="width:100%;"> 
				<div class="login-box well" style="width:600px; margin-left: auto; margin-right:auto; margin-top:100px;">
					<form accept-charset="UTF-8" role="form" method="post" action="<c:url value='/'/>support/FindPassword">
						<legend>비밀번호 찾기</legend>
						<span class='text-center'>가입시 정보를 입력하여 주세요</span><br>  
						<span class='text-center'><strong>비밀번호</strong>는 가입하실때 입력하신 <strong>Email</strong>로 발송 됩니다</span>
						<div class="input-group">    
							<span class="input-group-addon">&nbsp&nbsp&nbsp&nbspID&nbsp&nbsp&nbsp</span>  
							<input name="userId" type="text" placeholder="ID을 입력하세요" class="form-control">
						</div>
						<div class="input-group">   
							<span class="input-group-addon">&nbsp&nbsp이름&nbsp&nbsp</span> 
							 <input name="name" type="text" placeholder="이름을 입력하세요" class="form-control" >
						</div>
						<div class="input-group"> 
							<span class="input-group-addon">EMAIL</span> 
							<input name="email" type="text" placeholder="EMAIL를 입력하세요" class="form-control">
						</div>
						<input class="btn btn-default btn-block _btn" type="submit" onclick="OnSubmitCheck()" value="비밀번호 찾기">
					</form>
				</div>
			</div>
		</div>
	<!-- <h5>가입시 정보를 입력하여 주세요</h5>
	<form action="../support/FindPassword" method="post">
		ID : <input name="userId" type="text"><br>
		이름 : <input name="name" type="text"><br>
		EMAIL : <input name="email" type="text" ><input type="submit" value="ID 찾기">
	</form>
	<h5>비밀번호는 가입하실때 입력하신 Email로 발송 됩니다</h5> -->

	</div>
</body>
</html>