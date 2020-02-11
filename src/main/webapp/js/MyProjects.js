/**
 * 
 */
$(document).ready(function() {
						var count = 0;
						var isEnd = false;
						
						$('.loader').addClass('display-none');
						
						
			$(document).scroll(
								function() {
									var lastno = $(".project_box").last().attr(
											"id");
									console.log(lastno);
									var maxHeight = $(document).height();
									var currentScroll = $(window).scrollTop() + $(window).height();
									console.log($(".project_box").length);
									if (maxHeight <= currentScroll) {
										loadArticle(lastno);
									}
								});
						
						function loadArticle(lastno) {
							window.scrollBy(0, -100);
							
							 if(isEnd == true){
								  $('.loader').addClass('display-none');
		                          return;
							 }
							 
							console.log($(".project_box").length);
							$.ajax({
										type : "post",
										url : contextPath+"/forme/getMyProjects",
										data : {
											"projectNo" : lastno,
											"userId" : userId
										},dataType : "json",
										
										success : function(data) {
											if (data.length < 4) {
												isEnd = true;
											}
							
											if (data.length > 0) {
												for (i = 0; i < data.length; i++) {
													count = ++count;
													var select = "project_state"+ count;
													var updateBtn = (data[i].progressCd !='002' && data[i].progressCd !='003' && data[i].progressCd !='006') ? '<button class="btn btn-default _btn1" onclick="location.href=\''+contextPath+'/forme/make/'+data[i].projectNo+'\'">수정</button>' : '<button style="border:none;background-color:white;width:120px;margin-right:10px;"></button>';
												 	var detailBtn = (data[i].progressCd !='004') ? '<button class="btn btn-default _btn2" onclick="location.href=\''+contextPath+ '/support/getProjectDetailPage?projectNo='+ data[i].projectNo+'\'">상세화면</button>' : ''; 
													var deleteBtn = (data[i].progressCd =='004') ? '<button class="btn btn-default _btn2" onclick="projectdelete(\''+data[i].projectNo+'\');">삭제</button></div>' : '';
													
													$('.div2')
															.append('<div class="project_box" id='
																			+ data[i].projectNo
																			+ '>'
																			+ '		<div class="mypage_project_image"><img src="'+contextPath+'/upload/'+data[i].image +'" onerror="this.src=\''+contextPath+'/images/대체이미지.jpg\'"></div>'
																			+ '			<div class="mypage_project_content">'
																			+ '				<div class="project_state progress'+data[i].progressCd+'">'
																			+ data[i].progress
																			+ '</div>'
																			+ '  				<div class="text3d" style="font-size: 16px;">'
																			+ data[i].userId
																			+ '</div>'
																			+ ' 				<div style="height: 5px"></div>'
																			+ '   				<div class="text3dPn"><strong>'
																			+ data[i].projectName
																			+ '</strong></div>'
																			+ ' 				<div style="height: 5px"></div>'
																			+ '   				<div><span class="tI">'
																			+ data[i].totalInvest
																			+ '원</span><span class="text3d">&nbsp;'+ data[i].percent+ '%</span></div>'
																			+ ' 				<div style="height: 5px"></div>'
																			+ ' 	<div class="progress" style="height:15px;width:250px;margin-bottom:5px"><div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"'
																			+ ' style="width:'+ data[i].percent+ '%;height:15px;background-color:rgb(26, 188, 156);"></div></div>'
																			+ ' 				<div class="text3d">목표금액 '
																			+ data[i].targetAmount
																			+ '원</div>'
																			+ '<div style="height: 5px"></div>'
																			+ '<div>'
																			//<button class="btn btn-default _btn1" onclick="location.href=\''+contextPath+'/forme/make/'+data[i].projectNo+'\'">수정</button>
																			+ updateBtn
																			+ detailBtn
																			+ deleteBtn
																			+ '			</div>'
																			+ '	</div>');
													$("#" + select).addClass("progress"+data[i].progressCd)
								
												}
											}
										},beforeSend:function(){											
									        $('.loader').removeClass('display-none');											
									    },complete:function(){
									        $('.loader').addClass('display-none');
									    },timeout :5000
									});
							lastno = $(".project_box").last().attr("id");
						}
				});
	function projectdelete(pno) {
		if(confirm("프로젝트 삭제를 원하면 예, 삭제를 원하지않으면 아니오를 눌러주세요"))
		 {
			console.log('예');
			$.ajax({
				type : "delete",
				url : contextPath+"/project/"+pno,		
				success : function(data) {
					alert('해당프로젝트가 삭제되었습니다.');
					window.location.reload();
				}
			});
		 }
		 else
		 {
			 console.log('아니오');						
		 }
	}