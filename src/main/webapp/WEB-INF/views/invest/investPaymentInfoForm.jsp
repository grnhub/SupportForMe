<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>결제</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!--  부트스트랩 -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
 .bodysize {
        margin-left: auto;
        margin-right: auto;
    }
        session{
            margin-left: 50px;
        }
        nav{
            padding-top:10px;
        }
    	 input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button{
			-webkit-appearance: none;
			margin: 0;
		}
		.side div {
			padding:10px 5px;
			font-size:18px;
			
		}
textarea.textarea1 {
	resize: none;
	width: 100%;
	height: 80px;
}
</style>
<script>
var path = "<c:url value='/'/>";
	function AddrInput() {
		var input = document.querySelector("input[id=inputAddr]").checked;
		if (input == true) {
			$.ajax({
					url : path+"forme/AddrInput",
					method : "post",
					type : "json",
					async:false,
					success : function(data) {
							document.querySelector("#name").value = data.name;
							document.querySelector("#postcode").value = data.postcode;
							document.querySelector("#email").value = data.email;
							document.querySelector("#address").value = data.address;
							document.querySelector("#addrDetail").value = data.addrDetail;
							var phoneNum = data.phoneNum
							var telArray = phoneNum.split('-');
							document.querySelector("#tel1").value = telArray[0];
							document.querySelector("#tel2").value = telArray[1];
							document.querySelector("#tel3").value = telArray[2];
					}
					});
		} else {
			document.querySelector("#name").value = '';
			document.querySelector("#postcode").value = '';
			document.querySelector("#email").value = '';
			document.querySelector("#address").value = '';
			document.querySelector("#addrDetail").value = '';
			document.querySelector("#tel1").value = '';
			document.querySelector("#tel2").value = '';
			document.querySelector("#tel3").value = '';
		}
	}
	
	var paymentInfo = {
		name : '결제테스트',
		amount : '',
		buyer_email : '',
		buyer_name : '',
		buyer_tel : '',
		buyer_addr : ''
	}
	
	$(document)	.ready(	function() {
		IMP.init('imp55982631');
		$("#payment").click( function() {
							$.ajax({
								url : path+"forme/PaymentInfo",
								method : "post",
								type : "json",
								async : false,
								data : {
										"address" : document.getElementById("address").value,
										"addrDetail" : document.getElementById("addrDetail").value,
										"postcode" : document.getElementById("postcode").value,
										"email" : document.getElementById("email").value,
										"name" : document.getElementById("name").value,
										"tel1" : document.getElementById("tel1").value,
										"tel2" : document.getElementById("tel2").value,
										"tel3" : document.getElementById("tel3").value,
										"request" : document.getElementById("request").value
										},
								success : function(data) {
										paymentInfo.amount = data.investmentAmount;
										paymentInfo.buyer_email = data.email;
										paymentInfo.buyer_name = data.name;
										paymentInfo.buyer_tel = data.phoneNum;
										paymentInfo.buyer_addr = data.address;
										}
							});
		});
		
		$("#payment").click( function() {
			
			var name = document.getElementById("name").value;
			var email = document.getElementById("email").value;
			var tel1 = document.getElementById("tel1").value;
			var tel2 = document.getElementById("tel2").value;
			var tel3 = document.getElementById("tel3").value;
			var postcode = document.getElementById("postcode").value;
			var address = document.getElementById("address").value;
			var addrDetail = document.getElementById("addrDetail").value;
			if (!name) {
				alert('이름이 입력되지 않았습니다.');
				return false;
			}
			if (!email) {
				alert('이메일주소가 입력되지 않았습니다.');
				return false;
			} else {
				var emailRegexp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
				if (!emailRegexp.test(email)) {
					alert('이메일 주소 형식은 OOO@OOO.OOO 입니다.');
					return false;
				}

			}
			if (!postcode || !address || !addrDetail) {
				alert('주소가 입력되지 않았습니다.');
				return false;
			}
			if (!tel1 || !tel2 || !tel3) {
				alert('전화번호가 입력 되지 않았습니다.');
				return false;
			} else {
				var regexp = /[0-9]{4}/;
				console.log(tel2 + '_' + tel3)
				if (!regexp.test(tel2) || !regexp.test(tel3)) {
					alert('전화번호는 숫자이여야 합니다.');
					return false;
				}
			}
			
			
					IMP.request_pay({
									pg : 'html5_inicis',
									pay_method : 'card',
									merchant_uid : 'merchant_'+ new Date().getTime(),
									name : paymentInfo.name,
									amount : paymentInfo.amount,
									buyer_email : paymentInfo.buyer_email,
									buyer_name : paymentInfo.buyer_name,
									buyer_tel : paymentInfo.buyer_tel,
									buyer_addr : paymentInfo.buyer_addr
									},
									function(rsp) {
										if (rsp.success) {
											var msg = '결제가 완료되었습니다.'+ "\n";
												msg += '결제 금액 : ' + rsp.paid_amount + "\n";
												msg += '카드 승인번호 : ' + rsp.apply_num + "\n";
													$.ajax({
															url : path+"forme/PaymentEndProcess",
															method : "post",
															async : false,
															data : {
																	"address" : document.getElementById("address").value,
																	"addrDetail" : document.getElementById("addrDetail").value,
																	"postcode" : document.getElementById("postcode").value,
																	"email" : document.getElementById("email").value,
																	"name" : document.getElementById("name").value,
																	"tel1" : document.getElementById("tel1").value,
																	"tel2" : document.getElementById("tel2").value,
																	"tel3" : document.getElementById("tel3").value,
																	"request" : document.getElementById("request").value,
																	"uuid" : rsp.imp_uid
																	}
													});
													alert(msg);
													location.href = path+'/forme/InvestList'
										} else {
											var msg = '결제에 실패하였습니다.';
												msg += '에러내용 : ' + rsp.error_msg;
											alert(msg);
										}

									});
						});
	});
</script>
<body>
	<div style="width:1250px;margin-top:40px;" class="bodysize">
	    <nav style="float: left">
	        <div class="side" style="width:200px">
	            <div>리워드 선택</div>
	            <div style="background: rgb(26, 188, 156);color:white">결제</div>
	        </div>
	    </nav>
		<session style="float: left">

		<div style="width: 950px">
			<h2>결제방식 선택</h2>
			<hr>
			<input type="radio" name="" checked> 카드결제
			<hr>
			<!--배송정보입력   -->
			<div class="form-group">
				<label style="width: 150px;" class="col-lg-1 control-label">배송정보
					입력</label> <label style="width: 150px;" class="col-lg-1 control-label"><input
					id="inputAddr" type="checkbox" onclick="AddrInput()">결제자와
					동일</label> <br>
				<br>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label style="width: 150px;" class="col-lg-1 control-label">이름</label>
				<div class="col-lg-4" style="padding-left: 3px;">
					<input class="form-control" id="name" type="text" size="10">
				</div>
				<br> <br>
			</div>

			<!-- 이메일 주소 -->
			<div class="form-group">
				<label style="width: 150px;" class="col-lg-1 control-label">E-mail
					주소</label>
				<div class="col-lg-4" style="padding-left: 3px;">
					<input class="form-control" id="email" type="email" size="20">
				</div>
				<br> <br>
			</div>
			<!-- 전화번호 -->
			<div class="form-group">
				<label style="width: 150px;" class="col-lg-1 control-label">＊전화번호</label>
				<div class="col-lg-2" style="padding-left: 3px;">
					<select class="form-control" id="tel1" name="tel1" style="width: 150px;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
				<div class="col-lg-1"
					style="display: table; width: 1px; height: 34px; padding-left: 0px; padding-right: 0px;">
					<span style="display: table-cell; vertical-align: middle;">-</span>
				</div>
				<div class="col-lg-2" style="width: 150px;">
					<input class="form-control" type="text" id="tel2" size="10"
						maxlength="4">
				</div>
				<div class="col-lg-1"
					style="display: table; width: 1px; height: 34px; padding-left: 0px; padding-right: 0px;">
					<span style="display: table-cell; vertical-align: middle;">-</span>
				</div>
				<div class="col-lg-2" style="width: 150px;">
					<input class="form-control" type="text" id="tel3" size="10"
						maxlength="4">
				</div>
				<br> <br>
			</div>

			<!-- 주소 -->
			<div class="form-group">
				<label class="col-lg-1 control-label" style="width: 150px;">＊주소</label>
				<div class="col-lg-3" style="padding-left: 3px;">
					<input class="form-control" type="text" size="10" id="postcode"
						value="" readonly="readonly">
				</div>
				<div class="col-lg-2" style="padding-left: 0px;">

					<input type="button" onclick="SearchPostcode()" value="우편번호검색"
						class="form-control">
				</div>
				<div id="layer"
					style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
					<img
						src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
						id="btnCloseLayer"
						style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
						onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
				<script src="../js/SearchAddr.js"></script>
				<br>
			</div>
			<div class="form-group">
				<label class="col-lg-1 control-label" style="width: 150px;"></label>
				<div class="col-lg-5" style="padding-left: 3px;">
					<input class="form-control" type="text" id="address" size="60"
						value="" readonly="readonly"><br>
				</div>
				<br> <br>
			</div>			
			<div class="form-group">
				<label class="col-lg-1 control-label" style="width: 150px;"></label>
				<div class="col-lg-5" style="padding-left: 3px;">
					<input class="form-control" type="text" size="60" id="addrDetail" value="">
				</div>
			<br><br>	
			</div>
			<!-- 배송시 요청사항 -->
			<div class="form-group">
				<label class="col-lg-1 control-label" style="width: 150px;">배송시
					요청사항</label>
				<div class="col-lg-6" style="padding-left: 3px;">
					<textarea class="form-control textarea1" id="request"></textarea>
				</div>
				<br> <br> <br> <br> <br>
			</div>
			<!-- 선택 리워드 -->
			<div class="form-group">
				<label class="col-lg-1 control-label" style="width: 150px;">선택 리워드</label>
				<div class="col-lg-6" style="padding-left: 3px;">
					${presentName}
				</div>
				<br> <br> <br>
			</div>
			<!-- 추가투자금액 -->
			<div class="form-group">
				<label class="col-lg-1 control-label" style="width: 150px;">추가 투자 금액</label>
				<div class="col-lg-6" style="padding-left: 3px;">
					${price2}원
				</div>
				<br> <br> <br>
			</div>
			<!-- 총 결제 금액 -->
			<div class="form-group">
				<label class="col-lg-1 control-label" style="width: 150px;">총 결제 금액</label>
				<div class="col-lg-6" style="padding-left: 3px;">
					${allAmount}원
				</div>
				<br> <br> <br>
			</div>
			
			<!-- 버튼 -->
			<div class="form-group">
				<label class="col-lg-1 control-label" style="width: 150px;"></label>
				<div class="col-lg-offset-2 col-lg-4" style="text-align: right;">
					<input class="btn btn-default" id="payment" type="button"
							value="결제하기" style="background: rgb(26, 188, 156); color: white">
					<input class="btn btn-default" type="button" value="취소"
							style="background: rgb(26, 188, 156); color: white">
				
				</div>
			</div>
			<!--  -->





			<%-- <table>
				<tbody>
					<tr>
						<td colspan="2">배송정보 입력</td>
					</tr>
					<tr>
						<td colspan="2"><input id="inputAddr" type="checkbox"
							onclick="AddrInput()">결제자와 동일</td>
					</tr>
					<tr>
						<td width="150">이름</td>
						<td><input id="name" type="text" size="10"></td>
					</tr>
					<tr>
						<td>E-mail&nbsp;주소</td>
						<td><input id="email" type="email" size="20"></td>
					</tr>
					<tr>
						<td><span>＊</span>전화번호</td>
						<td><select id="tel1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input type="text" id="tel2" size="10"> - <input
							type="text" id="tel3" size="10"></td>
					</tr>

					<tr>
						<td>주소</td>
						<td><input type="text" size="10" id="postcode" id="postcode"
							value="" readonly="readonly"> <input type="button"
							onclick="SearchPostcode()" value="우편번호검색" class=""><br>
							<div id="layer"
								style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
								<img
									src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
									id="btnCloseLayer"
									style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
									onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div> <script src="../js/SearchAddr.js"></script> <input type="text"
							id="address" size="60" id="address" value="" readonly="readonly"><br>
							<input type="text" size="60" id="addrDetail" value=""></td>
					</tr>
					<tr>
						<td>배송시 요청사항</td>
						<td><textarea id="request"></textarea></td>
					</tr>
					<tr>
						<td>선택 리워드</td>
						<td>${presentName}</td>
					</tr>
					<tr>
						<td>추가 투자 금액</td>
						<td>${price2}원</td>
					</tr>
					<tr>
						<td>총 결제 금액</td>
						<td>${allAmount}원</td>
					</tr>
					<tr>
						<td colspan="2"><input id="payment" type="button"
							value="결제하기" style="background: rgb(26, 188, 156); color: white">
							<input type="button" value="취소"
							style="background: rgb(26, 188, 156); color: white"></td>
					</tr>
				</tbody>
			</table> --%>
		</div>
		</session>
	</div>
</body>
</html>
