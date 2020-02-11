<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<title>SupportForMe</title>




<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">


<style>

</style>
<script>
function go_register() {
	if('${member.userId}' != ''){
		var url = window.location.pathname.toString().split('/');
		console.log(url);
		var cpath = url[3];
		if(cpath != 'make'){
			 var $form = $('<form></form>');
		     $form.attr('action', '/SupportForMe/forme/registerProject');
		     $form.attr('method', 'post');
		     $form.appendTo('body');
			
		     $form.submit();
		} 
	}else {
		if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
			location.href="<%= request.getContextPath() %>/support/MemberLoginForm";
		}else {
			return false;
		}
	}
	
}


</script>
</head>
<body>
<script>
function view() {

	var objDiv = document.getElementById("site_name");
	var objDiv2 = document.getElementById("searchKeyword");
	var mypageIcon = document.getElementById("userIcon");
    if(objDiv2.style.display=="block"){ 
		objDiv.style.display = "block";
    	objDiv2.style.display = "none"; 
    }
     else{ 
    	objDiv.style.display = "none";
     	objDiv2.style.display = "block";
     }
}


function view2() {
	
	var objDiv2 = document.getElementById("searchKeyword2");
	
    if(objDiv2.style.display=="block"){ 
    	objDiv2.style.display = "none";
    }
    else{ 
    	objDiv2.style.display = "block";
    }
}
</script>
<c:choose>
<c:when test="${preview == 'p'}">
	<div id="headDiv">
		<div class="headBodysize">
	    	<div></div>
	    	<div id="head">
		    	<!--  화면줄였을때 보이는 영역 -->
	    	    <div id="search_div1">
		        	<a><img src="<%= request.getContextPath() %>/images/search.png" class="searchImg"></a>
		        	<form>
	        			<input type="text" name="searchKeyword" id="searchKeyword" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?">
					</form> 	    
	        	</div>
				
	        	<div id="site_name" class="block" style="cursor:pointer;">
	            	SupportForME
	        	</div>
	        
	        	<div id="make_project_div">
	        	<input type="button"id="make_project" value="프로젝트 만들기">
	        	</div>
	        
	        	<!-- 전체화면일때 보이는 영역 -->
	        	<div id="search_div2">
				<img src="<%= request.getContextPath() %>/images/search.png" class="searchImg">
	        	</div>
	        	<div id="logout_head_menu">
		        	<div id="head_font_size" style="cursor:pointer;">로그인</div>
		        	<div id="head_font_size" style="cursor:pointer;">회원가입</div>
	        	</div>
	        </div>
	      </div>
	   </div>
</c:when>
<c:otherwise>
	<div id="headDiv">
		<div class="headBodysize">
	    	<div></div>
	    	<div id="head">
		    	<!--  화면줄였을때 보이는 영역 -->
	    	    <div id="search_div1">
		        	<a href="#" onclick="view()"><img src="<%= request.getContextPath() %>/images/search.png" class="searchImg"></a>
		        	<form action="<%= request.getContextPath() %>/support/getProjects">
	        			<input type="text" name="searchKeyword" id="searchKeyword" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?">
					</form> 	    
	        	</div>
				
	        	<div id="site_name" class="block" style="cursor:pointer;" onclick="location.href='<%= request.getContextPath() %>'">
	            	SupportForME
	        	</div>
	        
	        	<div id="make_project_div">
	        	<input type="button" onclick="go_register()" id="make_project" value="프로젝트 만들기">
	        	</div>
	        
	        	<!-- 전체화면일때 보이는 영역 -->
	        	<div id="search_div2">
	        	<form action="<%= request.getContextPath() %>/support/getProjects">
	        		<input type="text" name="searchKeyword" id="searchKeyword2" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?" style="display:none;">
	      
				<%--<input TYPE="image" src="<%= request.getContextPath() %>/images/search.png" class="searchImg" name="Submit" value="Submit"> --%> 
				</form>
				<a href="#" onclick="view2()"><img src="<%= request.getContextPath() %>/images/search.png" class="searchImg"></a>
	        	</div>
	        	
	        	<c:if test="${member.userId eq null}">
	        	<div id="logout_head_menu">
		        	<div id="head_font_size" style="cursor:pointer;" onclick="location.href='<%= request.getContextPath() %>/support/MemberLoginForm'">로그인</div>
		        	<div id="head_font_size" style="cursor:pointer;" onclick="location.href='<%= request.getContextPath() %>/support/MemberTermsConfirmForm'">회원가입</div>
	        	</div>
	        	</c:if>
	        	<c:if test="${member.userId ne null}">
	        	<div id="userIcon"><img src="<%=request.getContextPath()%>/images/user.png" class="hamburger"></div>
	        	<div id="head_font_size" class="hamburger-wrapper"><span class="hamburger">마이 페이지</span></div>
	        	</c:if>
	        	
 <!--  사이드바 -->
 <nav id="sidenav">
  <span id="close-sidenav">&times;</span>
  <header>
  	<div style="height:30px"></div>  
  	<div style="margin-left:10px"><img src="<%= request.getContextPath() %>/images/user-white2.png" style="width:55px;height:55px;margin-left:15px;"></div>
  	<div style="color:white; font-size:18px;margin-top:5px">${member.name}</div> 
  	<div style="color:white; font-size:18px;margin-top:5px">${member.email}</div>
  </header>
  <ul>
  	<c:set var ="id" value="${member.userId}"/>
  	<c:choose>
   	<c:when test="${fn:contains(id,'Admin' )}">
   	<li><a href="<%= request.getContextPath() %>/forme/AdminProjectProgressList">프로젝트 관리</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/AdminMemberList">회원 관리</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/AdminSupportForMePickList">서포미 픽 관리</a></li>
    </c:when>
    <c:otherwise>
    <li><a href="<%= request.getContextPath() %>/forme/MemberUpdateConfirmForm">프로필 설정</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/getMyProjects">나의 프로젝트</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/MyInvestList">나의 투자 현황</a></li> 
    <li><a href="<%= request.getContextPath() %>/forme/InvestList">나의 결재 내역</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/MyInvestors">나의 투자자</a></li>
    </c:otherwise>
    </c:choose>
    <li><a href="<%= request.getContextPath() %>/support/logout">로그아웃</a></li>
    
  </ul>
</nav>


<script>
$(".hamburger").click(function() {
	if($("#sidenav").css("right") == '0px'){
		$("#sidenav").css("right", "-260px");
		  $("body").removeClass("dark");
	}else {
		$("#sidenav").css("right", "0");
		  $("body").addClass("dark");
	}
});
$("#close-sidenav").click(function() {
	$("#sidenav").css("right", "-260px");
  $("body").removeClass("dark");
});


</script>
</div>
</div>
</div>
</c:otherwise>
</c:choose>
</body>
</html>