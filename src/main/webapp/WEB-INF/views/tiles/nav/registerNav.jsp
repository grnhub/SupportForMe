<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
/* #project_register {
            display : grid;
            grid-template-columns: 280px 1fr;   
        } */
#project_register_subject {
	margin-left: 70px;
	height: 45px;
	font-size: 27px;
	font-weight: 800;
	padding: 25px;
	color: grey;
}

#project_register_menu {
	margin-left: 100px;
}

#project_register_menu>div {
	font-size: 20px;
}

#preview {
	margin-bottom: 10px;
}

#project_register_menu>nav {
	margin-left: -10px;
}

#project_register_menu>nav>ul>li {
	height: 25px;
	padding: 5px 0px 5px 15px;
	margin: 10px 0px 10px -30px;
	font-size: 20px;
	list-style-position: inside;
	list-style-type: none;
}

#preview_screen {
	width: 50px;
	height: 50px;
	margin-left: 0
}
#preview_screen:hover {
	cursor:pointer;
}
#rn>li:hover {
	cursor: default;
	border-left: 2px solid rgb(26, 188, 156);
}
</style>
</head>
<body>
	<div style="height:30px"></div>
    <div id="project_register_subject">프로젝트 등록</div>
    <div id="project_register">
        <div id="project_register_menu">
            <div id="preview">프로젝트 미리보기 </div>
             <div style="padding-left:50px"><img src="/SupportForMe/images/screen.png" id="preview_screen" onclick="preview()"></div> 
            <div></div>
            <div>프로젝트 만들기</div>
            <nav>
                <ul id="rn">
                    <li class="rnbs _active">기본정보</li>
                    <li class="rnst">스토리</li>
                    <li class="rnrw">리워드</li>
                    <li class="rnac">부가정보</li>
                </ul>
            </nav>
        </div>
    </div>
</body>
</html>