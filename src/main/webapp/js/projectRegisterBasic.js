/**
 * 프로젝트 기본정보 등록 자바스크립트
 */

$(function() {
	var path = $("#path").text();
	var progress = $("#progress").text();
	//저장하기
	$(".save_button").click(function(){
		url = path + "forme/saveProject/basic";
		params = $("#registerBasicFrm").serialize();
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
	//다음단계
	$(".next_button").click(function(){
		$.ajax({
			url : path + "forme/updateProject/story",
			data : $("#registerBasicFrm").serialize(),
			type : "post",
			success : function(result) {
				$("#result").html(result);
				$("#rn > .rnbs").removeClass("_active");
				$("#rn > .rnst").addClass("_active");	
			}
		});
			
});

//프로젝트 마감일 
$("#projectDeadline").datepicker(
		{	
			
			dateFormat : "yy-mm-dd",
			maxDate : "+1m +19d", //7 // new Data(2018,11,20)
			minDate : "1w",
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			onSelect : function(strDate, obj) {
				var now = new Date();
				var dDay = new Date(obj.selectedYear, obj.selectedMonth, obj.selectedDay);
				var now2 = now.getTime();
				var dDay2 = dDay.getTime();
				var remain = dDay2 - now2;
				remain = Math.floor(remain / (24 * 3600 * 1000)) + 1;
				$("#remainingPeriod").val(remain);
			},
			showOn : "both",
			buttonImage : "/SupportForMe/images/calendar.png",
			buttonImageOnly : true,
			buttonText : "Select date"
			
});
//대표 이미지 
$(".thumbnailImg").click(function(){
	$("#fileUploadImage").click();
});

$("#fileUploadImage").on("change",function() {

	if($(this).val() != "") {
		$("#fileUploadFrm").ajaxForm({
			dataType:"json",
			url:path + 'forme/fileUpload',
			success: 
				function(result, textStatus){
					if(result.code = 'success') {
						var fileName = result.filename;
						$("#default").hide();
						var img = "<img src='/SupportForMe/upload/"+fileName+"'>";
						var tn = "<input type='hidden' name='image' id='thumbImage' value='"+fileName+"'>";
						$(".thumbnailImg").html(img + "<br>" + tn); 
					}
				},
			error: 
				function(){
					alert("파일업로드 중 오류가 발생하였습니다.");
					return;
				}
		}).submit();
	}
}); 
//대표 이미지 end
//hashtag-----------------------------
var projectNo = $("input[name=projectNo]").val();
function loadHashtagList() {
	$.ajax({
		url : path + 'forme/hashtags/'+projectNo,
		type:'GET',
		dataType : 'json',
		success : function(datas){
			$("#keyword_div").empty();
			for(i = 0; i<datas.length; i++){
				makeHashtagList(datas[i]);
			}
		}
	});
}

function makeHashtagList(ht){
	var k = "<span class='keyword' id='"+ ht.hashtagNo + "'><label class='keyword_label'>"+ ht.hashtagName
	 		  + "</label><img src='/SupportForMe/images/remove.png' class='remove'></span>";
	 		$("#keyword_div").append(k);
}

$("input[name='keyword']").keydown(function(e){
	
	if(e.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		
		if($(".keyword").length < 5){
			var key = $(this).val();
			
			$.ajax({
				url : path + 'forme/hashtags',
				type:'POST',
				dataType : 'json',
				data : JSON.stringify({projectNo:projectNo,hashtagName:key}),
				contentType: 'application/json', 
				success : function(result){
					if(result.code == "success"){
						makeHashtagList(result.hashtag);
					}else if(result.code == "same"){
						$("#alertMessage").text("중복된 키워드입니다.");
						$("#alertModal").show();
					}
				}
			});
		}else {
			alert("최대 5개 까지입니다.");
		}
		$("input[name='keyword']").val("");
    }
	
});

$(document).on("click",".remove",function(){
	var removeKey = $(this).parent().attr("id"); 
	 $.ajax({
		url : path + "forme/hashtags/"+removeKey,
		type: 'DELETE',
		contentType:'application/json;charset=utf-8',
		dataType : "JSON",
		success : function(result) {
			if(result.code = 'success') {
				$("#"+removeKey).remove();
			}
		},
		error : function() {
			alert("삭제할 수 없습니다.")
		} 
	});	
})

loadHashtagList();
//hashtag 끝-----------------------------

if(progress != '004'){
	$("input[name=targetAmount]").attr("readonly", true);
	$("#projectDeadline").datepicker("destroy");
	$("#projectDeadline").attr("readonly",true);
}
});