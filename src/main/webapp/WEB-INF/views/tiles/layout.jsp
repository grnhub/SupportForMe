<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<style>
body {
	margin:0px;
	font-family : '맑은 고딕';
}
article {
	margin: 0px;
	overflow: hidden;
}
.sticky {
  position: fixed;
  top: 0;
  width: 100%;
} 
</style>

</head>
<body>
<!-- <h3 id="clock"></h3> 현재시간 clock.js 파일 -->
	<div class="_container">
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<article>
			<tiles:insertAttribute name="content" />
		</article>
		<footer>
	     	<tiles:insertAttribute name="footer" /> 
		</footer>
	</div>
<script>
window.onscroll = function() {myFunction()};

var header = document.getElementById("headDiv");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}
</script>
</body>
</html>