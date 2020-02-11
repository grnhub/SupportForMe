<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>결제</title>
    </head>
    <style>
    .bodysize {
        margin-left: auto;
        margin-right: auto;
    }
        session{
            margin-left: 50px;
        }
        nav{
            padding-top: 25px
        }
    	 input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button{
			-webkit-appearance: none;
			margin: 0;
		}
		.side div {
			padding:10px 5px;
			font-size:18px;
			
		}
    </style>
    <script>
    var path = "<c:url value='/'/>";
    var presentNo =null;
    var projectNo =null;
    var presentName = null;
    var price = 0;
    var price2 = 0;
    var allAmount = 0;
	function selectPresent(){
		var presentSelect = document.querySelector("input[name=present]:checked");
		presentNo = presentSelect.nextSibling.nextSibling.value;
		projectNo = presentSelect.nextSibling.nextSibling.nextSibling.nextSibling.value;
		price = presentSelect.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.value;
		presentName = presentSelect.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.value;
		allAmount = Number(price) + Number(price2);
		document.querySelector("#allAmount").innerHTML= Number(price) + Number(price2);		
	}
	
	function inputAmount(){
		price2 = document.querySelector("#inputAmount").value;
		allAmount = Number(price) + Number(price2);
		document.querySelector("#allAmount").innerHTML=allAmount; 
	}
	
	function nextStep(){
		if(presentNo == null ){
			alert('리워드를 선택하여 주세요.');
			return false;
		}
				var form = document.createElement("form");
				var parm = new Array();
				var input = new Array();
				form.action = path+"/forme/InvestPaymentInfoForm";
				form.method = "post";
				parm.push([ 'presentNo', presentNo ]);
				parm.push([ 'projectNo', projectNo ]);
				parm.push([ 'allAmount', allAmount ]);
				parm.push([ 'presentName', presentName ]);
				parm.push([ 'price2', price2]);
				
				for (var i = 0; i < parm.length; i++) {
					input[i] = document.createElement("input");
					input[i].setAttribute("type", "hidden");
					input[i].setAttribute('name', parm[i][0]);
					input[i].setAttribute("value", parm[i][1]);
					form.appendChild(input[i]);
				}
				document.body.appendChild(form);
				form.submit();
	}
	</script>
<body>
    
    <div style="width:1250px;margin-top:40px;" class="bodysize">
    <nav style="float: left">
        <div class="side" style="width:200px">
            <div style="background: rgb(26, 188, 156);color:white">리워드 선택</div>
            <div>결제</div>
        </div>
    </nav>
    <session style="float: left">
    
    <div style="width: 950px;">
    <div><h2>프로젝트명 : ${presentList[0].projectName}</h2></div>
        <h2>리워드 선택</h2>
        <hr>
    <c:forEach items="${presentList}" var="presentList">
       <div style="background: lightgrey; width: 350px">
            <input type="radio" name="present" onclick="selectPresent()">
         	<input type="hidden" value="${presentList.presentNo}" readonly="readonly">
         	<input type="hidden" value="${presentList.projectNo}" readonly="readonly"> 
         	<input type="hidden" value="${presentList.presentPrice}" readonly="readonly"> 
         	<input type="hidden" value="${presentList.presentName}" readonly="readonly"> 
            ${presentList.presentPrice} 투자<br>
       		${presentList.presentName}<br>
         	발송 예정일  ${presentList.deliveryDate}
        </div>
        <br>
	</c:forEach>	


            <hr>
            <h3>추가 투자</h3>
            <font style="color:red">선택사항</font><br>
            <input type="number" id="inputAmount" value=0 onkeyup="inputAmount()"> 원을 추가 투자
            <hr>
            <h3>총 투자 금액 <span id="allAmount">0</span>원</h3>
            <input type="button" value="다음단계" onclick="nextStep()" style="background:rgb(26, 188, 156);color:white">
            <input type="button" value="취소" style="background:rgb(26, 188, 156);color:white">
        </div>
    </session>      
    </div>
</body>
</html>
