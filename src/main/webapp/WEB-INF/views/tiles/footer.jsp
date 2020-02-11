<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	margin:0;
}
.footer {
    /*    position: absolute; bottom: 0; width: 100%; */  
    height: 60px;
    padding-top: 10px ;
    color: white;
    background-color: rgb(26, 188, 156);
    text-align: center;
/*     margin-top:5em; */
    font-size:25px;
    cursor:default;
}
.clock {
	height:35px;
	border-top:1px solid #EEEEEE;
	font-size:20px;	
	text-align: center;
	padding-top: 5px ;
	background-color:white;  
}
</style>
<script>
setInterval(function() {
    var timer = new Date();
    var h = timer.getHours();  
    var m = timer.getMinutes();
    var s = timer.getSeconds();
	$(".clock").html(h + ":" + m + ":" + s);
}, 1000);
</script>
</head>
<body>
	<div style="height:400px"></div>
	<div class="clock"></div> <!-- 현재시간 clock.js 파일 -->
	<div class="footer" onclick="location.href='<%= request.getContextPath()%>'"> ⓒSupportForMe </div>
</body>
</html>