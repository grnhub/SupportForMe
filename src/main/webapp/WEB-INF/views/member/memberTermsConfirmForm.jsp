<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 약관 동의</title>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"	rel="stylesheet">
<style>
.wrapper {
	display: grid;
	grid-template-columns: 50% auto;
	grid-auto-rows: minmax(50px, auto);
}
/*   .wrapper > div{
        background-color: orange;
        border: 1px black solid;
        }  */
.div1 {
	grid-column: 1/3;
	text-align: center;
}

.div2 {
	grid-column: 1/3;
	text-align: center;
}

.div3 {
	grid-column: 1/3;
	text-align: center;
}

.div4 {
	grid-column: 3/3;
	text-align: center;
}

button.btn1 {
	height: 70px;
	width: 100px;
	background-color: dimgrey;
	color: white;
}

textarea.textarea1 {
	resize: none;
	width: 100%;
	height: 200px;
}

.table {
	width: 1200px;
}

.border {
	border-left: 1px solid lightgrey;
	border-right: 1px solid lightgrey;
}

._btn {
	background-color: rgb(26, 188, 156);
	color: white;
}
</style>
</head>
<script>
	function NextStep() {
		var check1 = $("input:checkbox[id='check1']").prop("checked");
		var check2 = $("input:checkbox[id='check2']").prop("checked");
		if (check1 == false || check2 == false) {
			alert('약관에 동의하셔야 합니다.')
			return false;
		} else {
			document.location.href = '<c:url value='/'/>support/MemberJoinForm'
		}
	}
</script>
<body>
	<div class="wrapper">
		<div class="div1">
			<h1 style="text-align: left;">&nbsp&nbsp&nbsp&nbsp&nbsp회원가입</h1>
			<br> <img src="../images/회원이미지.png" width="1200px"
				height="170px">
		</div>
		<div style="height: 50px;"></div>

		<div class="div2" style="margin: 0 auto;">
			<table width="1200px" align="center">
				<caption style="text-align: left;">홈페이지 이용약관</caption>
				<tr>
					<td colspan="3"><textarea class="textarea1"
							readonly="readonly">
제 1 장 총칙
제 1 조 (목적)
본 약관은 개인정보보호법, 전기통신사업법 및 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 의하여 (주)SupportForME(이하 "회사"라 한다)이 제공하는 회원 서비스(이하 "서비스"라 한다)의 이용 조건, 절차 그리고 회원규칙에 관한 사항 등을 규정함을 목적으로 합니다.
제 2 조 (공지)
1. 본 규정은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생합니다.
2. 회사는 “개인정보보호법”, “약관의규제에관한법률”, “정보통신망이용촉진및정보보호등에관한법률” 등 관련법을 위배하지 않는 범위에서 본 규정을 변경할 수 있으며, 변경된 규정은 제1항과 같은 방법으로 공지함으로써 효력을 발생합니다.
제 3 조 (약관 외 준칙)
본 약관에 규정되지 않은 사항은 전기통신사업법 및 정보통신망 이용촉진 및 정보보호 등에 관한 법률 기타 관련법령의 규정에 의합니다.
제 4 조 (용어의 정의)
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. “이용자”이라 함은 회사와 서비스 이용계약을 체결한 자를 말합니다.
2. “이용자 ID”라 함은 “회원”의 식별과 서비스 이용을 위하여 “회원”이 정하고 회사가 승인하는 문자와 숫자의 조합을 의미합니다.
3. “비밀번호”라 함은 이용자ID와 일치된 “회원”이 이용자임을 확인하고 “회원” 자신의 비밀을 보호하기 위하여 “회원” 자신이 설정한 문자와 숫자의 조합을 말합니다.
4. “운영자”라 함은 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람을 말합니다.
제 2 장 서비스 이용 계약
제 5 조 (이용계약의 성립)
1. 이용계약은 이용자가 이용 약관에 대한 "동의" 버튼을 클릭하면 이 약관에 동의하는 것으로 간주하며, 이용자는 회원가입신청을 하여야 합니다.
2. 이용계약은 이용자의 가입 신청에 대하여 회사가 승낙함으로써 성립합니다.
제 6 조 (이용계약의 유보 및 거절)
1. 회사는 다음에 해당하는 경우에는 이용계약의 승낙을 유보할 수 있습니다.
가. 서비스 설비용량에 여유가 없는 경우
나. 서비스를 제공하기에는 기술적으로 문제가 있다고 판단되는 경우
다. 기타 회사가 필요하다고 인정되는 경우
2. 회사는 다음에 해당하는 경우에는 이용계약의 승낙을 거절할 수 있습니다.
가. 본인 실명과 다르게 이용신청을 하였을 경우
나. 이용신청서의 내용을 허위로 기재하였거나 허위서류를 첨부하여 이용신청을 하였을 경우
제 7 조 (이용자ID 등의 관리)
1. 이용자ID는 본인실명으로 개인에게 하나만을 발급하는 것을 원칙으로 합니다.
2. 이용자ID는 본명(실명)이 이용자명과 연계되어야 합니다. 이용자ID를 소유한 이용자는 이용자ID 및 비밀번호에 대한 관리 책임이 있으며, 서비스 이용상의 과실 또는 제 3자에 의한 부정사용 등으로 인해 발생하는 모든 불이익에 대해 책임을 져야 합니다. 다만 회사에 고의 또는 중대한 과실이 있는 경우에는 그러하지 않습니다.
제 8 조 (이용계약사항의 변경)
1. 이용자는 다음에 해당하는 변경사항이 있을 경우에는 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 단, 이러한 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.
가. 주소 및 전화번호
나. 비밀번호
다. 기타 회사가 인정하는 사항
2. 이용자ID는 다음에 해당할 경우 이용자의 요청에 의하여 변경할 수 있습니다.
가. 이용자의 전화번호, 주민등록번호 등으로 등록되어 사생활 침해가 우려되는 경우
나. 타인에게 혐오감을 주는 경우
다. 기타 회사가 인정하는 경우
제 3 장 서비스 이용
제 9 조 (회사의 의무)
회사는 서비스 제공과 관련해서 알고 있는 이용자의 신상정보를 본인의 승낙 없이 제 3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.
제 10 조 (이용자의 이용자 ID와 비밀번호 관리에 대한 의무)
1. 이용자 ID와 비밀번호에 관한 모든 관리 책임은 이용자에게 있습니다. 이용자 ID와 비밀번호의 관리 소홀, 부정사용 등에 의하여 발생하는 모든 결과에 대한 책임은 이용자에게 있습니다.
2. 자신의 이용자 ID와 비밀번호가 부정하게 사용되고 있음을 발견한 이용자는 즉시 회사에 그 사실을 통보해야 합니다.
제 11 조 (서비스 전반에 관한 이용자의 의무)
1. 이용자는 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
① 다른 이용자의 이용자 ID를 부정하게 사용하는 행위
② 서비스에서 얻은 정보를 회사의 사전승낙 없이 이용자의 이용 외의 목적으로 복제하거나 출판 및 방송 등에 사용하거나 제3자에게 제공하는 행위
③ 제3자의 저작권 등 기타 권리를 침해하는 행위
④ 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
⑤ 범죄와 결부된다고 객관적으로 판단되는 행위
⑥ 타인의 명예를 훼손하거나 불이익을 주는 행위
⑦ 기타 관계법령 및 본 약관을 위배하는 행위
2. 이용자는 본 약관에서 규정하는 사항과 회사가 서비스 이용안내 또는 주의사항 등 회사가 공지하는 사항을 준수하여야 합니다.
3. 이용자는 회사의 사전승낙 없이는 서비스를 이용하여 영업활동을 할 수 없으며, 그 영업활동으로 인하여 발생된 결과에 대하여 회사는 어떠한 책임도 지지 않습니다.
제 12 조 (서비스 이용시간)
1. 서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 1일 24시간, 연중 무휴서비스를 원칙으로 합니다. 다만, 시스템 점검, 교체, 보수 등과 같은 필요가 있는 경우는 그러하지 않습니다.
2. 회사는 서비스를 일정범위로 분할하여 각 범위별로 이용가능시간을 별도로 정할 수 있습니다.
제 13 조 (서비스 제공의 중지)
1. 회사는 전시사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신사업자가 전기통신 서비스를 중지하는 등 기타 부득이한 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
2. 회사는 전 항의 규정에 의하여 서비스의 이용을 제한하거나 정지한 때에는 그의 사유 및 제한기간 등을 지체 없이 이용자에게 공지합니다.
제 4 장 계약 해지 및 이용 제한
제 14 조 (계약해지 및 이용제한)
1. 이용자가 이용계약을 해지하고자 하는 때에는 본인이 온라인을 통해 회사에 해지신청을 하여야 합니다.
2. 회사가 서비스 이용을 제한하고자 하는 경우 그 사유와 일시 등을 이용자에게 통지합니다. 다만, 회사가 긴급하게 이용을 정지할 필요가 있다고 인정하는 경우에는 바로 제재를 가할 수 있습니다.
3. 전 항의 규정에 의하여 이용정지를 통지 받은 이용자는 그 이용 정지의 통지에 대해 부당하다고 생각할 경우 이의신청을 할 수 있습니다.
4. 회사는 전 항의 규정에 의한 이의신청에 대하여 그 확인을 위한 기간까지 이용정지를 일시 연기할 수 있으며, 그 경과와 결과를 이용 고객에게 통지합니다.
5. 회사는 이용정지 기간 중에 그 이용정지 사유가 해소된 것이 확인된 경우에는 이용정지 조치를 즉시 해제합니다.
제 5 장 손해배상 등
제 15 조 (손해 배상)
회사는 서비스가 무료인 동안 서비스 이용과 관련하여 이용자에게 발생한 손해에 대하여는 어떠한 책임도 지지 않습니다. 서비스 유료화 이후에 관하여는 별도로 정합니다.
제 16 조 (면책조항)
1. 회사는 천재지변 기타 불가항력적인 사유로 인해 서비스를 제공할 수 없는 경우에는 서비스 제공중지에 대한 책임이 면제 됩니다.
2. 회사는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.
3. 회사는 이용자가 서비스를 이용하여 얻은 정보 등으로 인해 입은 손해 등에 대하여는 책임을 지지 않습니다.
4. 회사는 회사의 서비스망을 통해 제공되는 IP 정보와 이용자가 게시하거나 전송한 정보 등의 신뢰도나 정확성에 대하여는 책임을 지지 않습니다.
제 17조 (준거법 및 재판관할)
1. 회사와 회원간 제기된 소송은 대한민국법을 준거법으로 합니다.
2. 회사와 회원간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.
[부칙]이 약관은 공시일로부터 시행합니다.</textarea></td>
				</tr>

				<tr style="text-align: right">
					<td colspan="3"><input type="checkbox" id='check1'
						name="check" value="동의">동의함</td>
				</tr>
			</table>
		</div>


		<div class="div3" style="margin: 0 auto;">
			<!-- 	<p style="text-align: left;">개인정보 수정 및 이용 등에 대한 동의(필수사항)</p> -->
			<br>
			<table class="table table-striped" style="margin: 0 auto;">
				<caption style="text-align: left;">회원 관리</caption>
				<tr>
					<td>수집 하는 개인정보 항목</td>
					<td class="border">수집 및 이용 목적</td>
					<td>보유 및 이용기간</td>
				</tr>
				<tr>
					<td>이름, 로그인ID, 비밀번호, 이메일, 휴대전화번호, 주소</td>
					<td class="border">회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와
						비인가 사용방지, 가입의사 확인, 고지사항 전달, 회원탈퇴 의사의 확인</td>
					<td>회원탈퇴시 삭제, 최종 로그인 날짜 기준 1년간 미로그인시 자동 삭제, 단, 탈퇴한 회원의 로그인ID는
						중복ID 회원가입방지를 위해 5년간 보유합니다.</td>
				</tr>
				<tr style="text-align: right">
					<td colspan="3"><input type="checkbox" id="check2" value="동의">동의함
					</td>
				</tr>
				<tr style="text-align: right;">
					<td colspan="3">
						<button class="btn btn-default _btn" onclick="NextStep()">다음</button>
						<button class="btn btn-default _btn"
							onclick="location.href='<c:url value='/'/>/forme/MemberLoginForm'">취소</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>