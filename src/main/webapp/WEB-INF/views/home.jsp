<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!doctype html>
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.3/flexslider.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.3/jquery.flexslider-min.js"></script>
<!--  부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  메인화면 디자인 CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Main.css">
	
</head>
<body>
<!-- 메인화면 자바스크립트 -->
<script>var contextPath = "<%=request.getContextPath()%>";</script>
<script src="<%=request.getContextPath()%>/js/Main.js"></script>
	<!-- <span class="text3dss" style="font-size: 35px;"><i class="fa fa-paint-brush" style="color: rgb(6, 135, 133);"></i></span> -->
	<div class="flexslider2">
		<ol class="slides">
			<c:forEach items="${Latest}" var="project">
				<li><img style="cursor: pointer;"
					src="<%= request.getContextPath() %>/upload/${project.image}"
					onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'"
					onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'"></li>
			</c:forEach>
		</ol>
	</div>
	<hr>
	<div style="height: 100px"></div>
	<div class="bodysize">
		<div class="suforme">
			<div class="suforme_picks_div">
				<div class="suforme_top_1_text_div" style="margin-bottom: -3px;">
					<!-- <i class="fa fa-heart" style="color: #FF007F;width:25px;height:25px"></i> -->
					서포미 PICKS
				</div>
				<br>
				<div class="flexslider">
					<ul class="slides">
						<c:forEach items="${Pick}" var="pick">
							<li>
								<div class="suforme_picks_grid" style="cursor: pointer;"
									onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${pick.projectNo}'">
									<div class="suforme_picks_projects">
										<img src="<%= request.getContextPath() %>/upload/${pick.image}"
											onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'">
									</div>
									<div class="suforme_picks_projects_content">
										<div class="text3dPn" style="font-size: 30px">
											<strong>카테고리</strong>
										</div>
										<div style="font-size: 25px">
											<c:if test="${pick.categoryCode eq 001}">공연</c:if>
											<c:if test="${pick.categoryCode eq 002}">영화</c:if>
											<c:if test="${pick.categoryCode eq 003}">미술</c:if>
											<c:if test="${pick.categoryCode eq 004}">도서</c:if>
										</div>
										<div class="text3dPn" style="font-size: 30px">
											<strong>프로젝트 제목</strong>
										</div>
										<p style="font-size: 25px">${pick.projectName}</p>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<div class="real_time_rank_outer">
				<div class="suforme_top_1_text_div">실시간 랭킹</div>
				<br>
				<div class="real_time_rank_div">
					<div class="real_time_image flexslider3">
						<ul class="slides">
							<li><img src=""
								onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'"
								style="cursor: pointer;"></li>
							<li><img src=""
								onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'"
								style="cursor: pointer;"></li>
							<li><img src=""
								onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'"
								style="cursor: pointer;"></li>
							<li><img src=""
								onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'"
								style="cursor: pointer;"></li>
							<li><img src=""
								onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'"
								style="cursor: pointer;"></li>
						</ul>
					</div>
					<div class="real_time_rank_projects">
						<nav id="rank">
							<div style="height: 20px;"></div>
							<!-- <marquee behavior=slide loop=30> -->
							<ol>
								<li class="" style="height: 25px;" onclick="1"></li>
								<li class="" style="height: 25px;" onclick="2"></li>
								<li class="" style="height: 25px;" onclick="3"></li>
								<li class="" style="height: 25px;" onclick="4"></li>
								<li class="" style="height: 25px;" onclick="5"></li>
							</ol>
							<!-- </marquee> -->

						</nav>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 50px"></div>

		<!-- 미술 부분  -->
		<div class="suforme_top_1_text_div mainCategory">
			<div>미술 프로젝트</div>
			<div style="text-align: right;">
				<a
					href="<%= request.getContextPath() %>/support/getCategoryProjects?searchCondition=003">더보기
				</a>
			</div>
		</div>
		<div class="category_project_div">
			<c:forEach items="${Art}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="<%= request.getContextPath() %>/upload/${project.image}"
							onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<div class="text3d">${project.userId}</div>
						<div style="height: 5px"></div>
						<div class="text3dPn" style="">
							<strong>${project.projectName}</strong>
						</div>
						<div style="height: 15px"></div>
						<div style="display: grid; grid-template-columns: 100%">
							<span class="text3d">모금액 ${project.totalInvest}원</span>
						</div>
						<div style="height: 5px"></div>
						<div
							style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress" style="height: 10px; width: 230px">
								<div
									class="progress-bar"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100"
									style="width:${project.percent}%;height:10px"></div>
							</div>
						</div>
						<div class="rdPercent">
							<div class="remainDay" id="${project.projectNo}art"></div>
							<div style="display:inline-block;width:85px;text-align:right">&nbsp;${project.percent}%</div>
						</div>					
						<!-- D-day 구하는 자바스크립트 -->
						<script>
							var seq = '${project.projectNo}';
							var rd = '${project.projectDeadline}';
							if(rd != ''){
								var remain = remainDay(rd);
								if(remain < 0){
									$("#"+seq).remove();
								}else {
									$("#"+seq+"art").text("D-"+remain);	
								}
							}
						</script>
					</div>
				</div>
			</c:forEach>  
		</div>
		
		<div style="height: 70px"></div>
		<!-- 도서 -->
		<div class="suforme_top_1_text_div mainCategory">
			<div>도서 프로젝트</div>
			<div style="text-align: right;">
				<a
					href="<%= request.getContextPath() %>/support/getCategoryProjects?searchCondition=004">더보기
				</a>
			</div>
		</div>
		<div class="category_project_div">
			<c:forEach items="${Book}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="<%= request.getContextPath() %>/upload/${project.image}"
							onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<div class="text3d">${project.userId}</div>
						<div style="height: 5px"></div>
						<div class="text3dPn" style="">
							<strong>${project.projectName}</strong>
						</div>
						<div style="height: 15px"></div>
						<div style="display: grid; grid-template-columns: 100%">
							<span class="text3d">모금액 ${project.totalInvest}원</span>
						</div>
						<div style="height: 5px"></div>
						<div
							style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress" style="height: 10px; width: 230px">
								<div
									class="progress-bar"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100"
									style="width:${project.percent}%;height:10px"></div>
							</div>
						</div>
						<div class="rdPercent">
							<div class="remainDay" id="${project.projectNo}book"></div>
							<div style="display:inline-block;width:85px;text-align:right">&nbsp;${project.percent}%</div>
						</div>
						<!-- D-day 구하는 자바스크립트 -->
						<script>
							var seq = '${project.projectNo}';
							var rd = '${project.projectDeadline}';
							if(rd != ''){
								var remain = remainDay(rd);
								if(remain < 0){
									$("#"+seq).remove();
								}else {
									$("#"+seq+"book").text("D-"+remain);	
								}
							}
						</script>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div style="height: 70px"></div>
		<div class="suforme_top_1_text_div mainCategory">
			<div>공연 프로젝트</div>
			<div style="text-align: right;">
				<a
					href="<%= request.getContextPath() %>/support/getCategoryProjects?searchCondition=001">더보기
				</a>
			</div>
		</div>
		<div class="category_project_div">
			<c:forEach items="${Performance}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="<%= request.getContextPath() %>/upload/${project.image}"
							onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<div class="text3d">${project.userId}</div>
						<div style="height: 5px"></div>
						<div class="text3dPn" style="">
							<strong>${project.projectName}</strong>
						</div>
						<div style="height: 15px"></div>
						<div style="display: grid; grid-template-columns: 100%">
							<span class="text3d">모금액 ${project.totalInvest}원</span>
						</div>
						<div style="height: 5px"></div>
						<div
							style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress" style="height: 10px; width: 230px">
								<div
									class="progress-bar"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100"
									style="width:${project.percent}%;height:10px"></div>
							</div>
						</div>
						<div class="rdPercent">
							<div class="remainDay" id="${project.projectNo}pf"></div>
							<div style="display:inline-block;width:85px;text-align:right">&nbsp;${project.percent}%</div>
						</div>
						<!-- D-day 구하는 자바스크립트 -->
 						<script>
							var seq = '${project.projectNo}';
							var rd = '${project.projectDeadline}';
							if(rd != ''){
								var remain = remainDay(rd);
								if(remain < 0){
									$("#"+seq).remove();
								}else {
									$("#"+seq+"pf").text("D-"+remain);	
								}
							}
						</script>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div style="height: 70px"></div>
		<!-- 영화 -->
		<div class="suforme_top_1_text_div mainCategory">
			<div>영화 프로젝트</div>
			<div style="text-align: right;">
				<a
					href="<%= request.getContextPath() %>/support/getCategoryProjects?searchCondition=002">더보기
				</a>
			</div>
		</div>
		<div class="category_project_div">
			<c:forEach items="${Movie}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="<%= request.getContextPath() %>/upload/${project.image}"
							onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<div class="text3d">${project.userId}</div>
						<div style="height: 5px"></div>
						<div class="text3dPn" style="">
							<strong>${project.projectName}</strong>
						</div>
						<div style="height: 15px"></div>
						<div style="display: grid; grid-template-columns: 100%">
							<span class="text3d">모금액 ${project.totalInvest}원</span>
						</div>
						<div style="height: 5px"></div>
						<div
							style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress" style="height: 10px; width: 230px">
								<div
									class="progress-bar"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100"
									style="width:${project.percent}%;height:10px"></div>
							</div>
						</div>
						<div class="rdPercent">
							<div class="remainDay" id="${project.projectNo}mv"></div>
							<div style="display:inline-block;width:85px;text-align:right">&nbsp;${project.percent}%</div>
						</div>
						<!-- D-day 구하는 자바스크립트 -->			 
 						<script>
						var seq = '${project.projectNo}';
						var rd = '${project.projectDeadline}';
						if(rd != ''){
							var remain = remainDay(rd);
							if(remain < 0){
								$("#"+seq).remove();
							}else {
								$("#"+seq+"mv").text("D-"+remain);	
							}
						}
						</script> 
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div style="height: 100px"></div>

</body>
</html>