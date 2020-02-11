<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html5>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=request.getContextPath()%>/js/projectRegisterReward.js?ver=1.3"></script>
</head>
<body>
<div style="height: 50px"></div>
<form name="rewardRegisterFrm" id="rewardRegisterFrm">
	<input type="hidden" name="projectNo" value="${project.projectNo}">
	<input type="hidden" name="userId" value="${project.userId}">
	<input type="hidden" name="deliveryDate" value="${project.deliveryDate}">
</form>
<form name="registerRewardFrm" id="registerRewardFrm">
<input type="hidden" name="projectNo" value="${project.projectNo}" id="projectNo">
<input type="hidden" name="presentNo" value="">
<div class="bold">프로젝트 리워드를 구성해주세요</div>
<div class="lg">
	프로젝트 시작을 위해서는 <span style="color:#FF007F" class="bold">최소 1개 이상의 리워드</span>가 있어야 합니다. <br>
	배송이 필요한 리워드는 배송비가 포함된 가격을 적어주세요.
</div>
<div id="reward_box">
	<div class="reward_grid"><label>리워드 금액 </label><input type="text" name="presentPrice" id="reward_input"><label>&nbsp;&nbsp;원</label>
	</div>
    <div class="reward_grid">
    	<label>리워드 구성 </label>
    	<textarea  rows="5" cols="200" id="reward_textarea" name="presentName"
    			  placeholder="준비된 리워드를 적어주세요."></textarea>
    </div>
    <div class="reward_grid">
	    <label>예상 배송일 </label>
	    <div style="display:grid; grid-template-columns: 1fr 1fr;margin:0">
		    <div class="rg_delivery"> 
		    	<input type="text" name="presentDeliveryDate" id="presentDeliveryDate">
		    </div>
		    <c:if test="${project.projectDeadline ne null}">
		    <span style="display:inline-block;padding-top:15px;"> 마감일 ${project.projectDeadline}</span>
		    </c:if>
	    </div>
	    <script>
	    var deadline = '${project.projectDeadline}';
	    var minDate,maxDate;
	    console.log(deadline);
	    if(deadline != ''){
	    	minDate = new Date(deadline);
	    	maxDate = new Date(deadline);
	    	maxDate.setDate(maxDate.getDate()+13);
	    }else {
	    	minDate = '+1w';
	    	maxDate = "+1m +19d";
	    }
		$("#presentDeliveryDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					maxDate : maxDate,
					minDate : minDate,
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					onSelect : function(strDate, obj) {
						if(deadline == ''){
							$("#alertMessage").text("프로젝트 마감일을 먼저 선택해주세요.");
							$("#alertModal").show();
							$("#presentDeliveryDate").val('');
						}
					},
					showOn : "both",
					buttonImage : "/SupportForMe/images/calendar.png",
					buttonImageOnly : true,
					buttonText : "Select date"
		});

		</script>
	    <label></label>
   </div>
    <div style="text-align:center;margin-top:20px;">
        <input type="button" class="reward_button add_button" value='등록'>
        <input type="reset" class="reward_button reset_button" value='초기화'>
    </div>
</div>
</form>
<div style="height:30px"></div>
<div id="reward_preview_div">
	<div class="bold" style="margin-bottom:15px;">등록된 리워드 미리보기</div>
	<div id="reward_preview">
	</div>
</div>
<div style="height:50px"></div>
<input type="button" name="save" class="save_button reward" value="저장하기">
<input type="button" name="next" class="next_button reward" value="다음 단계">
 <!-- 리워드 삭제  모달 -->
	<div id="confirmRD" class="modal">
	   <!-- Modal content -->
	   <div class="modal-content">                                                                   
	    <div class="close">&times;</div>
	  	<div id="confirmRDMessage">
	  	</div>
	  	<button type="button" id="confirmRDOk">확인</button> <button id="confirmRDCel">취소</button>
	   </div>
	 </div>
</body>
</html>