<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<title></title>

<link rel="stylesheet" href="/SupportForMe/css/projectDetail.css?ver=1">
<script src="/SupportForMe/js/projectDetail.js"></script>

<!-- 슬라이드 -->
<link type="text/css" rel="stylesheet" href="/SupportForMe/css/lightslider.css" />                  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="/SupportForMe/js/lightslider.js"></script> 

<!-- 진행률 상태바 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.more {
	border-top:1px solid #EAEAEA;
	border-bottom:1px solid #EAEAEA; 
	color:#747474; 
	text-align:center; 
	height:30px;
	font-size:20px;
}
.more:hover {
	border-top:1px solid #EAEAEA;
	border-bottom:1px solid #EAEAEA;
	background-color: #EAEAEA;
	color:#747474; 
	text-align:center; 
	height:30px;
	font-size:20px;
	cursor:pointer;
}
</style>

<script>
var path = "<c:url value='/'/>";

/*-----------------------------------------댓글-----------------------------------------------------------*/
$(function(){
	
	var startView = 0;
	var perView = 5;
	var endView = startView + perView;
	function setView(comments) {
		//불러올 댓글이 없으면 more버튼이 사라짐		
		var l = comments;
		if(l <= endView) {
			$("#more").hide();
		}
		startView = endView;
		endView = startView + perView;
	}
	
	//댓글 조회
	function loadCommentsList() {
		var params = { projectNo: '${project.projectNo}'};
		$.getJSON(path+"support/getCommentsList", params, function(data){
			more(data);
		});
	}
	function more(comments) {
		var l = comments.length;
		if(l <= endView) {
			$("#more").hide();
		}
		if(comments.length>0) {
			
		var $items = comments.slice(startView,endView);

		$.each($items, function(i, comments) {
			i += startView;
			$("#commentList").append(makeCommentView(comments));
		});
		setView(comments.length);
		}
	}
	
	function rcCnt(commentNo){
		var cnt;
		var params = { commentNo: comments.commentNo};
		$.ajax({
			url: path+"support/getReplyCommentCnt",
			data: params,
			success: function(data) {
				comments.replyCommentCnt = data;
			}
		});return comments;
	}
	
	function makeCommentView(comments) {

		var div = $("<div>");
		div.attr("id", "c"+comments.commentNo);
		div.addClass('comments');
		div[0].comments=comments;	
		
		var str = "<div class='updComment' style='background-color: #F6F6F6; border-bottom:3px solid white;'>"
				+ "<div style='display:flex;'>"
				+ "		<div style='width:60px; margin-right:10px;'>"
				+ "			<img src='/SupportForMe/images/user-icon.png' style='width:60px; height:60px; margin:auto;'><br>"
				+ "			<div style='display:flex;'>"
				+ "				<img name='rcBtn' id='rcBtn' src='/SupportForMe/images/comments.png' style='width:34px; height:35px; margin-top:60px;'>"
				+ "				<div id='rcCount"+comments.commentNo+"' style='width:25px; height:35px; margin-top:60px; text-align:center; padding-top:7px;'>"+ comments.replyCommentCnt +"</div>"
				+ "			</div>"
				+ "		</div>"
				+ "		<div>"
				+ "			<span class='userId' name='userId' style='font-size:22px; color:#4C4C4C'>"+ comments.userId + "</span>&nbsp;&nbsp;"
				+ "			<span class='commentDate' style='color:#747474'>"+ comments.commentDate + "</span><br>"
				+ "			<textarea name='commentContent' class='commentContent' readonly cols='63' rows='5' style='resize:none; border:none; font-size:17px; margin-right:10px;'>"+ comments.commentContent +"</textarea>"
				+ "		</div>";
		var btn = "		<div style='margin:auto; margin-bottom:5px;'>"
				+ "			<button type='button' class='btnUpdFrm' style='width:50px; height:30px;margin-bottom:5px;'>수정</button><br>"
				+ "			<button type='button' class='btnDel' style='width:50px; height:30px;'>삭제</button>"
				+ "		</div>";
					
		if('${member.userId}' == comments.userId) {
						str+=btn
				}
				
			str	+= "</div>"
				+ "<div id='rcList' style='display:none; border-top:2px dotted #BDBDBD; padding:10px; margin-top:10px;'></div>"
				+ "<div id='replyCommentAdd' style='display:none; width:100%; padding:15px; background-color:#F6F6F6;'>"
				+ "		<form name='replyAddForm' id='replyAddForm'>"
				+ "			<input type='hidden' name='projectNo' value='${project.projectNo}'>"
				+ "			<input type='hidden' name='userId' value='${member.userId}'>"
				+ "			<input type='hidden' name='topCommentNo' value='"+comments.commentNo+"'>"
				+ "			<div style='display:flex;'>"
 				+ "				<img src='/SupportForMe/images/turn-right.png' style='width:60px; height:60px; margin:auto;'>&nbsp"
  			+ "				<textarea name='commentContent' cols='77' rows='5' placeholder='내용을 입력해주세요.' style='resize:none;'></textarea>&nbsp;"
  			+ "				<button type='button' id='replyBtnAdd' style='width:50px; height:30px; margin:auto;'>등록</button>"
				+ "			</div>"
				+ "		</form>"
				+ "</div>"
				+ "</div>";
		div.html(str);
		
		
		return div;
	}

	$("#more").click(function() {
		$.ajax({
			url: path+"support/getCommentsList?projectNo="+'${project.projectNo}',
			success: more,
		});
	});
	
	//답글 조회(버튼클릭시 화면에 출력, 답변이 보이는 상태에서 버튼을 클릭하면 답글목록 닫음)
	$("#commentList").on("click", "#rcBtn", function(){
		/*rc: reply comment*/
		var rc_id = $(this).closest(".comments").attr("id").substring(1);
		
		var rcList = $("#c"+rc_id).children().children("#rcList");
		var rcAdd = $("#c"+rc_id).children().children("#replyCommentAdd");
		
		if( rcList.is(":visible") || rcAdd.is(":visible") ) {
			rcList.children().remove();
			rcList.hide();
			rcAdd.hide();
		} else {
			$("#c"+rc_id).children().children("#rcList").show();
			$.getJSON(path+"support/getReplyCommentsList?topCommentNo="+rc_id, function(data) {
				for(i=0; i<data.length; i++) {
					$("#c"+rc_id).children().children("#rcList").append(makeReplyCommentView(data[i])).show();
				}
			});
		$("#c"+rc_id).children().children("#replyCommentAdd").show();
		}
	
	});
	//답글 만드는 함수
	function makeReplyCommentView(comments) {
		var div = $("<div>");
		div.attr("id", "rc"+comments.commentNo);
		div.addClass('comments');
		div[0].comments=comments;
		
		var str = "<div class='replyComment' style='background-color: #F6F6F6; border-bottom:1px dotted #BDBDBD;'>"
				+ "<div style='display:flex; padding:10px;'>"
				+ "	<div style='width:60px; margin-right:10px;'>"
				+ "		<img src='/SupportForMe/images/arrow2.png' style='width:50px; height:50px; margin:auto;'><br>"
				+ "	</div>"
				+ "		<div>"
				+ "			<span class='rcUserId' style='font-size:22px; color:#4C4C4C'>"+ comments.userId + "</span>&nbsp;&nbsp;"
				+ "			<span class='rCommentDate' style='color:#747474'>"+ comments.commentDate + "</span><br>"
				+ "			<textarea name='commentContent' class='replyCommentContent' readonly cols='62' rows='5' style='resize:none; border:none; font-size:17px; margin-right:10px;'>"+ comments.commentContent +"</textarea>"
				+ "		</div>";
		var btn = "		<div style='margin:auto; margin-bottom:5px;'>"
				+ "			<button type='button' class='rcBtnUpdFrm' style='width:50px; height:30px;margin-bottom:5px;'>수정</button>"
				+ "			<button type='button' class='rcBtnDel' style='width:50px; height:30px;'>삭제</button>"
				+ "			<input type='hidden' value='"+comments.topCommentNo+"'>"
				+ "		</div>";
		if('${member.userId}' == comments.userId) {
					str+=btn
				}
			str	+= "</div>"
				+ "</div>";
		
		div.html(str);
		return div;
	}
	
	//댓글등록
	$("#btnAdd").click(function(){
		if('${member.userId}'== ''){
			if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
				location.href=path+"/support/login";
			} else {return false;}
		} else {
			if($('#addForm [name=commentContent]').val() == '') {
				alert("내용을 입력해주세요.");
				return false;
			} else{
			var params = $("[name=addForm]").serialize();		
			var url = path+"forme/insertComments";
			$.getJSON(url, params, function(data){
				$("#commentList").prepend( makeCommentView(data) );
				$("[name=addForm]")[0].reset();
				cntComments(data.commentNo);
				var offset = $("#here").offset();
		        $('html, body').animate({scrollTop : offset.top-50}, 300);
			});
			}
		}
			
	});
	//답글등록
		$("#commentList").on("click", "#replyBtnAdd", function(){
			
			if('${member.userId}' == ''){
				if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
					location.href=path+"/support/login";
				} else {return false;}
			} else {
				if($(this).prev('[name=commentContent]').val() == '') {
					alert("내용을 입력해주세요.");
					return false;
				} else{
					var checkUserId = $(this).closest('#replyCommentAdd').prev().parent().find('.userId').text();
					if(checkUserId == ' ' || checkUserId == '') {
						alert("삭제된 댓글에는 답글을 등록할 수 없습니다.");
						$(this).closest("[name=replyAddForm]")[0].reset();
						return false;
					} else {
						var params = $(this).closest("[name=replyAddForm]").serialize();
						var check_this = $(this).closest("[name=replyAddForm]");
						var url = path+"forme/insertReplyComments";
						$.ajax ({
							url: url,
							data: params,
							async: false,
							success: function(data) {
								check_this.parent().prev().prepend( makeReplyCommentView(data) );
								check_this.closest("[name=replyAddForm]")[0].reset();
								
								cntComments(data.topCommentNo);
							}
						});
						
					}
				}
			}
	});
/*답글 카운트 함수*/
	function cntComments(commentNo){	
	
		$.ajax({
				url: path+"support/getReplyCommentCnt",
				data: {commentNo: commentNo},
				success: function(data) {
					$('#rcCount'+commentNo).text(data);
				}
		});		
		
	}
	
	//댓글 수정
	$("#btnUpd").click(function(){
		var params = $("[name=updateForm]").serialize();
		var url = path+"forme/updateComments";
		$.getJSON(url, params, function(data){
			var newDiv = makeCommentView(data);
			var oldDiv = $("#c"+data.commentNo);
			$("#btnCancel").click();
			$(".tabcontent").append($("#commentUpdate"));
			$("[name=updateForm]")[0].reset(); 
			$('#commentUpdate').hide(); 
			$(newDiv).replaceAll(oldDiv);
			
			cntComments(data.commentNo);
		});
	});
	//답글 수정
	$("#commentList").on("click", ".rcBtnUpd", function(){
		var params = $("[name=rcUpdateForm]").serialize();
		var url = path+"forme/updateReplyComments";
		$.getJSON(url, params, function(data){
			var newDiv = makeReplyCommentView(data);
			var oldDiv = $("#rc"+data.commentNo);
			$("#rcBtnCancel").click();
			$(".tabcontent").append($("#replyCommentUpdate"));
			$("[name=rcUpdateForm]")[0].reset(); 
			$('#replyCommentUpdate').hide(); 
			$(newDiv).replaceAll(oldDiv);
		});
	});
	
	//수정폼
	$("#commentList").on("click", ".btnUpdFrm", function(){
		var seq = $(this).closest(".comments").attr("id").substring(1);		//seq = 'commentNo'
		var temp_seq = $("#c"+seq);
		var comments = temp_seq[0].comments;		//$(this).parent()[0]
		$("#updateForm [name=seq]").val(seq);    
		$("#updateForm [name=commentContent]").val(comments.commentContent);
		$("#updateForm [name=commentNo]").val(comments.commentNo);
		
		$("#c"+seq).find(".updComment").hide();
		$("#c"+seq).append($('#commentUpdate')); 
		$('#commentUpdate').show();   
	});
	//답글 수정 폼
	$("#commentList").on("click", ".rcBtnUpdFrm", function(){
		var seq = $(this).parent().parent().parent().parent().attr("id").substring(2);
		var temp_seq = $("#rc"+seq);
		var comments = temp_seq[0].comments;
		$("#rcUpdateForm [name=seq]").val(seq);    
		$("#rcUpdateForm [name=commentContent]").val(comments.commentContent);
		$("#rcUpdateForm [name=commentNo]").val(comments.commentNo);
		
		$("#rc"+seq).find(".replyComment").hide();
		$("#rc"+seq).append($('#replyCommentUpdate')); 
		$('#replyCommentUpdate').show();  
	});

	//수정 취소
	$("#btnCancel").click(function(){
		var seq = $(this).closest(".comments").attr("id").substring(1);
		$("[name=updateForm]")[0].reset(); 
		$(".tabcontent").append( $("#commentUpdate") );
		$("#commentUpdate").hide();
		$("#c"+seq).find(".updComment").show();
	});
	//답글 수정취소
	$("#commentList").on("click", ".rcBtnCancel", function(){
		var seq = $(this).closest(".comments").attr("id").substring(2);
		$("[name=rcUpdateForm]")[0].reset(); 
		$(".tabcontent").append( $("#replyCommentUpdate") );
		$("#replyCommentUpdate").hide();
		$("#rc"+seq).children(".replyComment").show();
	});
	
	//댓글 삭제
	$("#commentList").on("click", ".btnDel", function(){
		var seq = $(this).closest(".comments").attr("id").substring(1);  //seq = 'commentNo' => 201811080061
		if(confirm("댓글을 삭제하시겠습니까?")) {
			var params = "commentNo="+ seq;
			var url = path+"forme/deleteComments";
			$.getJSON(url, params, function(data){
				if(data.cnt == 0 ) {
					$('#c'+data.commentNo).remove();
				} else {
					$('#c'+data.commentNo).find('.userId').text('');
					$('#c'+data.commentNo).find('.commentDate').text('');
					$('#c'+data.commentNo).find('.commentContent').text('삭제된 댓글입니다.');
					$('#c'+data.commentNo).find('.btnUpdFrm').hide();
					$('#c'+data.commentNo).find('.btnDel').hide();
				}
			});
		}
	});
	//답글 삭제
	$("#commentList").on("click", ".rcBtnDel", function(){
		var cur = $(this).next().val();
		var seq = $(this).parent().parent().parent().parent().attr("id").substring(2);
		if(confirm("답글을 삭제하시겠습니까?")) {
			var params = "commentNo="+seq;
			var url = path+"forme/deleteComments";
			$.ajax({
				url: url,
				data: params,
				async: false,
				success: function(data) {
					$('#rc'+data.commentNo).remove();
					cntComments(cur);
				}
				
			});
		}
	});
	
	
	loadCommentsList();
})

/*----------------관리자 pick-----------------------------------------------------------------------------------------*/
function pick() {
	
	var seq = '${project.projectNo}';
	var url = path+"forme/updatePick";
	var params = "projectNo="+seq;
	$.getJSON(url, params, function(data){
		if(data.supportPickYn == 'Y'){
			alert('PICK :^)');
			$('#pickBtn').attr('class', 'pjdtl-pick-btn pickBtn-yes').text('PICKED');
		} else {
			alert('PICK 취소!');
			$('#pickBtn').attr('class', 'pjdtl-pick-btn pickBtn-no').text('PICK');
		}
	});
	
}

/*-------------투자하기 버튼 제어-------------------------------------------------------------------------------------*/
function invest(){
	var invest = '${project.progress}';
	
	if('${project.progress}' != '진행중') {
		alert('종료된 프로젝트 입니다.');
		return false;
	} else {
		location.href = path+"forme/InvestSelectReward?projectNo=${project.projectNo}";
	}
}

</script>




</head> 
    
<body>
    <input type="hidden" value="${project.projectNo}">
    <br>
    <div class="pjdtl-bodysize">
    <!-- 프로젝트 이름, 관리자 버튼 -->
    <div class="pjdtl-flex-container">
        <div class="pjdtl-project-name">${project.projectName}</div>
        <c:if test="${member.userId == 'Admin'}">
        	<c:choose>
        	<c:when test="${project.supportPickYn == 'Y'}">
        		<button id="pickBtn" class="pjdtl-pick-btn pickBtn-yes" onclick="pick()">PICKED</button>
        	</c:when>
        	<c:otherwise>
        		<button id="pickBtn" class="pjdtl-pick-btn pickBtn-no" onclick="pick()">PICK</button>
        	</c:otherwise>
        	</c:choose>
    	</c:if>
    </div>
    <div class="pjdtl-center"><!-- 해시태그 -->
    <c:choose>
    	<c:when test="${preview == 'p'}">
	        <c:forEach items="${hashtag}" var="projectTag">
	            <span class="pjdtl-hashtag">#${projectTag.hashtagName}</span>&nbsp;
	        </c:forEach>
        </c:when>
        <c:otherwise>
	        <c:forEach items="${hashtag}" var="projectTag">
	            <span class="pjdtl-hashtag" onclick="location.href='<%= request.getContextPath() %>/support/getProjects?searchKeyword=${projectTag.hashtagName}'">#${projectTag.hashtagName}</span>&nbsp;
	        </c:forEach>
        </c:otherwise>
    </c:choose>
    </div>
    <br>
    <div class="pjdtl-flex-container">
        <!-- 사진/이미지/영상/비디오 슬라이드/슬라이더-->
        <div class="demo">
        <div class="item">
        	<div class="clearfix">
        	<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
        	
				<c:forTokens items="${project.introductionVideo}" delims="||" var="video">
					<li data-thumb="${video}" class="video-thumb">
						<iframe width="625" height="365" src="https://www.youtube.com/embed/${video}"
							frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"></iframe>
					</li>
				</c:forTokens>
				<c:forTokens items="${project.introductionImage}" delims="||" var="img">
					<li data-thumb="/SupportForMe/upload/${img}" style="width:660px; height:380px;">
						<img src="/SupportForMe/upload/${img}"/>
					</li>
				</c:forTokens>
				
			</ul>
			</div>
		</div>
        </div>
        
        <div class="pjdtl-empty-box"></div>
        <!-- 디테일 박스 -->
        <div class="pjdtl-detail-box">
            <div id="totalInvestAmount" style="font-size:45px;">
            	<script>
            		$("#totalInvestAmount").text(addComma('${invest.totalInvestAmount}')+"원");          	
            	</script>
            	<span style="font-size:35px;">(모인금액)</span></div>
            <div class="pjdtl-target-price"></div>
            <script>
            	$(".pjdtl-target-price").text("목표금액 "+addComma('${project.targetAmount}')+"원");
            </script>
			<div style="width:100%; color:#FF007F; margin:5px 0px 10px 0px; font-size:23px;">
				<span style="font-weight:700;">${project.progress}</span>
			</div>
<!-- 진행상황 막대그래프 -->
			<div class="progress" style="width:450px; height:30px; margin-bottom:10px;">
				<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${project.projectProgressRate}%; height:30px;padding-top:5px;font-size:17px">${project.projectProgressRate}%</div>
			</div>
			
            <div style="font-size:25px; color:#8C8C8C;">참여자 ${invest.headcount}명</div>
            <div style="height:15px"></div>
            <div style="display:flex;">
            <c:choose>
            	<c:when test="${preview == 'p'}">
               	 <button class="pjdtl-invest-btn">투자하기</button>
                </c:when>
                <c:otherwise>
                	<button class="pjdtl-invest-btn" onclick="invest()">투자하기</button>
                </c:otherwise>
            </c:choose>
            <img src="/SupportForMe/images/share-button.png" onclick="url()" class="pjdtl-share-btn" data-toggle="modal" data-target="#myModal">
            	<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog" style="margin-top:15em; width:50em;">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">공유</h4>
				        </div>
				        <div class="modal-body" style="display:flex;">
				          		<input type="text" id="myInput" style="width:45em;height:3em;"/>
				          	<div class="_tooltip" style="margin-top:auto; margin-bottom:auto; margin-left:10px;">	
				          		<button onclick="copyUrl()" onmouseout="outFunc()" id="clipboard" class="btn btn-default" style="height:30px;">
				          		<span class="_tooltiptext" id="myTooltip">복사하기</span>
				          		Copy url</button>
				        	</div>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				        </div>
				      </div>
				      
				    </div>
				</div>
            </div>
 			<div style="height:15px"></div>
            <table style="width:450px;border:1px solid #A6A6A6;">
            	<tr style="text-align: center;">
            		<td style="height:100px;"><img src="/SupportForMe/images/calendar.png" style="width:90px; height:82px;"></td>
    				<td><img src="/SupportForMe/images/right-arrow.png" class="pjdtl-right-arrow"></td>
    				<td><img src="/SupportForMe/images/credit-card.png" class="pjdtl-status-img"></td>
    				<td><img src="/SupportForMe/images/right-arrow.png" class="pjdtl-right-arrow"></td>
    				<td><img src="/SupportForMe/images/delivery-truck.png" class="pjdtl-status-img"></td>
            	</tr>
            	<tr>
            		<td class="pjdtl-status-font">종료일</td>
            		<td></td>
            		<td class="pjdtl-status-font">결제 예정일</td>
            		<td></td>
            		<td class="pjdtl-status-font">예상 배송일</td>
            	</tr>
            	<tr>
            		<td class="pjdtl-status-font">${project.projectDeadline}</td>
            		<td class="pjdtl-status-font"></td>
            		<td class="pjdtl-status-font">${project.scheduledPaymentDate}</td>
            		<td class="pjdtl-status-font"></td>
            		<td class="pjdtl-status-font">${project.deliveryDate}</td>
            	</tr>
            </table>
        </div>
    </div>
    </div>
    
    <div id="here" style="border-bottom:1px solid lightgray;"></div><br>
    
    <div class="pjdtl-bodysize">
        <div class="pjdtl-flex-container">
        <div class="pjdtl-content">
		
		<div class="container">
		  <ul class="nav nav-tabs" style="width:750px;">
		    <li class="active"><a data-toggle="tab" href="#home">스토리</a></li>
		    <c:choose>
		    	<c:when test="${preview == 'p'}">
		    		<li><a data-toggle="tab">댓글</a></li>
		    	</c:when>
		    	<c:otherwise>
		    		<li><a data-toggle="tab" href="#menu1">댓글</a></li>
		    	</c:otherwise>
		    </c:choose>
		    
		  </ul>
		
		  <div class="tab-content">
		    <div id="home" class="tab-pane fade in active" style="width:750px;padding-top:10px">
		    	${project.story}
		    </div>
		    <div id="menu1" class="tab-pane fade" style="width:750px;">
		     			
<!--댓글-->	
			<div id="comment" class="tabcontent">
			
<!--댓글출력--><div id="commentList"></div>
			<div class="more" id="more">더보기</div>
			<br>
<!--댓글입력--><div id="commentAdd" style="width:750px; padding:10px; background-color:#F6F6F6;">
				<form name="addForm" id="addForm">
					<input type="hidden" name="projectNo" value="${project.projectNo}">
					<input type="hidden" name="userId" value="${member.userId}">
                       <div style="display: flex;">
				           <img src="/SupportForMe/images/user-icon.png" style="width:60px; height:60px; margin:auto;">&nbsp;
                           <textarea name="commentContent" cols="77" rows="5" placeholder="내용을 입력해주세요." style="resize:none;"></textarea>&nbsp;
                           <button type="button" id="btnAdd" style="width:50px; height:30px; margin:auto;">등록</button>
				       </div>
 				</form>
			</div><br><br>
			
<!--댓글 수정-->			
			<div id="commentUpdate" style="width:750px; padding:10px; background-color:#F6F6F6; border-bottom:2px solid white;display:none;">
				<form name="updateForm" id="updateForm">
					<input type="hidden" name="commentNo" value="${comments.commentNo}">
					<input type="hidden" name="userId" value="${member.userId}">
					<div style="display: flex;">
						<img src="/SupportForMe/images/user-icon.png" style="width:60px; height:60px; margin:auto;">&nbsp;
						<textarea name="commentContent" cols="70" rows="5" style="resize:none;"></textarea>&nbsp;
						<div style="margin:auto;">
							<button type="button" id="btnUpd" style="width:50px; height:30px; margin-bottom:5px;">수정</button><br>
							<button type="button" id="btnCancel" style="width:50px; height:30px;">취소</button>
						</div>
					</div>	
				</form>
			</div>
<!--답글 수정-->
			<div id="replyCommentUpdate" style="width:100%; padding:15px; background-color:#F6F6F6; border-bottom:1px dotted grey; display:none;">
				<form name="rcUpdateForm" id="rcUpdateForm">
					<input type="hidden" name="commentNo" value="${comments.commentNo}">
					<input type="hidden" name="userId" value="${member.userId}">
					<div style="display: flex;">
						<img src="/SupportForMe/images/arrow2.png" style="width:50px; height:50px; margin:auto;">&nbsp;
						<textarea name="commentContent" cols="75" rows="5" style="resize:none;"></textarea>&nbsp;
						<div style="margin:auto; margin-bottom:5px;">
							<button type="button" class="rcBtnUpd" style="width:50px; height:30px; margin-bottom:5px;">수정</button><br>
							<button type="button" class="rcBtnCancel" style="width:50px; height:30px;">취소</button>
						</div>
					</div>	
				</form>
			</div>			
		    </div>
<!--댓글탭끝나는곳--></div>
		</div>
		</div>
        </div>
 
        <div class="pjdtl-empty-content"></div>
<!-- 알림 -->
        
<!-- 리워드 -->
        <div class="pjdtl-reward">
        	<br><br>
        	<div style="padding:10px 0px; background-color:#F0FFF0;">
        	<span style="color:#5D5D5D; font-size:15px; font-weight:bold;">&nbsp;100% 이상 모이면 펀딩이 성공되는 프로젝트</span><br>
        		<div style="color:#747474; padding:0px 10px;">
        		이 프로젝트는 펀딩 마감일까지 목표 금액이<br>100% 모이지 않으면 결제가 취소됩니다.
        		</div>
        	</div><br>
            <div style="font-size:30px;">리워드 목록</div>
            <c:if test="${present.size()>0}">
            <c:forEach var="i" begin="0" end="${present.size()-1}" varStatus="status">
            <div class="pjdtl-each-reward">
            	<div style="display:flex;">
            		<img src="/SupportForMe/images/checkmark.png" style="width:27px; height:27px">
            		<c:choose>
            		<c:when test="${presentCount[status.index].rewardSelectCount == null}">
            			<span style="font-size:27px; color:#8C8C8C;">&nbsp;0명이 선택</span>
            		</c:when>
            		<c:otherwise>
            			<span style="font-size:27px; color:#8C8C8C;">&nbsp;${presentCount[status.index].rewardSelectCount}명이 선택</span>
            		</c:otherwise>
            		</c:choose>
            	</div><br>
            	<span style="color:#4C4C4C;">가격</span><br>
            	<span class="rewardPrice" style="font-size:23px; color:#FF007F;"></span>
            		<script>
            			$(".rewardPrice").eq('${i}').text(addComma('${present[i].presentPrice}')+"원 +");
            		</script><br>
            	<span style="color:#4C4C4C;">배송비 포함</span><br><br>
            	<span style="color:#4C4C4C;">구성</span><br>
            	<span style="font-size: 23px;">${present[i].presentName}</span>
            </div>
            </c:forEach>
            </c:if>
        </div>
        </div>
    </div>
    
</body>
</html>