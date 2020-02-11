<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 모드</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<!-- 스크립트 로딩과 차트 초기화 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	var path = "<c:url value='/'/>";
	google.charts.load('current', {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    google.charts.setOnLoadCallback(drawChart2);
    google.charts.setOnLoadCallback(drawChart3);
    google.charts.setOnLoadCallback(drawChart4);
    google.charts.setOnLoadCallback(drawChart5);
    function drawChart() {
    	$.ajax({type : "post",
				url : path+"forme/AdminMemberJoinMonth",
				dataType : "json",
				async: false,
				success : function(data) {
					var M01 = 0;
					var M02 = 0;
					var M03 = 0;
					var M04 = 0;
					var M05 = 0;
					var M06 = 0;
					var M07 = 0;
					var M08 = 0;
					var M09 = 0;
					var M10 = 0;
					var M11 = 0;
					var M12 = 0;
					if( typeof data[0] != "undefined"){
						M01 = data[0].M01;
						M02 = data[0].M02;
						M03 = data[0].M03;
						M04 = data[0].M04;
						M05 = data[0].M05;
						M06 = data[0].M06;
						M07 = data[0].M07;
						M08 = data[0].M08;
						M09 = data[0].M09;
						M10 = data[0].M10;
						M11 = data[0].M11;
						M12 = data[0].M12;
					}
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "회원 가입자 수", { role: "style" } ],
				          ["1월", M01, "color: #01DFA5"],
				          ["2월", M02, "color: #01DFA5"],
				          ["3월", M03, "color: #01DFA5"],
				          ["4월", M04, "color: #01DFA5"],
				          ["5월", M05, "color: #01DFA5"],
				          ["6월", M06, "color: #01DFA5"],
				          ["7월", M07, "color: #01DFA5"],
				          ["8월", M08, "color: #01DFA5"],
				          ["9월", M09, "color: #01DFA5"],
				          ["10월", M10, "color: #01DFA5"],
				          ["11월", M11, "color: #01DFA5"],
				          ["12월", M12, "color: #01DFA5"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "월별 회원 가입 현황",
				        titleTextStyle:{
				        	fontSize : 25,
				        	bold:true
				        },
				        width: 1000,
				        height: 300,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				       	vAxis: {viewWindowMode:'explicit', viewWindow: { min: 0}}
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart1"));
				      chart.draw(view, options);
				}
			});
	    }
	    function drawChart2() {
	    	$.ajax({	type : "post",
				url : path+"forme/AdminProjectRegMonth",
				dataType : "json",
				async: false,
				success : function(data) {
					var M01 = 0;
					var M02 = 0;
					var M03 = 0;
					var M04 = 0;
					var M05 = 0;
					var M06 = 0;
					var M07 = 0;
					var M08 = 0;
					var M09 = 0;
					var M10 = 0;
					var M11 = 0;
					var M12 = 0;
					if(typeof data[0] != "undefined"){
						M01 = data[0].M01;
						M02 = data[0].M02;
						M03 = data[0].M03;
						M04 = data[0].M04;
						M05 = data[0].M05;
						M06 = data[0].M06;
						M07 = data[0].M07;
						M08 = data[0].M08;
						M09 = data[0].M09;
						M10 = data[0].M10;
						M11 = data[0].M11;
						M12 = data[0].M12;
					}
					
					
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "프로젝트 생성 수", { role: "style" } ],
				          ["1월", M01, "color: #ff7f00"],
				          ["2월", M02, "color: #ff7f00"],
				          ["3월", M03, "color: #ff7f00"],
				          ["4월", M04, "color: #ff7f00"],
				          ["5월", M05, "color: #ff7f00"],
				          ["6월", M06, "color: #ff7f00"],
				          ["7월", M07, "color: #ff7f00"],
				          ["8월", M08, "color: #ff7f00"],
				          ["9월", M09, "color: #ff7f00"],
				          ["10월", M10, "color: #ff7f00"],
				          ["11월", M11, "color: #ff7f00"],
				          ["12월", M12, "color: #ff7f00"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "프로젝트 생성 현황",
				        titleTextStyle:{
				        	fontSize : 25,
				        	bold:true
				        },
				        width: 1000,
				        height: 300,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				        vAxis: {viewWindowMode:'explicit', viewWindow: { min: 0,}}
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart2"));
				      chart.draw(view, options);
				}
			});
	  }
	    
	    function drawChart3() {
	    	$.ajax({	
	    		type : "post",
				url : path+"forme/InvestAmountSumMonth",
				dataType : "json",
				async: false,
				success : function(data) {
					console.log(data[0]);
					var M01 = 0;
					var M02 = 0;
					var M03 = 0;
					var M04 = 0;
					var M05 = 0;
					var M06 = 0;
					var M07 = 0;
					var M08 = 0;
					var M09 = 0;
					var M10 = 0;
					var M11 = 0;
					var M12 = 0;
					if(typeof data[0] != "undefined"){
						M01 = data[0].M01;
						M02 = data[0].M02;
						M03 = data[0].M03;
						M04 = data[0].M04;
						M05 = data[0].M05;
						M06 = data[0].M06;
						M07 = data[0].M07;
						M08 = data[0].M08;
						M09 = data[0].M09;
						M10 = data[0].M10;
						M11 = data[0].M11;
						M12 = data[0].M12;
					}
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "결제 금액 합계", { role: "style" } ],
				          ["1월", M01, "color: #ff3300"],
				          ["2월", M02, "color: #ff3300"],
				          ["3월", M03, "color: #ff3300"],
				          ["4월", M04, "color: #ff3300"],
				          ["5월", M05, "color: #ff3300"],
				          ["6월", M06, "color: #ff3300"],
				          ["7월", M07, "color: #ff3300"],
				          ["8월", M08, "color: #ff3300"],
				          ["9월", M09, "color: #ff3300"],
				          ["10월", M10, "color: #ff3300"],
				          ["11월", M11, "color: #ff3300"],
				          ["12월", M12, "color: #ff3300"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "결제 금액 합계",
				        titleTextStyle:{
				        	fontSize : 25,
				        	bold:true
				        },
				        width: 1000,
				        height: 300,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				        vAxis: {viewWindowMode:'explicit', viewWindow: { min: 0}}
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart3"));
				      chart.draw(view, options);
				}
			});
	  }
	    
	    function drawChart4() {
	    	$.ajax({	
	    		type : "post",
				url : path+"forme/AdminProjectHoldDayCnt",
				dataType : "json",
				async: false,
				success : function(data) {
					var D01 = 0;
					var D02 = 0;
					var D03 = 0;
					var D04 = 0;
					var D05 = 0;
					var D06 = 0;
					var D07 = 0;
					var D08 = 0;
					var D09 = 0;
					var D10 = 0;
					var D11 = 0;
					var D12 = 0;
					var D13 = 0;
					var D14 = 0;
					var D15 = 0;
					var D16 = 0;
					var D17 = 0;
					var D18 = 0;
					var D19 = 0;
					var D20 = 0;
					var D21 = 0;
					var D22 = 0;
					var D23 = 0;
					var D24 = 0;
					var D25 = 0;
					var D26 = 0;
					var D27 = 0;
					var D28 = 0;
					var D29 = 0;
					var D30 = 0;
					var D31 = 0;
					if(typeof data[0] != "undefined"){
						D01 = data[0].D01;
						D02 = data[0].D02;
						D03 = data[0].D03;
						D04 = data[0].D04;
						D05 = data[0].D05;
						D06 = data[0].D06;
						D07 = data[0].D07;
						D08 = data[0].D08;
						D09 = data[0].D09;
						D10 = data[0].D10;
						D11 = data[0].D11;
						D12 = data[0].D12;
						D13 = data[0].D13;
						D14 = data[0].D14;
						D15 = data[0].D15;
						D16 = data[0].D16;
						D17 = data[0].D17;
						D18 = data[0].D18;
						D19 = data[0].D19;
						D20 = data[0].D20;
						D21 = data[0].D21;
						D22 = data[0].D22;
						D23 = data[0].D23;
						D24 = data[0].D24;
						D25 = data[0].D25;
						D26 = data[0].D26;
						D27 = data[0].D27;
						D28 = data[0].D28;
						D29 = data[0].D29;
						D30 = data[0].D30;
						D31 = data[0].D31;
					}
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "프로젝트 보류 건수", { role: "style" } ],
				          ["1일", D01, "color: #ff3300"],
				          ["2일", D02, "color: #ff3300"],
				          ["3일", D03, "color: #ff3300"],
				          ["4일", D04, "color: #ff3300"],
				          ["5일", D05, "color: #ff3300"],
				          ["6일", D06, "color: #ff3300"],
				          ["7일", D07, "color: #ff3300"],
				          ["8일", D08, "color: #ff3300"],
				          ["9일", D09, "color: #ff3300"],
				          ["10일", D10, "color: #ff3300"],
				          ["11일", D11, "color: #ff3300"],
				          ["12일", D12, "color: #ff3300"],
				          ["13일", D13, "color: #ff3300"],
				          ["14일", D14, "color: #ff3300"],
				          ["15일", D15, "color: #ff3300"],
				          ["16일", D16, "color: #ff3300"],
				          ["17일", D17, "color: #ff3300"],
				          ["18일", D18, "color: #ff3300"],
				          ["19일", D19, "color: #ff3300"],
				          ["20일", D20, "color: #ff3300"],
				          ["21일", D21, "color: #ff3300"],
				          ["22일", D22, "color: #ff3300"],
				          ["23일", D23, "color: #ff3300"],
				          ["24일", D24, "color: #ff3300"],
				          ["25일", D25, "color: #ff3300"],
				          ["26일", D26, "color: #ff3300"],
				          ["27일", D27, "color: #ff3300"],
				          ["28일", D28, "color: #ff3300"],
				          ["29일", D29, "color: #ff3300"],
				          ["30일", D30, "color: #ff3300"],
				          ["31일", D31, "color: #ff3300"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "프로젝트 보류 건수",
				        titleTextStyle:{
				        	fontSize : 25,
				        	bold:true
				        },
				        width: 1000,
				        height: 300,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				        vAxis: {viewWindowMode:'explicit', viewWindow: { min: 0,max:4}}
				   
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart4"));
				      chart.draw(view, options);
				}
			});
	  }  
	   
	    function drawChart5() {
	    	$.ajax({	
	    		type : "post",
				url : path+"forme/AdminProjectRegDayCnt",
				dataType : "json",
				async: false,
				success : function(data) {
					var D01 = 0;
					var D02 = 0;
					var D03 = 0;
					var D04 = 0;
					var D05 = 0;
					var D06 = 0;
					var D07 = 0;
					var D08 = 0;
					var D09 = 0;
					var D10 = 0;
					var D11 = 0;
					var D12 = 0;
					var D13 = 0;
					var D14 = 0;
					var D15 = 0;
					var D16 = 0;
					var D17 = 0;
					var D18 = 0;
					var D19 = 0;
					var D20 = 0;
					var D21 = 0;
					var D22 = 0;
					var D23 = 0;
					var D24 = 0;
					var D25 = 0;
					var D26 = 0;
					var D27 = 0;
					var D28 = 0;
					var D29 = 0;
					var D30 = 0;
					var D31 = 0;
					if(typeof data[0] != "undefined"){
						D01 = data[0].D01;
						D02 = data[0].D02;
						D03 = data[0].D03;
						D04 = data[0].D04;
						D05 = data[0].D05;
						D06 = data[0].D06;
						D07 = data[0].D07;
						D08 = data[0].D08;
						D09 = data[0].D09;
						D10 = data[0].D10;
						D11 = data[0].D11;
						D12 = data[0].D12;
						D13 = data[0].D13;
						D14 = data[0].D14;
						D15 = data[0].D15;
						D16 = data[0].D16;
						D17 = data[0].D17;
						D18 = data[0].D18;
						D19 = data[0].D19;
						D20 = data[0].D20;
						D21 = data[0].D21;
						D22 = data[0].D22;
						D23 = data[0].D23;
						D24 = data[0].D24;
						D25 = data[0].D25;
						D26 = data[0].D26;
						D27 = data[0].D27;
						D28 = data[0].D28;
						D29 = data[0].D29;
						D30 = data[0].D30;
						D31 = data[0].D31;
					}
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "프로젝트 등록 건수", { role: "style" } ],
				          ["1일", D01, "color: #ff7f00"],
				          ["2일", D02, "color: #ff7f00"],
				          ["3일", D03, "color: #ff7f00"],
				          ["4일", D04, "color: #ff7f00"],
				          ["5일", D05, "color: #ff7f00"],
				          ["6일", D06, "color: #ff7f00"],
				          ["7일", D07, "color: #ff7f00"],
				          ["8일", D08, "color: #ff7f00"],
				          ["9일", D09, "color: #ff7f00"],
				          ["10일", D10, "color: #ff7f00"],
				          ["11일", D11, "color: #ff7f00"],
				          ["12일", D12, "color: #ff7f00"],
				          ["13일", D13, "color: #ff7f00"],
				          ["14일", D14, "color: #ff7f00"],
				          ["15일", D15, "color: #ff7f00"],
				          ["16일", D16, "color: #ff7f00"],
				          ["17일", D17, "color: #ff7f00"],
				          ["18일", D18, "color: #ff7f00"],
				          ["19일", D19, "color: #ff7f00"],
				          ["20일", D20, "color: #ff7f00"],
				          ["21일", D21, "color: #ff7f00"],
				          ["22일", D22, "color: #ff7f00"],
				          ["23일", D23, "color: #ff7f00"],
				          ["24일", D24, "color: #ff7f00"],
				          ["25일", D25, "color: #ff7f00"],
				          ["26일", D26, "color: #ff7f00"],
				          ["27일", D27, "color: #ff7f00"],
				          ["28일", D28, "color: #ff7f00"],
				          ["29일", D29, "color: #ff7f00"],
				          ["30일", D30, "color: #ff7f00"],
				          ["31일", D31, "color: #ff7f00"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "프로젝트 등록 건수",
				        titleTextStyle:{
				        	fontSize : 25,
				        	bold:true
				        },
				        width: 1000,
				        height: 300,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				        vAxis: {viewWindowMode:'explicit', viewWindow: { min: 0}}
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart5"));
				      chart.draw(view, options);
				}
			});
	  }  

</script>
<style>
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: grey;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: white;
  }
  
  .sidebar-nav li a:hover {
    color: white;
    background: rgb(26, 188, 156);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
  
 a:link { color: white; text-decoration: none; }
 a:visited { color: white; text-decoration: none; }
 a:hover { color: white; text-decoration: none; }
 a:active { color: white; background-color: green; }
  
</style>
</head>
<body>
	<div id="page-wrapper">
		<!-- 사이드바 -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand" style="background: rgb(26, 188, 156);">
					<a href="#">SupportForMe</a>
				</li>
				<li><a href="<c:url value='/'/>forme/AdminDashBoard">DASHBOARD</a></li>
				<!--       
				<li><a href="#">회원 관련 통계정보</a></li>
      			<li><a href="#">프로젝트 관련 통계정보</a></li>
      			<li><a href="#">결제관련 통계정보</a></li> 
      			-->
				<li><a href="<c:url value='/'/>forme/AdminProjectProgressList">프로젝트 관리</a></li>
				<li><a href="<c:url value='/'/>forme/AdminMemberList">회원 관리</a></li>
				<li><a href="<c:url value='/'/>forme/AdminSupportForMePickList">서포미픽 관리</a></li>
				<li><a href="<c:url value='/'/>support/logout">로그아웃</a></li>
			</ul>
		</div>
		<!-- /사이드바 -->

		<!-- 본문 -->
		<div id="page-content-wrapper">
			<h5>DashBoard</h5>
			<hr>
			<div class="container-fluid">
				<div id="chart5" style="width: 1000px; "></div>
				<div id="chart4" style="width: 1000px; "></div>
				<div id="chart1" style="width: 1000px; "></div>
				<div id="chart2" style="width: 1000px; "></div>
				<div id="chart3" style="width: 1000px; "></div>
				
			</div>
		</div>
	</div>
	
	<!-- /본문 -->

	
</body>
</html>