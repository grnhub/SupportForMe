<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
._btn {
	margin-left: 15px;
}

._btn2 {
	background: rgb(26, 188, 156);
	color: white;
}
._btn2:hover {
	background:grey;
	color: white;
}

.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
  background: rgb(26, 188, 156);
  border-color: rgb(26, 188, 156);
}
.pagination{
	text-align: center;
}
#bodySize {
	width:1300px;
	margin-left:auto;
	margin-right:auto;
}
</style>
	<script>
	var path = "<c:url value='/'/>";
	function go_page(p){
		document.searchForm.page.value=p;
		document.searchForm.submit();
	}
	function ProjectProgres(s){
		var flag = s;
		if(flag=='001'){
			var check= confirm('선택하신 프로젝트의 보류 및 취소를 해제하시겠습니까?');
		} else if (flag=='003') {
			var check= confirm('선택하신 프로젝트를 취소하시겠습니까?');
		} else if (flag=='005') {
			var check= confirm('선택하신 프로젝트를 보류하시겠습니까?');
		}  
		var ids='';
		var getIds = document.getElementsByName('ids');
		for(var i = 0 ; i < getIds.length ; i++ ){
			if(getIds[i].checked ==true){	
				ids += getIds[i].value+'|';
			}
		}
		console.log(ids);
		if(check){
			var form = document.createElement("form");
			var parm = new Array();
			var input = new Array();
			form.action = path+"forme/AdminProjectProgress";
			form.method = "post";
			parm.push([ 'ids', ids ]);
			parm.push([ 'flag', flag ]);
	
			
			for (var i = 0; i < parm.length; i++) {
				input[i] = document.createElement("input");
				input[i].setAttribute("type", "hidden");
				input[i].setAttribute('name', parm[i][0]);
				input[i].setAttribute("value", parm[i][1]);
				form.appendChild(input[i]);
			}
			document.body.appendChild(form);
			form.submit();
		}else {
			return false;
		}
	} 

	
	function AllCheck(){
		var allCheck = document.getElementById("allCheck").checked;
		console.log(allCheck);
		var getIds = document.getElementsByName("ids");
		if (allCheck == true){
			for(var i = 0 ; i < getIds.length ; i++){
				getIds[i].checked = true;
			}
		} else{
			for(var i = 0 ; i < getIds.length ; i++){
				getIds[i].checked = false;
			}
		}
	}
	
	function veiwNumber(){
		var searchForm = document.getElementById("searchForm");
		searchForm.submit();
	}
</script>
</head>
<body>
<div id="bodySize">
<div style="height:70px"></div>
<h3>프로젝트 관리</h3>
<hr>
<form action="<c:url value='/'/>forme/AdminProjectProgressList" id="searchForm" name="searchForm">
<div style="width:1250px;margin-bottom:10px" align=right >
<div class="input-group" >
	<select id="pageUnit" name="pageUnit" class="form-control" onchange="veiwNumber()" style="width:180px;margin-right:80px">
		<option value="10" selected>10개씩 보기</option>
		<option value="25">25개씩 보기</option>	
		<option value="50">50개씩 보기</option>
	</select>
	<input type="hidden" name="page" value="1">

	<select name="progress" class="form-control" style="width:200px;">
		<option value="">프로젝트진행상태</option>
		<option value="001">진행중</option>
		<option value="002">마감</option>
		<option value="003">무산</option>
		<option value="004">제작중</option>
		<option value="005">보류</option>
		<option value="006">완료</option>
	</select>
	<select name="searchCondition" class="form-control" style="width:150px;">
		<option value="">전체</option>
		<option value="projectName">프로젝트명</option>
		<option value="name">프로젝트작성자</option>
		<option value="userId">프로젝트작성자ID</option>
	</select>
	<input type="text" name="searchKeyword" value="" class="form-control" style="width:500px;">
	<input type="submit" class="btn _btn2" value="검색" style="width:120px;"><br>
	
	<script>
		document.searchForm.searchCondition.value ='${searchCondition}';
		document.searchForm.searchKeyword.value ='${searchKeyword}';
		document.searchForm.progress.value ='${progress}';
		if('${pageUnit}' != ''){ document.searchForm.pageUnit.value ='${pageUnit}';	}
	</script>
</div>
</div>
</form>

	<table class="table table-hover" style="width:1250px;">
		<thead>
		<tr>
			<th><input type="checkbox" id="allCheck" onclick="AllCheck()"> &nbsp;선택</th>
			<th>프로젝트명</th>
			<th>프로젝트작성자</th>
			<th>프로젝트작성자ID</th>
			<th>프로젝트 마감일</th>
			<th>목표금액</th>
			<th>진행상황</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<td><input type="checkbox" name="ids" value="${list.projectNo}"></td>
				<td onclick="location.href='<c:url value='/'/>support/getProjectDetailPage?projectNo=${list.projectNo}'">${list.projectName}</td>
				<td onclick="location.href='<c:url value='/'/>support/getProjectDetailPage?projectNo=${list.projectNo}'">${list.name}</td>
				<td onclick="location.href='<c:url value='/'/>support/getProjectDetailPage?projectNo=${list.projectNo}'">${list.userId}</td>
				<td onclick="location.href='<c:url value='/'/>support/getProjectDetailPage?projectNo=${list.projectNo}'">${list.projectDeadline}</td>
				<td onclick="location.href='<c:url value='/'/>support/getProjectDetailPage?projectNo=${list.projectNo}'">${list.targetAmount}</td>
				<td onclick="location.href='<c:url value='/'/>support/getProjectDetailPage?projectNo=${list.projectNo}'">${list.codeName}</td>
			</tr>
		</c:forEach>
		
		<tr style="margin-top:20px">
			<td colspan="7">
				<my:paging paging="${paging}"/>
				<input type="button" value="프로젝트 보류" class="btn _btn _btn2 pull-right" onclick="ProjectProgres('005')">
				<input type="button" value="프로젝트 취소" class="btn _btn _btn2 pull-right" onclick="ProjectProgres('003')">
				<input type="button" value="프로젝트 보류 취소" class="btn _btn _btn2 pull-right" onclick="ProjectProgres('001')">
			</td>
		</tr>
		</tbody>
	</table>
</div>
</body>
</html>