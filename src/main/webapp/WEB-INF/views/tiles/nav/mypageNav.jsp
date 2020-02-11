<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#project_mypage_menu {
	margin-left: 25px;
}

#mypage_list {
	margin-left: 20px;
}

#project_mypage_menu nav div {
	height: 35px;
	padding: 6px 10px;
	font-size: 18px;
	margin:10px 0px;
}

.project_box {
	width: 255px;
	height: 420px;
	border: 1px solid lightgrey
}

.project_state {
	border: 1.5px solid rgb(211, 84, 0);
	border-radius: 5px;
	color: rgb(211, 84, 0);
	padding-top: 5px;
	width: 100px;
	height: 25px;
	text-align: center;
	margin-bottom: 5px;
}

.mypage_project_image {
	width: 240px;
	height: 160px;
	border: 1px solid lightgrey;
	margin-left: auto;
	margin-right: auto;
	margin-top: 5px;
	background-color: #E9E9E9;
}

.mypage_project_content {
	margin-top: 10px;
	margin-left: 10px;
	width: 230px;
	height: 200px;
}

.mypage_project_content nav {
	list-style-type: none;
}

#myproject_btn {
	text-align: center;
}

.myproject_edit_btn {
	padding: 5px 30px;
	border: 1px solid lightgrey;
	border-radius: 5px;
	color: rgb(26, 188, 156);
	background-color: white;
}

.myproject_del_btn {
	padding: 5px 30px;
	border: 1px solid lightgrey;
	border-radius: 5px;
	color: rgb(231, 76, 60);
	background-color: white;
}

#project_subject {
	height: 80px;
	font-size: 30px;
	font-weight:700;
	padding: 25px;
	color: grey
}

#project_mypage_menu>nav>div:hover {
	cursor: default;
	border-left: 2px solid rgb(26, 188, 156);
}
</style>
</head>
<body>
	<div style="height: 50px"></div>
	<div class="bodysize">
		<div id="project_subject" >나의 페이지</div>
		<div id="project_mypage_menu">
			<nav>
				<div id="myUpdate" class="" onclick="location.href='../forme/MemberUpdateConfirmForm'">프로필 설정</div>
				<div id="myProject" class="" onclick="location.href='../forme/getMyProjects'">나의 프로젝트</div>
				<div id="_myInvestList" class="" onclick="location.href='../forme/MyInvestList'">나의 투자현황</div>
				<div id="investList" class="" onclick="location.href='../forme/InvestList'">나의 결제내역</div>
				<div id="MyInvestors" class="" onclick="location.href='../forme/MyInvestors'">나의 투자자 정보</div>
			</nav>
		</div>
	</div>
	<script>
	$(window).load(function() {
 	var uri = window.location.pathname.toString();
	console.log(uri);
 	if(uri.match('MemberUpdateConfirmForm')||uri.match('MemberUpdateForm')||uri.match('MemberDeleteConfirmForm')){
 		var memberUpdateConfirmForm = document.getElementById('myUpdate');
 		memberUpdateConfirmForm.setAttribute("class","_active");
 		
 	}
 	if(uri.match('getMyProjects')){
 		var myInvestList = document.getElementById('myProject');
 		myInvestList.setAttribute("class","_active");
 		
 	}
 	if(uri.match('MyInvestList') ){
 		var myInvestList = document.getElementById('_myInvestList');
 		myInvestList.setAttribute("class","_active");
 		
 	}
 	
 	if(uri.match('/InvestList') || uri.match('InvestDetail')){
 		var investList = document.getElementById('investList');
 		investList.setAttribute("class","_active");
 		
 	}
 	if(uri.match('MyInvestors')){
 		var investList = document.getElementById('MyInvestors');
 		investList.setAttribute("class","_active");
 		
 	}
 	
	});
	</script>
	
	
</body>
</html>