<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 세부 내역</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
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

</style>
<body>
<div style="margin-left:50px;">
<div style="height:70px"></div>
<h3>결제  내역 상세 보기</h3>
<div style="height:20px"></div>
	<table class="table table-hover" style="width:600px;">
	<tbody>	
		<tr>
			<th scope="row">결제번호</th>
			<td>${invest.investNo }</td>
		</tr>
		<tr>
			<th scope="row">프로젝트명</th>
			<td>${invest.projectName }</td>
		</tr>

		<tr>
			<th scope="row">결제금액</th>
			<td>${invest.invenstAmount }</td>
		</tr>
		<tr>
			<th scope="row">결제방식</th>
			<td>${invest.payType }</td>
		</tr>
		<tr>
			<th scope="row">결제상태</th>
			<td>${invest.paymentState }</td>
		</tr>
		<tr>
			<th scope="row">선택 리워드</th>
			<td>${invest.presentName }</td>
		</tr>
		<tr>
			<th scope="row">우편번호</th>
			<td>${invest.postcode}</td>
		</tr>
		<tr>
			<th scope="row">주소</th>
			<td>${invest.address }</td>
		</tr>
		<tr>
			<th scope="row">상세주소</th>
			<td>${invest.addrDetail }</td>
		</tr>
		<tr>
			<th scope="row">전화번호</th>
			<td>${invest.phoneNum }</td>
		</tr>
		<tr>
			<th scope="row">EMail</th>
			<td>${invest.email }</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="뒤로 가기" class="btn _btn _btn2 pull-right" onclick="history.back()"></td>
		</tr>
	</tbody>
	</table>
</div>
</body>
</html>