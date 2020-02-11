<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value='/'/>css/projectRegister.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="<c:url value='/'/>smarteditor/js/HuskyEZCreator.js?ver=1"></script>
<script src="<c:url value='/'/>js/projectRegister.js?ver=1.5"></script>
<title>프로젝트 등록</title>  
<style>
</style>
<script>
function preview(){
	var progress = '${project.progress}';
	if(progress == '004'){
		/* var newWindow = window.open("about:blank");
		newWindow.location.href = 'http://www.daum.net'; */
		window.open("<c:url value='../preview/${project.projectNo}'/>",'preview','width=1400,height=850,top=50,left=300');
	}else{
		$("#alertMessage").text('제작중인 프로젝트만 미리보기가 가능합니다.');
		$("#alertModal").show();
	}
}
function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
} 
</script>

</head>
<body>
<div id="progress" style="display:none">${project.progress}</div>
<div id="path" style="display:none"><c:url value='/'/></div>
 <!-- The Modal -->
 <div id="alertModal" class="modal">
   <!-- Modal content -->
   <div class="modal-content">                                                                   
    <div class="close">&times;</div>
  	<div id="alertMessage">
  	</div>
  	<button type="button" id="alertModalClose">확인</button>
     </div>
 </div>
 <div id="confirmModal" class="modal">
   <!-- Modal content -->
   <div class="modal-content">                                                                   
    <div class="close">&times;</div>
  	<div id="confirmMessage">
  	</div>
  	<button type="button" id="confirmModalOk">확인</button> <button id="confirmModalCel">취소</button>
   </div>
 </div>
<div id="hiddenProjectNo" style="display:none">${project.projectNo}</div>
<div id="result" style="width:1000px"></div>
</body>
</html>