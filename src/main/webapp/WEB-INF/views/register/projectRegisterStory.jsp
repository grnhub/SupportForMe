<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value='/'/>js/projectRegisterStory.js?ver=2"></script>
<title>프로젝트 등록</title>
<style>
</style>
</head>

<body>
<script>
$(function() {
	var path = "<c:url value='/'/>";
	//전역변수선언
	var editor_object = [];
	 
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: editor_object,
	    elPlaceHolder : "smarteditor",
	    sSkinURI: "/SupportForMe/smarteditor/SmartEditor2Skin.html",
	    htParams : {
	        // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	        bUseToolbar : true,             
	        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	        bUseVerticalResizer : true,     
	        // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	        bUseModeChanger : true, 
	    }
	});
	$(".save_button").click(function(){
		
		editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		url = path + "forme/saveProject/story";
		params = $("#registerStoryFrm").serialize();
		
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
	$(".next_button").click(function(){
		
		//id가 smarteditor인 textarea에 에디터에서 대입
    	editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var data = $("#registerStoryFrm").serialize();
		$.ajax({
			url : path + "forme/updateProject/reward",
			data : data, 
			type : "post",
			success : function(result) {
				$("#result").html(result);
				$("#rn > .rnst").removeClass("_active");
				$("#rn > .rnrw").addClass("_active");	
			}
		}); 
	});
});
</script>
<div id="storyPage">
	<form name="fileUploadStoryFrm" id="fileUploadStoryFrm" method="post">
		<input type="file" name="uploadFile" id="fileUploadStory"  accept=".gif, .jpg, .png" style="display:none">
	</form>
    <div style="height:50px"></div>
    <form name="registerStoryFrm" id="registerStoryFrm">
	    <input type="hidden" name="projectNo" value="${project.projectNo}">
	    <input type="hidden" name="userId" value="${project.userId}">
	    <div id="story_introduction" style="height:50px">
			<div class="bold">프로젝트 소개 영상과 이미지를 등록해주세요</div>
	        <div class="lg">소개영상과 이미지를 함께 등록할 경우, 영상부터 보여지게 됩니다</div>
	    </div>
		<div id="story_video">
			<div class="bold">동영상 주소를 적어주세요</div>
			<div class="lg">Youtube만 가능합니다.</div>
			<c:if test="${project.introductionVideo != null}" >
				<c:forTokens var="video" items="${project.introductionVideo}" delims="||" varStatus="i">
					<div class="videoUrl">
				        <input type="text" placeholder="  YouTube URL을 입력해주세요." class="videoInput ${i.index+1}" name="arrVideo">
				        <span class="videoSpan"><img src="/SupportForMe/images/plus1.png" class="videoPlus"></span>
			        </div>
			        <script>
			        	var index = "${i.index+1}";
			 			var video = "${video}";
			        	var videoUrl = "https://youtu.be/" + video;
			        	$(".videoInput."+index).val(videoUrl); 
			        </script>   		
	    		</c:forTokens>	
			</c:if>
			<c:if test="${project.introductionVideo == null}" >
			<div class="videoUrl">
		        <input type="text" placeholder="  YouTube URL을 입력해주세요." class="videoInput" name="arrVideo">
		        <span class="videoSpan"><img src="/SupportForMe/images/plus1.png" class="videoPlus"></span>
	        </div>
	        </c:if>
		</div>
		<div id="story_image">
			<div class="bold">이미지를 등록해주세요</div>
			<div class="fileContainer introImg">
					<c:if test="${project.introductionImage != null}" >
							<c:forTokens var="image" items="${project.introductionImage}" delims="||" varStatus="i">
								<div class="introductionImg rg_img soge">
									<img src="/SupportForMe/upload/${image}">	
									<img src="/SupportForMe/images/slimcancel.png" class="sogeRemove ${i.index+1}">
									<input type='hidden' name='arrImage' value='${image}'>
								</div>             		
			          		</c:forTokens>	
					</c:if>
					<c:if test="${project.introductionImage == null}">
						<div class="introductionImg rg_img" id="storyDefault">
							<img src="/SupportForMe/images/picture.png" id="default" class="">	
						</div>
					</c:if>
					<div class="introductionImg plus rg_img">
						<img src="/SupportForMe/images/plus1.png" id="plus">
					</div>
			</div>
	    </div>
	    <div id="story_contents">	
	    	<div class="bold">프로젝트 스토리를 적어주세요</div>
			<textarea id="smarteditor" name="story" rows="10" cols="60" style="width: 720px; height: auto; resize: none">${project.story}</textarea>
	    </div>
	    <div style="height:50px"></div>
	   	<input type="button" name="save" class="save_button story" value="저장하기">
		<input type="button" name="next" class="next_button story" value="다음 단계">
	</form>
</div>	
</body>
</html>