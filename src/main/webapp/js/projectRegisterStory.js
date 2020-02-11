/**
 * 프로젝트 스토리 등록 자바스크립트
 */
$(function(){
		var path = $("#path").text();
		
		
		//story page img upload---------------
		function sogeRemoveNo() {
			var removeCount = $(".sogeRemove").length;
			
			if(removeCount > 0){
				var removeEnd = $(".sogeRemove").eq(removeCount-1).attr("class").substr(11);
				return parseInt(removeEnd) + 1;	
			}
			else { return removeCount+1; }
		}
		$("#result").off("click change");		//on은 이벤트가 추가되는 것, result 안에 있는 이벤트를 삭제해줌
		
		//story page video url----------------
		$("#result").on("click",".videoSpan",function(){
			if($(this).parent().prev().val() != '' && !$(this).parent().parent().next().is(":visible")){
				var videoDiv = "<div class='videoUrl'>"
       			 + "<input type='text' placeholder='  YouTube URL을 입력해주세요.' class='videoInput' name='arrVideo'>"
       			 + " <span class='videoSpan'><img src='/SupportForMe/images/plus1.png' class='videoPlus'></span></div>";
       			$("#story_video").append(videoDiv);		
			} else {
				$("#alertMessage").text("youtube url을 입력해주세요.");
				$("#alertModal").show();
				
			}
		});
		
		
		//story page video url end------------
		
		$("#result").on("click","#storyDefault",function(){
			$("#fileUploadStory").click();
		});
		
		$("#fileUploadStory").on("change",function() {
			
			if($(this).val() != "") {
				$("#fileUploadStoryFrm").ajaxForm({
					dataType:"json",
					url: path + 'forme/fileUpload',
					success: 
						function(result, textStatus){
							if(result.code = 'success') {
								var fileName = result.filename;
								var RemoveNo = sogeRemoveNo();
								$("#storyDefault").remove();
								var img = "<div class='introductionImg rg_img soge'>"
										+ "<img src='"+path+"upload/"+fileName+"' id='soge'>"
										+ "<img src='/SupportForMe/images/slimcancel.png' class='sogeRemove "+RemoveNo+"'>"
										+ "<input type='hidden' name='arrImage' value='"+fileName+"'>"
										+ "</div>";	
										/* "<input type='hidden' name='arrImage' class='sogeHidden"+RemoveNo+"' value='"+fileName+"'>" */
								$(".plus").before(img);
	/*							$("#fileUploadStoryFrm")[0].reset();*/
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
		
		$(".plus").click(function(){
			console.log($(this).prev().attr("id"));
			if($(this).prev().attr("id") != "storyDefault"){
				var dfImg = "<div class='introductionImg rg_img' id='storyDefault'>"
					  + "<img src='/SupportForMe/images/picture.png' id='default'>"	
					  +	"</div>";
					$(".plus").before(dfImg);
			}else { 
				$("#alertMessage").text("먼저 이미지를 등록해주세요.");
				$("#alertModal").show();
			}
			
		})
		
		
		$("#result").on("click",".sogeRemove",function(){
			var cnt = $(this).attr("class").substr(11);
			var removeImg = $(this).prev().attr("src").split('/');
			var projectNo = $("input[name=projectNo]").val();
			var introImg = removeImg[3];
			$.ajax({
				url :  path + 'forme/deleteIntroductionImg',
				dataType : "JSON",
				data : {"removeIntroductionImg":introImg},
				type : "post",
				success : function(result) {
						if(result.code == "success"){
							$(".sogeRemove."+cnt).parent().remove();
							
							if(!$(".soge").is(":visible") && !$("#storyDefault").is(":visible")){
								var dfImg = "<div class='introductionImg rg_img' id='storyDefault'>"
									  	  + "<img src='/SupportForMe/images/picture.png' id='default'>"	
									  	  +	"</div>";
								$(".plus").before(dfImg);
							}		
						}	
					},
				error : function() {
					alert("삭제할 수 없습니다.")
				} 
			});   
		})
		//story page img upload----------- 
		
		

		//story 끝--------------------------------------------------------------
		
});