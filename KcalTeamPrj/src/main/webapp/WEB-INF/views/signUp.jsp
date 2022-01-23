<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/css/signUp.css"/>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
	
	 	<div class="signUp">
	        <div class="signUpBox">
	            <div class="signUpTitle">
	                <p class="signUpMent1">구조대가 필요한 '<span>확</span>'찐자들을 위한 곳</p>
	                <p class="signUpMent2">나의 건강이 만들어지는 공간 지금 당장 계획해봐요 !</p>
	            </div>
	            <div class="signUpContent">
	                <div class="signUpContentTitle">
	                    <p>회원가입</p>
	                </div>
	
	                <div class="signUpInfo">
	                    <form action="${path}/member/signUp" method="post">
	                        <div class="signUpInfoBox">
	                            <ul>
	                                <li>
	                                    <label class="idLabel"><span>* </span>ID</label>
	                                    <input type="text" id="id" name="id"><br>
	                                    <button id="checkId" class="Btn">중복확인</button>
	                                </li>
	                                <li>
	                                    <label class="pwLabel1"><span>* </span>비밀번호</label>
	                                    <input type="password" id="password" name="password">
	                                </li>
	                                <li>
	                                    <label class="pwLabel2"><span>* </span>비밀번호 확인</label>
	                                    <input type="password" id="password" name="password">
	                                </li>
	                                <li>
	                                    <label class="nickLabel"><span>* </span>닉네임</label>
	                                    <input type="text" id="nickname" name="nickname">
	                                    <button id="checkNick" class="Btn">중복확인</button>
	                                </li>
	                                <li>
	                                    <label class="emailLabel"><span>* </span>이메일</label>
	                                    <input type="email" id="email" name="email">
	                                    
	                                    
	                                </li>
	                                <li>
	                                    <label class="addr1Label"><span>* </span>주소</label>
	                                    <input type="text" id="addr1" name="addr1">
	                                    <input type="text" id="addr2" name="addr2">
	                                    <button id="findAddr" class="Btn">주소찾기</button>
	                                </li>
	                                <li>
	                                    <label class="addr3Label"><span>* </span>상세주소</label>
	                                    <input type="text" id="addr3" name="addr3">
	                                </li>
	                            </ul>
	                            <div class="signUpBtnBox">
	                                <button id="signUpBtn">회원가입</button>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
    <script type="text/javascript">
    	$(function(){
    		// 이메일 중복 실시간 확인
	        $("#email").on("keyup", function(){
	        	let email = $("#email").val();
	        	
	        	if(email == "") {
	        		$(".emailCheckResult").text("이메일을 입력해주세요.");
	        		$(".emailCheckResult").css("color", "red");
	        	}else {
		        	$.ajax({
		        		url: "${path}/member/checkEmail",
		        		type: "POST",
		        		data: {
		        			"email" : email,
		        			"id" : "${sessionScope.account.id}"
		        		},	        		
		        		success: function(data) {
		        			if(data == "possible") {
		        				$(".emailCheckResult").text("사용가능한 이메일입니다.");
		        				$(".emailCheckResult").css("color", "blue");
		        				$(".isPossible").val(data);
		        			}else {
		        				$(".emailCheckResult").text("이미 사용중인 이메일입니다.");
		        				$(".emailCheckResult").css("color", "red");
		        				$(".isPossible").val(data);
		        			}
		        		}
		        	})	        		
	        	}	        	
	        });	
    	})
    </script>
</body>
</html>