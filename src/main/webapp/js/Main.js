


	$(document)
			.ready(
					function() {
						$('.flexslider').flexslider({
							animation : "slide"
						});
						$('.flexslider2').flexslider({
							/* animation: "fade", */
							slideshowSpeed : 10000,
							animation : "slide",
							controlNav : false,
							directionNav : true,
							prevText : "Previous",
							nextText : "Next"

						/* ,
						customDirectionNav : $(".custom-navigation2 a")  */
						});

						$('.flexslider3')
								.flexslider(
										{
											slideshowSpeed : 5000,
											animation : "slide",
											controlNav : false,
											directionNav : false,
											start : function(slider) {
												/* $('.real_time_rank_projects li span text') */
												$('.real_time_rank_projects li')
												.eq(0)
												.addClass("ranktext");
												/* .css({"font-weight" : "700"}); */
											},
											after : function(slider) {
												$('.real_time_rank_projects li').eq(slider.currentSlide - 1).removeClass("ranktext");
												/* 		$('.real_time_rank_projects li').eq(
																slider.currentSlide - 1).attr("class","ranktext");										
														$('.real_time_rank_projects li').eq(
																slider.currentSlide).attr("class","no");
												 */
												$('.real_time_rank_projects li').eq(slider.currentSlide).addClass("ranktext");
											}
										});
  
						Rank();
						setInterval("Rank()", 5000);

					});
	function Rank() {
		$.ajax({
					type : "post",
					url : "./",
					dataType : "json",
					success : function(data) {
						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {

								$('.real_time_image ul li img').eq(i + 1).attr(
										"src", contextPath+"/upload/" + data[i].image);
								$('.real_time_image ul li img').eq(i + 1).attr(
										"onclick",
										"location.href=\'"+contextPath+"/support/getProjectDetailPage?projectNo="
												+ data[i].projectNo + "\'");
								$('.real_time_rank_projects nav ol li')
										.eq(i)
										.html(
												"<span style='cursor: pointer; display:block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 170px; height: 20px;'><em>"
														+ (i + 1)
														+ "</em>"
														+ "<text>"
														+ data[i].projectName
														+ "</text></span>");
								$('.real_time_rank_projects nav ol li span')
										.eq(i).attr(
												"onclick",
												"location.href='"+contextPath +"/support/getProjectDetailPage?projectNo="
														+ data[i].projectNo
														+ "'");
							}
						}

					}
				});
	}
	function remainDay(deadLine) {
		var dl = deadLine.split(".");
		var remain;
		if(deadLine != null && deadLine != ''){
			var now = new Date();
			var dDay = new Date(dl[0],dl[1]-1, dl[2]);
			var now2 = now.getTime();
			var dDay2 = dDay.getTime();
			remain = dDay2 - now2;
			remain = Math.floor(remain / (24 * 3600 * 1000)) + 1;
		}
		return remain;
	}
	
	
	
