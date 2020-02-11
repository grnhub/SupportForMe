<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2018. 10. 26.</title>
<!--   jQuery  -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!--  부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/loading.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/CategoryProjects.css">
<script>
var contextPath = '<%= request.getContextPath() %>';
var searchCondition = '${searchCondition}';
var Pcount =  '${count}';
</script>
<script src="<%=request.getContextPath()%>/js/CategoryProjects.js"></script>
</head>
<body>

	<div class="pjdtl_bodysize">
		<div class="wrapper">
			<div class="div1">
				<h1 class="text3dss" style="text-align: left; color: black;">
					<c:if test="${searchCondition eq 001}">공연프로젝트</c:if>
					<c:if test="${searchCondition eq 002}">영화프로젝트</c:if>
					<c:if test="${searchCondition eq 003}">미술프로젝트</c:if>
					<c:if test="${searchCondition eq 004}">도서프로젝트</c:if>
				</h1>
				<p class="text3dss" style="text-align: left; font-size: 25px;">${count}개의 프로젝트</p>
				<br> <br>
			</div>
			<div class="div2">
				<c:forEach items="${list}" var="project">
					<div class="project_box" id="${project.projectNo}"
						style="cursor: pointer;"
						onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'">
						<div class="mypage_project_image">
							<img src="<%= request.getContextPath() %>/upload/${project.image}"
								onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'">
						</div>
						<div class="mypage_project_content">
							<div class="project_state progress${project.progressCd}">${project.progress}</div>
							<div class="text3d" style="font-size: 16px;">${project.userId}</div>
							<div style="height: 5px"></div>
							<div class="text3dPn"><strong>${project.projectName}</strong></div>
							<div style="height: 5px"></div>
							<div ><span class="tI">${project.totalInvest}원</span><span class="text3d">&nbsp;${project.percent}%</span></div>
							<div style="height: 5px"></div>
							<div class="progress" style="height:15px;width:225px;margin-bottom:5px">
    							<div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%;height:15px;background-color:rgb(26, 188, 156);">
   							 	</div>
  							</div>
							<div class="text3d">목표금액  ${project.targetAmount}원</div>	
							<div class="remainDay">D-${project.remaindate}</div>
									
						</div>
					</div>
				</c:forEach>
			</div>
			
		</div>			
	</div>
<div class="loader">Loading...</div>
<div style="height: 300px"></div>

</body>
</html>