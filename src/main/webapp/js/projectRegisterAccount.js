/**
 * 프로젝트 등록 부가정보관련 자바스크립트 
 */
$(function(){
	var path = $("#path").text();
	$(".save_button").click(function(){
		var regexp = /^([1-9])([0-9])+$/;
		var deposit = $("[name=depositAccount]").val()
		if(regexp.test(deposit) || deposit == ''){
			url = path + "forme/saveProject/ex";
			params = $("#registerAccountFrm").serialize();
			
			$.ajax({
				url : url,
				data : params,
				type : "post",
				success : function(result) {
					$("#alertMessage").text('저장되었습니다.');
					$("#alertModal").show();
				}
			}); 
		}else {
			$("#alertMessage").text("계좌번호 입력란은 첫글자가 0이 아닌 숫자만 가능합니다.");
			$("#alertModal").show();
		}
	});
	$(".register_button").click(function(){
		var check = registerCheck();
		if(check){
			$("#confirmRCMessage").html('정말 등록하시겠습니까?<br>등록완료 후 메인 화면에 프로젝트가 나타나게 됩니다.<br>적절하지 않을 경우 관리자에 의해 보류되어질 수 있음<br>양해부탁드립니다.');
			$("#confirmRC").show();
		}
	});
	$("#confirmRCOk").click(function(){ 
		$("#confirmRC").hide();
		var url = path + "forme/registerComplete";
		var params = $("#registerAccountFrm").serialize();
		$.getJSON(url,params,function(result){
			if(result.code=="success"){
				$("#alertMessage").text('정상적으로 등록되었습니다.');
				$("#alertModal").show();
				var userId = $("input[name=userId]").val();
				location.href=path + "forme/getMyProjects?userId=" + userId;
			}else if(result.code=="fail"){
			$("#alertMessage").text('등록에 실패했습니다. 리워드를 등록해주세요.');
				$("#alertModal").show();
			}
		});
	});
});