<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 투자자</title>
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

._btn3 {
	color:#006700;
	border: 1px solid #006700;
	background-color:white;
	align-content: flex-end;
	width: 100px;
	height: 35px;
	font-size: 18px;
}

.modal-dialog {
	margin-top: 10%;
}

#subject,#subjects {
	width: 150px;
	height: 200px;
	padding-left: 10px;
    font-size: 16px;
    border: 1px solid #006700;
}
#subjects {
	margin-left: 35px
}
#subject {
	margin-right:35px
}
#plus, #minus {
	height: 30px;
	width: 50px;
	margin-top: 170px;
}

.my.pagination>.active>a, .my.pagination>.active>span, .my.pagination>.active>a:hover,
	.my.pagination>.active>span:hover, .my.pagination>.active>a:focus, .my.pagination>.active>span:focus
	{
	background: rgb(26, 188, 156);
	border-color: rgb(26, 188, 156);
}

.pagination {
	text-align: center;
}
.text-center {
	height:30px;
}
</style>
<script>
var path = "<c:url value='/'/>";
function go_page(p){
	document.searchForm.page.value=p;
	document.searchForm.submit();
}
function myplus(){
	console.log("check");
	$("#subject").append($("#subjects :selected"));
}
function myminus(){
	$("#subjects").append($("#subject :selected"));
}

$(function(){
	$("#excel").click(function(){
		$('#subject option').prop('selected', true);
		$("#subjects").append($("#subject :selected"));
		$('#subjects option').prop('selected', false);
	});
	
	$("#excelDown").click(function(){
		if($("#subject option").length > 0){
			$("#subject option").prop('selected', true);
			document.excelFrm.submit(); 
		}else {
			alert("속성을 선택해주세요.");
		}
		
	})
});
</script>
</head>
<body>	
	<div style="height:70px"></div>
	<h3>나의 투자자 보기</h3>
	<div style="height:20px"></div>
	<form action="<c:url value='/'/>forme/MyInvestors" name="searchForm" >
	<div style="width:1100px;margin-bottom:10px" align=right>
		<div class="input-group" >
			<input type="hidden" name="page" value="1">
			<select name="searchCondition" class="form-control" style="width:120px;">
			<option value="">전체</option>
				<option value="projectName">프로젝트명</option>	
				<option value="investNo">투자번호</option>
				<option value="presentName">선물명</option>
				<option value="address">주소</option>
			</select>
			<input type="text" name="searchKeyword" value="" class="form-control" style="width:300px;">
			<input type="submit" value="검색" class="btn _btn2">
			<script>
				document.searchForm.searchCondition.value ='${searchCondition}';
				document.searchForm.searchKeyword.value ='${searchKeyword}';
			</script>
		</div>
	</div>
	</form>
	<div style="min-height:300px">
		<table class="table table-hover" style="width:1100px;">
			<thead>
			<tr>
				<th class="text-center">투자번호</th>
				<th class="text-center" style="width:80px;">이름</th>
				<th class="text-center" style="width:150px">선물명</th>
				<th class="text-center" style="width:80px;" >우편번호</th>
				<th class="text-center">주소</th>
				<th>이메일</th>
				<th style="width:120px;">휴대폰번호</th>
				<th>프로젝트 이름</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${investor}" var="investor">
				<tr>
					<td class="text-center">${investor.investNo}</td>
					<td class="text-center">${investor.name}</td>
					<td class="text-center">${investor.presentName}</td>
					<td class="text-center">${investor.postcode}</td>
					<td class="text-center">${investor.address}</td>
					<td>${investor.email}</td>
					<td>${investor.phoneNum}</td>
					<td>${investor.projectName}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="text-align:right;width:1100px">
		<button type="button" id="excel" class="_btn3" data-toggle="modal" data-target="#excelModal">Excel</button>
	</div>
	<div style="width:1100px;text-align:center" id="page">
		<my:paging paging="${paging}"/>
	</div>
	
	<!-- Modal -->
  <div class="modal fade" id="excelModal" role="dialog">
    <div class="modal-dialog modal-center" style="width:550px;text-align:center">
    
      <!-- Modal content-->
      <div class="modal-content modal-center">
        <div class="modal-body">
          <h3>Excel 출력 시 원하는 속성을 선택해주세요.<br>
          	   속성은 정렬하신 순서대로 출력됩니다.</h3>
          <div style="height:10px"></div>
          <div  style="display:grid;text-align:center;grid-template-columns: 1fr 0.2fr 0.2fr 1fr;">
	          	<div class="input-group mb-3">
				<select name="subjects" id="subjects" size="10" class="custom-select" multiple>
						<option value="investNo">투자번호</option>
						<option value="name">이름</option>
						<option value="presentName">선물명</option>
						<option value="postcode">우편번호</option>
						<option value="address">주소</option>
						<option value="email">이메일</option>
						<option value="phoneNum">휴대폰 번호</option>
						<option value="projectName">프로젝트명</option>
					</select>
				</div>
				<button type="button" id="plus" value="plus" onclick="myplus()" class="_btn3" style="margin-right:5px">+</button>
				<button type="button" id="minus" value="minus" onclick="myminus()" class="_btn3" >-</button>
			<form name="excelFrm" id="excelFrm" action="../forme/investorExcelView">
				<input type="hidden" name="searchCondition" value="${searchCondition}">
				<input type="hidden" name="searchKeyword" value="${searchKeyword}">
				<select name="subject" id="subject" size="10" class="custom-select" multiple>
				</select>
			</form>	
			</div>
        </div>
        <div class="modal-footer">
          <button type="button" name="excelDown" id="excelDown" class="btn btn-default" style="height:32px">Download</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>