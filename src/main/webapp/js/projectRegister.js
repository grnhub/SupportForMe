/**
 * 	프로젝트 등록 페이지 자바스크립트 
 */

$(function() {
		var path = $("#path").text();
		var projectNo = $("#hiddenProjectNo").text();
		onLoadBasic();
		
		var navClick;
		//////공통 js-------------------------	
		$("#rn > li").click(function(){
			if(!$(this).hasClass("_active")){
				navClick = $(this).attr("class").substring(2);
				$("#confirmMessage").text("작성하신 것을 저장하셨습니까?");
				$("#confirmModal").show();  
			}
		});
		$("#confirmModalOk").click(function(e){
				if(navClick != ''){
					e.preventDefault();
					$("#result").empty();
					var url = path + "forme/pageMove/"+projectNo+"/"+navClick;
					$.ajax({
						url : url,
						type : "post",
						success : function(result) {
							var ActiveNv = $("._active").attr("class").substr(0,4);
							$("."+ActiveNv).removeClass("_active");
							$(".rn"+navClick).addClass("_active");
							$("#result").html(result);
							$("#confirmModal").hide();
							navClick = '';
					}
				}); 
			}
				
		});

		
		
		$("#alertModalClose").on("click",function(){
			$("#alertModal").hide();
			$("#alertMessage").text('');
		});

		$("#confirmModalCel").on("click",function(){
			$("#confirmModal").hide()
			$("#confirmMessage").text('');
		})
		$("#confirmRCCel").on("click",function(){
			$("#confirmRC").hide()
			$("#confirmRCMessage").text('');
		})
		$(".close").on("click",function(){
			$(this).closest(".modal").hide();
			$(this).next().text('');
		});
		//////공통 js----------------------
	
		//////기본정보 js ------------------
		function onLoadBasic(){
			$.ajax({
				url : path + 'forme/updateProject/basic',
				type: 'post',
				data : JSON.stringify({projectNo:projectNo}),
				/*dataType : 'json',*/
				contentType:'application/json;charset=utf-8',
				success : function(result){
					$("#result").html(result);
				}
			});
		}       
	   	
		
		
});
