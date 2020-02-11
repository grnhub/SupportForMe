<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.wrapper {
	display: grid;
	grid-template-columns: 1fr 1fr;
	/*grid-template-rows: 80% 50%; */
	grid-auto-rows: minmax(100px, auto);
}
/*    .wrapper > div {
        background-color: aquamarine;
        border: 1px solid red;
    }*/
.div1 {
	grid-column: 1/3;
	text-align: center;
}

.div2 {
	grid-column: 1/3;
}

.table1 {
	table-layout: fixed;
	width: 800px;
	height: 300px;
	align: center;
	border: 1px solid;
}

span {
	color: blue;
}

p.p1 {
	display: inline;
}

textarea.textarea1 {
	resize: none;
	width: 100%;
	height: 80px;
}

caption {
	text-align: right;
}
._btn {
    background-color: rgb(26, 188, 156);
    color: white;
}
</style>
</head>
<script>
	var path = "<c:url value='/'/>";
	var idCheck = false;
	var emailCheck = false;
	var passwordRegexCheck = false;

	function CheckId() {
		var userid = document.getElementById("userId").value;
		if (userid != null && userid != '') {
			$
					.ajax({
						url : path+"support/CheckId?userId=" + userid,
						method : "post",
						type : "text",
						success : function(data) {
							if (data == 0) {

								var idRegex = /^[a-z]+[a-z0-9]{5,20}$/g;
								if (!idRegex.test(userid)) {
									document.getElementById("checkIdResult").innerHTML = '<font color="red">아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.</font>';
									idCheck = false;
								} else {
									document.getElementById("checkIdResult").innerHTML = '사용할 수 있는  ID입니다.';
									idCheck = true;
								}

							} else {
								document.getElementById("checkIdResult").innerHTML = '<font color="red">중복된 ID입니다.</font>';
								idCheck = false;
							}
						}
					});
		} else {
			document.getElementById("checkIdResult").innerHTML = '<font color="red">사용할수 없는 ID입니다.</font>';
			idCheck = false;
		}
	}

	function CheckEmail() {
		var email = document.getElementById("email").value;
		if (email != null && email != '') {
			$
					.ajax({
						url : path+"/support/CheckEmail?email=" + email,
						method : "post",
						type : "text",
						success : function(data) {

							var emailRegexp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
							if (!emailRegexp.test(email)) {
								document.getElementById("checkEmailResult").innerHTML = '<font color="red">사용할수 없는 Email입니다.</font>';
								emailCheck = false;
							} else {
								if (data == 0) {
									document.getElementById("checkEmailResult").innerHTML = '사용할수 있는  Email입니다.';
									emailCheck = true;
								} else {
									document.getElementById("checkEmailResult").innerHTML = '<font color="red">사용할수 없는 Email입니다.</font>';
									emailCheck = false;
								}
							}

						}
					});
		} else {
			document.getElementById("checkEmailResult").innerHTML = '<font color="red">사용할수 없는 Email입니다.</font>';
			emailCheck = false;
		}
	}

	function InsertMember() {
		var userId = document.getElementById("userId").value;
		var password = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		var tel1 = document.getElementById("tel1").value;
		var tel2 = document.getElementById("tel2").value;
		var tel3 = document.getElementById("tel3").value;
		var postcode = document.getElementById("postcode").value;
		var address = document.getElementById("address").value;
		var addrDetail = document.getElementById("addrDetail").value;
		var introduction = document.getElementById("introduction").value;

		var check = confirm('ID : ' + userId + '\n' + '이름 : ' + name + '\n'
				+ '이메일 : ' + email + '\n' + '전화번호 : ' + tel1 + '-' + tel2 + '-'
				+ tel3 + '\n' + '우편번호 : ' + postcode + '\n' + '주소 : ' + address
				+ '\n' + '상세주소 : ' + addrDetail + '\n' + '나의 소개 : '
				+ introduction + '\n' + '상기의 정보로 회원 가입을 하시겠습니까?');

		if (idCheck == false) {
			alert('해당 ID는  사용할수 없습니다.');
			return false;
		}
		if (emailCheck == false) {
			alert('해당  Email은 사용할 수 없습니다.');
			return false;
		}
		if (!userId) {
			alert('ID가 입력되지 않았습니다.');
			return false;
		}
		if (!password) {
			alert('비밀번호가 입력되지 않았습니다.');
			return false;
		}
		if (password != password2) {
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}
		if (passwordRegexCheck == false) {
			alert('비밀번호는 특수문자 /문자/ 숫자를 한자 이상  포함 형태의 8~15자리 이내여야 합니다.');
			return false;
		}
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

		if (!introduction) {
			alert('자기소개가 입력되지 않았습니다.');
			return false;
		}

		if (!tel1 || !tel2 || !tel3) {
			alert('전화번호가 입력 되지 않았습니다.');
			return false;
		} else {
			var regexp = /[0-9]{4}/;
			console.log(typeof tel2 + '_' + typeof tel3)
			if (!regexp.test(tel2) || !regexp.test(tel3)) {
				alert('전화번호는 숫자이여야 합니다.');
				return false;
			}
		}
		if (check) {
			var form = document.createElement("form");
			var parm = new Array();
			var input = new Array();
			form.action = path+"/support/InsertMember";
			form.method = "post";
			parm.push([ 'userId', userId ]);
			parm.push([ 'password', password ]);
			parm.push([ 'name', name ]);
			parm.push([ 'phoneNum', tel1 + '-' + tel2 + '-' + tel3 ]);
			parm.push([ 'email', email ]);
			parm.push([ 'postcode', postcode ]);
			parm.push([ 'address', address ]);
			parm.push([ 'addrDetail', addrDetail ]);
			parm.push([ 'introduction', introduction ]);

			for (var i = 0; i < parm.length; i++) {
				input[i] = document.createElement("input");
				input[i].setAttribute("type", "hidden");
				input[i].setAttribute('name', parm[i][0]);
				input[i].setAttribute("value", parm[i][1]);
				form.appendChild(input[i]);
			}
			document.body.appendChild(form);
			form.submit();
		}
	}

	function PasswordRegexCheck() {
		var password = document.getElementById("password").value;
		// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
		var passwordRegex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if (passwordRegex.test(password)) {
			document.getElementById("PasswordRegexCheck").innerHTML = '사용할수 있는 비밀 번호 입니다.';
			passwordRegexCheck = true;
		} else {
			document.getElementById("PasswordRegexCheck").innerHTML = '<font color="red">비밀번호는 특수문자 /문자/ 숫자를 한자 이상  포함 형태의 8~15자리 이내여야 합니다.</font>';
			passwordRegexCheck = false;
		}
	}
</script>
<body>
	<div class="wrapper">
		<div class="div1">
			<h1 style="text-align: left;">&nbsp&nbsp&nbsp&nbsp&nbsp회원가입</h1>
			<br> <img src="<c:url value='/'/>images/회원이미지2.png" width="1200px"	height="170px">
		</div>
		<div class="div2 form-horizontal" style="margin-left: 23%;">
			<br>
			<br>
			<br>
			<br>
			
			<!-- 아이디 -->
			<div class="form-group">
				
				<label for="inputId" class="col-lg-2 control-label">*아이디</label>
				<div class="col-lg-5">
					<input class="form-control" id="userId" type="text" size="10" onkeyup="CheckId()"> 
					<span id="checkIdResult"	style="display: table-cell; vertical-align: middle; text-align: left;"></span>
				</div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">*비밀번호</label>
				<div class="col-lg-5">
					<input class="form-control" id="password" type="password" size="10"	maxlength="15" onkeyup="PasswordRegexCheck()"> 
					<span id="PasswordRegexCheck" style="display: table-cell; vertical-align: middle;">
						<font color="red">비밀번호는 특수문자 /문자/ 숫자를 한자 이상 포함 형태의 8~15자리 이내여야 	합니다.</font>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호 확인</label>
				<div class="col-lg-5">
					<input class="form-control" id="password2" type="password" size="10" maxlength="15">
				</div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="inputName" class="col-lg-2 control-label">*이름</label>
				<div class="col-lg-5">
					<input class="form-control" id="name" type="text" size="10">

				</div>
			</div>
			<!-- 휴대폰 -->
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">*휴대폰번호</label>
				<div class="col-lg-1" style="width: 150px;">
					<select class="form-control" id="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
				<div class="col-lg-1" style="display: table; width: 1px; height: 34px; padding-left: 0px; padding-right: 0px;">
					<span style="display: table-cell; vertical-align: middle;">-</span>
				</div>
				<div class="col-lg-2" style="width: 135px;">
					<input class="form-control" type="text" id="tel2" size="10"	maxlength="4">
				</div>
				<div class="col-lg-1" style="display: table; width: 1px; height: 34px; padding-left: 0px; padding-right: 0px;">
					<span style="display: table-cell; vertical-align: middle;">-</span>
				</div>
				<div class="col-lg-2" style="width: 135px;">
					<input class="form-control" type="text" id="tel3" size="10"		maxlength="4">
				</div>
			</div>
			<!-- 이메일 -->
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">*이메일</label>
				<div class="col-lg-5">
					<input class="form-control" id="email" type="email" size="20"onkeyup="CheckEmail()"> 
					<span id="checkEmailResult"	style="display: table-cell; vertical-align: middle;"></span>

				</div>


			</div>
			<!-- 주소 -->
			<div class="form-group" style="margin-bottom: 5px;">
				<label class="col-lg-2 control-label">*주소</label>
				<div class="col-lg-3">
					<input class="form-control" type="text" size="10" id="postcode"	id="postcode" value="" readonly="readonly">
				</div>
				<div class="col-lg-2" style="padding-left: 0px;">
					<input class="form-control" type="button"
						onclick="SearchPostcode()" value="우편번호검색" class="">
				</div>
				<div id="layer"	style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
					<img
						src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
						id="btnCloseLayer"
						style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
						onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
				<script src="../js/SearchAddr.js"></script>

			</div>
			<div class="form-group" style="margin-bottom: 5px;">
				<label class="col-lg-2 control-label"></label>
				<div class="col-lg-5">
					<input class="form-control" type="text" id="address" size="60"
						id="address" value="" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label"></label>
				<div class="col-lg-5">
					<input class="form-control" type="text" size="60" id="addrDetail"
						value="">
				</div>
			</div>
			<!-- 자기소개 -->

			<div class="form-group">
				<label class="col-lg-2 control-label">자기소개</label>
				<div class="col-lg-5">
					<textarea class="form-control textarea1" id="introduction"> </textarea>
				</div>
			</div>

			<!-- 회원가입버튼 -->
			<div class="form-group">
				
				<div class="col-lg-offset-2 col-lg-5" style="text-align: right;">
					<font style="color:red; font-size: 15px;font-weight: bold;">*는 필수 입력 사항 입니다.</font><br><br>
					<input class="btn btn-default _btn" type="button"
						onclick="InsertMember()" value="회원가입하기"> <input
						class="btn btn-default _btn" type="button"
						onclick="location.href='./MemberLoginForm'" value="취소">

				</div>
			</div>
		</div>
	</div>

</body>
</html>