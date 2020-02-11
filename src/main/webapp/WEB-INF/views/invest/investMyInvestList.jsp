<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 투자 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
#myInvestList {
	min-height: 470px;
}

#mypage_list {
	margin-left: 20px;
}

.project_box {
	width: 260px;
	height: 470px;
	border: 1px solid #EEEEEE;
	display: inline-block;
	margin-right: 10px;
	margin-bottom: 10px;
	/* -webkit-transition: all 0.3s; */
	transition: all 0.3s;
	overflow: hidden;
	padding-bottom: 10px;
}

.project_box:hover {
	box-shadow: 5px 5px 3px lightgrey;
	margin-top: -5px;
}

.project_box:hover .mypage_project_image img {
	/* -webkit-transform: scale(1.05); */
	transform: scale(1.05);
}

.project_state {
	width: 100px;
	height: 30px;
	font-weight: 700;
	font-family: '';
	border: none;
	border-radius: 5px;
	text-align: center;
	padding-top: 5px;
	margin-bottom: 5px;
	display: inline-block;
}

.mypage_project_image {
	width: 100%;
	height: 170px;
	margin: -2px -5px 0 0;
}

.mypage_project_image img {
	margin: 0;
	width: 100%;
	height: 100%;
	object-fit: .mypage_project_image;
	transition: all 0.5s;
}

.mypage_project_content {
	margin-top: 10px;
	margin-left: 10px;
	width: 235px;
	height: 200px;
}

.content_name {
	font-size: 16px;
	color: #5e5e5e;
	display: inline-block;
	width: 100px;
}

.content_value {
	font-size: 18px;
	color: #211f1f;
	display: inline-block;
	margin-left: 5px;
}
/*진행중 */
.progress진행중 {
	border: 1px solid #FF007F;
	color: #FF007F;
	margin-bottom: 5px;
}
/* 마감 */
.progress마감 {
	border: 1px solid #8041D9;
	color: #8041D9;
}
/* 무산 */
.progress무산 {
	border: 1px solid #a6a6a6;
	color: #a6a6a6;
}
/* 제작중 */
.progress제작중 {
	border: 1px solid #CC3D3D;
	color: #CC3D3D;
}
/* 보류 */
.progress보류 {
	border: 1px solid #008299;
	color: #008299;
}
/* 완료 */
.progress완료 {
	border: 1px solid #D9418C;
	color: #D9418C;
}

.progress-bar {
	height: 15px;
	background-color: rgb(26, 188, 156);
}

.progressRate {
	font-size: 17px;
	color: #FF007F;
	display: inline-block;
	text-align: right;  
	width: 130px
}

.rewardName {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-size: 18px;
	color: #211f1f;
	margin-bottom: 5px;
	white-space: normal;
	line-height: 1.3;
	height: 75px;
	text-align: left;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}
</style>
<script>
var path = "<c:url value='/'/>";
$(document).ready(function() {
	$(document).scroll(function() {
				var lastno = $(".project_box").last().attr("id");
				var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop()+ $(window).height();
				if (maxHeight <= currentScroll) {
					loadArticle(lastno);
				}
			});
	function loadArticle(lastno) {
		$.ajax({	type : "post",
					url : path+"forme/MyInvestListScroll",
					data : { "investNo" : lastno},
					dataType : "json",
					success : function(data) {
						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {
								$('#myInvestList').append(
										 '<div class="project_box" style="" id="'+data[i].investNo+'">															'
									   	+'	<div class="mypage_project_image">																					'
									   	+'		<img class="mypage_project_image"src="../upload/'+data[i].image+'">												'
										+'	</div>																												'
										+'	<div class="mypage_project_content"><div>																			'
										+'		<div class="project_state progress'+data[i].projectProgress+'">'+data[i].projectProgress+'</div>				'
										+'		<div class="progressRate">'+data[i].projectProgressRate+'%</div>												'	
										+'		<div style="margin-bottom:10px;margin-top:10px;height:50px">													'
										+'		<div style="font-size: 18px;margin-bottom:5px"><strong>'+data[i].projectName+'</strong></div></div>				'
										+'		<div style="font-size: 16px;color: #5e5e5e;">리워드</div>															'
										+'		<div class="rewardName">'+data[i].presentName+'</div>		'
										+'		<div><div class="content_name">총 투자 금액</div><div class="content_value">'+data[i].invenstAmount+'원</div></div>	'
										+'		<div><div class="content_name">투자일</div><div class="content_value">'+data[i].investDate+'</div></div>			'
										+'		<div class="content_name">배송예정일</div><div class="content_value">'+data[i].deliveryDate+'</div>				'
										+'		<div style="height: 5px"></div>																					'												
										+'	</div>																												'
										+'</div>																												'							
								);
							}
						}
					}
				});				
	}
});

</script>
<body>
<div style="height:70px"></div>  
	<div id="myInvestList" >
		<h3>나의	투자 현황</h3>  
		<div style="height:20px"></div>
		<c:forEach items="${list}" var="list">
		<div class="project_box" style="" id="${list.investNo}" onclick="location.href='<c:url value='/'/>support/getProjectDetailPage?projectNo=${list.projectNo}'">
			<div class="mypage_project_image">
				<img src="<c:url value='/'/>upload/${list.image}">
			</div>
			<div class="mypage_project_content">
				<div>
					<div class="project_state progress${list.projectProgress}">${list.projectProgress}</div>
					<div class="progressRate">${list.projectProgressRate}%</div>
				</div>
				<div style="margin-bottom:10px;margin-top:10px;height:50px">
					<div style="font-size: 18px;margin-bottom:5px"><strong>${list.projectName}</strong></div>
				</div>
				<div style="font-size: 16px;color: #5e5e5e;">리워드</div>
				<div class="rewardName">${list.presentName}</div>
				<div><div class="content_name">총 투자 금액</div><div class="content_value">${list.invenstAmount}원</div></div>
				<div><div class="content_name">투자일</div><div class="content_value">${list.investDate}</div></div>
				<div class="content_name">배송예정일</div><div class="content_value">${list.deliveryDate}</div>
				<div style="height: 5px"></div>
				<%-- <div><div class="content_name">모금액</div><div class="content_value">${list.totalInvest}원</div></div>
  				<div class="progress" style="height:15px;">
  					<div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:${list.projectProgressRate}%;">${list.projectProgressRate}%</div>
  				</div>  --%>
			</div>
		</div>
		</c:forEach>
	</div>
</body>
</html>