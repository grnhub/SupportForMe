<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=request.getContextPath()%>/js/projectRegisterBasic.js?ver=1"></script>
<title>프로젝트 등록</title>
</head>
<body>
		<div id="pageInfo" style="display:none">basic</div>
		<form name="fileUploadFrm" id="fileUploadFrm" method="post">
			<input type="file" name="uploadFile" id="fileUploadImage" accept=".gif, .jpg, .png"  style="display:none">
		</form>
		<div style="height: 50px"></div>
		
		<form name="registerBasicFrm" id="registerBasicFrm">
			<input type="hidden" name="projectNo" value="${project.projectNo}">
			<input type="hidden" name="userId" value="${project.userId}">
			<div id="basic_subject">
				<div class="bold">프로젝트의 제목을 적어주세요</div>
				<input type="text" name="projectName" id="r_projectName" class="inputStyle" maxlength="50"  value="${project.projectName}">
			</div>
			<div id="basic_category">
				<div class="bold">프로젝트 분야를 선택해주세요</div>
				<div class="checks small">
					<input type="radio" id="category1" name="categoryCode" value="001">
					<label for="category1">공연</label>
				</div>
				<div class="checks small">
					<input type="radio" id="category2" name="categoryCode" value="002" >
					<label for="category2">영화</label>
				</div>
				<div class="checks small">  
					<input type="radio" id="category3" name="categoryCode" value="003" >
					<label for="category3">미술</label>
				</div>
				<div class="checks small">
					<input type="radio" id="category4" name="categoryCode" value="004" >
					<label for="category4">도서</label>
				</div>
				<script>
					var category = '${project.categoryCode}';
					
					switch(category){
						case "001" : $("#category1").attr("checked",true); break;
						case "002" : $("#category2").attr("checked",true); break;
						case "003" : $("#category3").attr("checked",true); break;
						case "004" : $("#category4").attr("checked",true); break;
					}
				</script>
			</div>
			<div id="basic_target">
				<div class="bold">목표 금액을 적어주세요</div>
				<div class="lg"><span style="color:#FF007F" class="bold">최소 100,000원 이상</span>이어야 합니다.</div>
				<input type="text" name="targetAmount" id="r_targetAmount" 
					class="inputStyle inputRight"  placeholder="0"> 원
				<c:if test="${project.targetAmount != null }">
					<script>
						$("input[name=targetAmount]").val(addComma('${project.targetAmount}'));
					</script>
				</c:if>
				<script>
				$("input[name=targetAmount]").on("focusout",function(){
					if("${project.progress}" == '004'){
						var num = $("input[name=targetAmount]").val(); 
						var regexp = /^([1-9])([0-9])+$/;
						if(regexp.test(num) || num == ''){
							if(num != ''){
								num = addComma(num);
								$("input[name=targetAmount]").val(num);
							}
						}else {
							$("#alertMessage").text("목표금액은 첫글자가 0이 아닌 숫자만 가능합니다.");
							$("#alertModal").show();
							var targetAmount = '${project.targetAmount}';
							if(targetAmount == ''){
								$("input[name=targetAmount]").val('');
							}else {
								$("input[name=targetAmount]").val(addComma('${project.targetAmount}'));
							}
							
						}
					}	
				});
				 
				 </script>
			</div>
			<div id="basic_">
				<div class="bold">프로젝트의 진행기간을 적어주세요</div>
				<div class="lg">최소 7일부터 최대 50일까지 가능합니다.</div>
				<div id="rg_projectPeriodDeadline">
					<input type="text" name="remainingPeriod" id="remainingPeriod"
						class="inputStyle inputRight" disabled><label class="lg" style="padding-top:5px">일 남음</label> 
					 <div id="rg_projectDeadline">
						<input type="text" name="projectDeadline" id="projectDeadline" class="inputStyle" value="">
					</div>
					<script>
						var deadLine = '${project.projectDeadline}';
						var dl = deadLine.split(".");
						if(deadLine != null && deadLine != ''){
							var now = new Date();
							var dDay = new Date(dl[0],dl[1]-1, dl[2]);
							var now2 = now.getTime();
							var dDay2 = dDay.getTime();
							var remain = dDay2 - now2;
							remain = Math.floor(remain / (24 * 3600 * 1000)) + 1;
							$("#remainingPeriod").val(remain);
							$("#projectDeadline").val(dl[0]+"-"+dl[1]+"-"+dl[2]);
						}
					</script>
				</div>
			</div>
			<div id="basic_">
				<div class="bold">프로젝트 대표 이미지를 등록해주세요</div>
				<div class="fileContainer"> 
					<div class="thumbnailImg rg_img">
						<img src="/SupportForMe/images/picture.png" id="default">
						<c:if test="${project.image != null}" >
							<img src="/SupportForMe/upload/${project.image}">
						</c:if>
					</div>
				</div>
			</div>
			</form>
	
			<div id="basic_keyword">
				<div class="bold">프로젝트 키워드를 적어주세요 <span style="color:#FF007F">(선택사항)</span></div>
				<div class="lg">제목 외에도 키워드 검색 시 검색 결과에 프로젝트가 나타납니다.</div>
				<input type="text" name="keyword" class="inputStyle keyText" maxlength="10"
						placeholder="최대 5개까지 등록 가능합니다. 키워드 입력 후 엔터를 눌러주세요." autocomplete=off>
				<div id="keyword_div">
				</div>
				<script>
				
				</script>
			</div>
			<input type="button" name="save" class="save_button basic" value="저장하기">
			<input type="button" name="next" class="next_button basic" value="다음 단계">
</body>
</html>