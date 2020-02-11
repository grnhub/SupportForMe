<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<title>SupportForMe</title>
<style>
body {
	background-color:white;
	overflow:hidden;
	margin:0;
}
#preview_body {
	border : 10px solid #EEEEEE;
	border-radius:15px;
	margin-left: auto;
	margin-right: auto;
	width: 1300px;
	text-align:center;
}
#preview_box {
	border:none;
	border-radius:15px;
/* 	box-shadow: 5px 5px 5px 5px silver; */
	margin-top:5px;
}
#preview_subject{
	
	font-size : 45px;
	font-weight: 800;
	color: #8C8C8C;
	text-align:center;
	padding-bottom : 10px;
	margin-bottom:5px;
	/* border-bottom : 1px solid lightgrey;  */
	text-shadow:3px 1px #D5D5D5;
}  
.previewImg {
	width:60px;
	height:60px; 
	margin-top:15px;
}
</style>
</head>
<body>
	<div id="preview_subject"><img src="/SupportForMe/images/HEART2.gif" class="previewImg" > PREVIEW <img src="/SupportForMe/images/HEART2.gif" class="previewImg"></div>
	<div style="border:15px solid silver;;width:1320px;margin-left:auto;margin-right:auto;border-radius:30px;">
		<div id="preview_body">
		<iframe name="test1" id="preview_box" width='1300px' height='675px'></iframe>
		<script>
			 var src="/SupportForMe/support/getProjectDetailPage?projectNo=${projectNo}";
			/* var src="/SupportForMe/forme/make/${projectNo}"; */
			$("#preview_box").attr("src",src);
			//disable
		</script>
		</div>
	</div>
</body>
</html>