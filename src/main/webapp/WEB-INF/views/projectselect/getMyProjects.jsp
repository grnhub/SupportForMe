<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2018. 10. 26.</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!--   jQuery  -->
<!--  부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/loading.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/MyProjects.css">
<script>
var contextPath = '<%= request.getContextPath() %>';
var userId = '${member.userId}';
/* var path = "<c:url value='/'/>"; */
</script>
<script src="<%=request.getContextPath()%>/js/MyProjects.js?ver=1"></script>
</head>
<body>
<div style="height:70px"></div>
	<div class="pjdtl_bodysize">
		<h3>나의 프로젝트</h3>
		<div style="height:20px"></div>
		<div class="wrapper">
			<div class="div2">
				<c:forEach items="${list}" var="project">
					<div class="project_box" id="${project.projectNo}"
						<%-- style="cursor: pointer;"
						onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'" --%>>
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
							<div class="progress" style="height:15px;width:250px;margin-bottom:5px">
    							<div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%;height:15px;background-color:rgb(26, 188, 156);">
   							 	</div>
  							</div>
							<div class="text3d">목표금액  ${project.targetAmount}원</div>
							<div style="height: 5px"></div>
							<div>
								<%-- <button class="btn btn-default _btn1" onclick="location.href='<%= request.getContextPath() %>/forme/make/${project.projectNo}'">수정</button> --%>
								<c:choose>
									<c:when test="${project.progressCd ne 002 && project.progressCd ne 003 && project.progressCd ne 006 }">
										<button class="btn btn-default _btn1" onclick="location.href='<%= request.getContextPath() %>/forme/make/${project.projectNo}'">수정</button>
									</c:when>
									<c:otherwise>
										<button style="border:none;background-color:white;width:120px;margin-right:10px;"></button>
									</c:otherwise>
								</c:choose>
							    <c:if test="${project.progressCd eq 004 }"><button class="btn btn-default _btn2" onclick="projectdelete('${project.projectNo}');">삭제</button></c:if>
							    <c:if test="${project.progressCd ne 004 }"><button class="btn btn-default _btn2" onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'">상세화면</button></c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div> 
		</div>
	</div> 
	<p class="loader">Loading...</p>
	<div style="height: 300px"></div>
</body>
</html>