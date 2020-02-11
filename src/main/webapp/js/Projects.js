/**
 * 
 */
	$(document)
			.ready(
					function() {
						var count = 0;
						var isEnd = false;
						
						if ($(".project_box").length <= Pcount ) {
							$('.loader').addClass('display-none');
						}
						
						$(document).scroll(function() {
									var lastno = $(".project_box").last().attr("id");
									var maxHeight = $(document).height();
									var currentScroll = $(window).scrollTop()+ $(window).height();

									console.log("documentHeight:" + maxHeight + " | scrollTop +windowHeight: " + currentScroll );
									if (maxHeight <= currentScroll +1) {
											loadArticle(lastno);
											}				
								});
						function loadArticle(lastno) {
							 window.scrollBy(0, -100);
							 if(isEnd == true){
								  $('.loader').addClass('display-none');
		                          return;
							 }
							 
							$.ajax({
										type : "post",
										url : contextPath+"/support/getProjects",
										data : {
											"projectNo" : lastno,
											"searchKeyword" : searchKeyword
										},
										dataType : "json",
										success : function(data) {
											
											if (data.length < 4) {
													isEnd = true;
											}
											if (data.length > 0) {
												for (i = 0; i < data.length; i++) {
													count = ++count;
													var select = "project_state"+ count;

													$('.div2')
													.append('<div class="project_box" style="cursor: pointer;" id='+ data[i].projectNo + ' onclick="location.href=\''+contextPath + '/support/getProjectDetailPage?projectNo='+data[i].projectNo+'\'">'
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
																	+ ' 	<div class="progress" style="height:15px;width:225px;margin-bottom:5px"><div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"'
																	+ ' style="width:'+ data[i].percent+ '%;height:15px;background-color:rgb(26, 188, 156);"></div></div>'
																	+ ' 				<div class="text3d">목표금액 '
																	+ data[i].targetAmount
																	+ '원</div>'
																	+ '<div class="remainDay">D-'+data[i].remaindate+'</div>'
																	+ '<div>'
																	//<button class="btn btn-default _btn1" onclick="location.href=\''+contextPath+'/forme/make/'+data[i].projectNo+'\'">수정</button>
																	+ '			</div>'
																	+ '	</div>');
											$("#" + select).addClass("progress"+data[i].progressCd);
													/* if (data[i].progress == '진행중') {
														$("#" + select)
																.css(
																		{
																			"border" : "1.5px solid rgb(211, 84, 0)",
																			"color" : "rgb(211, 84, 0)"
																		});
													}  */
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