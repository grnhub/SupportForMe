<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 결제 내역보기</title>
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
</style>
<script>
	function go_page(p){
		document.searchForm.page.value=p;
		document.searchForm.submit();
	}
	
</script>
</head>


<body>
<div style="height:70px"></div>
<h3>결제 내역 보기</h3>
<div style="height:20px"></div>
<form action="<c:url value='/'/>forme/InvestList" name="searchForm">
<div style="width:1100px;margin-bottom:10px" align=right>
<div class="input-group">
	<input type="hidden" name="page" value="1">
	<select name="searchCondition" class="form-control" style="width:120px;">
	<option value="">전체</option>
		<option value="projectName">프로젝트명</option>	
		<option value="investNo">결제번호</option>
	</select>
	<select name="payType" class="form-control" style="width:120px;">
	<option value="">결제유형</option>
		<option value="신용카드">신용카드</option>	
		<option value="계좌결제">계좌결제</option>
		<option value="휴대폰결제">휴대폰결제</option>
	</select>
	<input type="date" name="startdate" class="form-control" style="width:150px;"><input type="date" name="enddate" class="form-control" style="width:150px;">
	<input type="text" name="searchKeyword" value="" class="form-control" style="width:300px;">
	<input type="submit" value="검색" class="btn _btn2">
	<script>
		document.searchForm.searchCondition.value ='${searchCondition}';
		document.searchForm.startdate.value ='${startdate}';
		document.searchForm.enddate.value ='${enddate}';
		document.searchForm.searchKeyword.value ='${searchKeyword}';
		document.searchForm.payType.value ='${payType}';
	</script>
</div>
</div>
</form>
	<div style="min-height:300px;">
		<table class="table table-hover" style="width:1100px;">
			<thead><tr><th>결제번호</th><th style="width:400px">프로젝트명</th><th>결제금액</th><th>결제방법</th><th>결제상태</th><th>결제일</th></tr></thead>
			<tbody>
			<c:forEach items="${list}" var="list">
				<tr onclick="location.href='<c:url value='/'/>forme/InvestDetail?investNo=${list.investNo}'"><td>${list.investNo }</td><td>${list.projectName }</td><td>${list.invenstAmount }</td><td>${list.payType}</td><td>${list.paymentState }</td><td>${list.investDate }</td></tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="width:1100px;text-align:center">
		<my:paging paging="${paging}"/>
	</div>
</body>
</html>