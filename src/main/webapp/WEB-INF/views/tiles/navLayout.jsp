<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	margin:0px;
	font-family : '맑은 고딕';
}
._container > nav {
	float: left;
	margin: 0px 40px 0px 160px; 
}

._container > nav > ul {
	list-style-type: none;
	padding: 0;
}

._container > nav > ul > a {
	text-decoration: none;
}
._container > article {
	overflow: hidden;
}
#_active,._active {
   /* color : rgb(26, 188, 156);
   border-left : 2px solid rgb(26, 188, 156);*/
   background-color : rgb(26, 188, 156);
   color : white;
}
.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}   
</style>

</head>
<body>
	<div class="_container">
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<nav>
			<tiles:insertAttribute name="nav"/>
		</nav>
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