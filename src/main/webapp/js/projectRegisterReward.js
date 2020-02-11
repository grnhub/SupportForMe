/**
 * 프로젝트 선물 등록 자바스크립트 

 */

$(function() {
	var path = $("#path").text();
	var progress = $("#progress").text();
	$("#result").off("click");
	var projectNo = $("#projectNo").val();
	/* var context = '${pageContext.request.contextPath}';	//절대 경로
	console.log(context); */
	
	$(".next_button").click(function(){
		$.ajax({
			url :path + "forme/updateProject/account",  
			data : $("#rewardRegisterFrm").serialize(),
			type : "post",
			success : function(result) {
				$("#result").html(result);
				$("#rn > .rnrw").removeClass("_active");
				$("#rn > .rnac").addClass("_active");	
			}
		});	
	});
	
	$(".save_button").click(function(){
		url = path + "forme/saveProject/ex";
		params = $("#rewardRegisterFrm").serialize();
		
		$.ajax({
			url : url,
			data : params,
			type : "post",
			success : function(result) {
				$("#alertMessage").text('저장되었습니다.');
				$("#alertModal").show();
			}
		}); 
	});
	//선물 등록, 선물 수정 
	$("#registerRewardFrm").on("click",".add_button",function(){
			var seq = $("#registerRewardFrm [name=presentNo]").val();
			var params =  $("#registerRewardFrm").serialize();
			if(seq != ''){
				var url = path + "forme/updateReward";
				$.getJSON(url, params, function(datas){
					var newDiv = makeRewardBox(datas);
					var oldDiv = $("#rw"+datas.presentNo);
					$(newDiv).replaceAll(oldDiv);
					$("[name=registerRewardFrm]")[0].reset();
					$("#registerRewardFrm [name=presentNo]").val('');
					deliveryDateInput(datas.presentDeliveryDate);
					$("#alertMessage").text("정상적으로 수정되었습니다.");
					$("#alertModal").show();
				});
			}else {
				if(checkReward()){
					var url = path + "forme/insertReward";
					$.getJSON(url, params, function(datas){
						$("#reward_preview").append( makeRewardBox(datas));
						$("[name=registerRewardFrm]")[0].reset();
						deliveryDateInput(datas.presentDeliveryDate);
						$("#alertMessage").text("정상적으로 등록되었습니다.");
						$("#alertModal").show();
					});
				}	
			} 		
	});
	
	//선물입력 폼 값 체크
	function checkReward(){
		
		if(progress != '004'){
			$("#alertMessage").text("진행중인 프로젝트는 리워드를 등록할 수 없습니다.");
			$("#alertModal").show();
			return false;
		}
		var msg="";
		var regexp = /^([1-9])([0-9])+$/;
		if(!$("#registerRewardFrm [name=presentPrice]").val()){
			$("#alertMessage").text("리워드 금액을 적어주세요.");
			$("#alertModal").show();
			return false;
		}
		if(!regexp.test($("#registerRewardFrm [name=presentPrice]").val())){
				$("#alertMessage").text("리워드 금액은 첫 글자가 0이 아닌 숫자만 가능합니다.");
				$("#alertModal").show();
			return false;
		}
		if(!$("#registerRewardFrm [name=presentName]").val()){
			$("#alertMessage").text("리워드 구성을 적어주세요.");
			$("#alertModal").show();
			return false;
		}
		if(!$("#registerRewardFrm [name=presentDeliveryDate]").val()){
			$("#alertMessage").text("예상배송일을 선택해주세요.");
			$("#alertModal").show();
			return false;
		}
		return true;
	}
	
	//수정폼 이벤트(수정할 선물을 다시 등록 폼으로 옮김 )
	$("#reward_preview_div").on("click",".rewardEdit",function(){
		if(progress != '004'){
			$("#alertMessage").text("진행중인 프로젝트는 리워드를 수정 할 수 없습니다.");
			$("#alertModal").show();
		}else {
			var reward = $(this).closest(".reward_preview_box").get(0).reward;
			$("#registerRewardFrm [name=presentNo]").val(reward.presentNo);  
			$("#registerRewardFrm [name=presentPrice]").val(reward.presentPrice);
			$("#registerRewardFrm [name=presentName]").val(reward.presentName);
			$("#registerRewardFrm [name=presentDeliveryDate]").val(reward.presentDeliveryDate);
		}
	});
	var delSeq;
	//선물 삭제 
	$("#reward_preview").on("click",".rewardDel",function(){
		if(progress != '004'){
			$("#alertMessage").text("진행중인 프로젝트는 리워드를 삭제할 수 없습니다.");
			$("#alertModal").show();
		}else {
			delSeq = $(this).closest(".reward_preview_box").attr("id").substring(2);
			console.log(delSeq);
			$("#confirmRDMessage").text("해당 선물을 삭제하시겠습니까?");
			$("#confirmRD").show();  
		}
	});
	
	
	$("#confirmRDOk").click(function(){
		var params = "presentNo=" + delSeq;
		var url = path + "forme/deleteReward";
			$.getJSON(url,params,function(datas){
				$('#rw'+delSeq).remove();
				$("#confirmRD").hide();	
				delSeq = '';
		});
	});
	$("#confirmRDCel").click(function(){
		$("#confirmRD").hide()
		$("#confirmRDMessage").text('');
	});
	$(".close").click(function(){
		$(this).closest(".modal").hide();
		$(this).next().text('');
	});
	
	//프로젝트 예상배송일 함수 
	function deliveryDateInput(date) {
		var dateList = $(".rw_preview_delivery");
		var tempDate = date;
		for(var i=0;i<dateList.size();i++){
			var newDate = dateList.eq(i).text();
			if(newDate < tempDate){
				tempDate = newDate;
			}
		}
		var d = tempDate.split('-');
		
		$("input[name=deliveryDate]").val(d[0]+"."+d[1]+"."+d[2]);
	}
	
	//선물 목록 조회 요청
	function loadRewardList() {
		var params = {projectNo : projectNo};
		$.getJSON(path + "forme/getRewards",params,function(datas){
			$("#reward_preview").empty();
			for(i = 0; i<datas.length; i++){
				$("#reward_preview").append(makeRewardBox(datas[i]));	
			}
		});
	}

	function makeRewardBox(reward) {
		var div = $("<div>");
		div.attr("id", "rw"+reward.presentNo);
		div.addClass('reward_preview_box');
		div[0].reward=reward;
		
		var rewardBox = "<div class='rw_preview_amount_div'><span class='rw_preview_amount'>"+addComma(reward.presentPrice)+"</span><label>원 펀딩</label></div>"
					  + "<div class='rw_preview_delivery_s'>리워드 구성</div>"
					  + "<div class='rw_preview_info'>"+reward.presentName+"</div>"
					  + "<div class='rw_preview_delivery_s'>예상배송일</div>"
					  + "<div class='rw_preview_delivery'>"+reward.presentDeliveryDate+"</div><div class='preview_button'>"
					  + "<button type='button' class='rewardEdit'><img src='/SupportForMe/images/rewardEdit.png' class='rewardImg'>수정</button>"
					  + "<button type='button' class='rewardDel'><img src='/SupportForMe/images/rewardDel.png' class='rewardImg'>삭제</button>"
					  + "</div>";
		
		div.html(rewardBox);
		return div;
	}

	//목록 조회
	loadRewardList(); 
	
});