<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>확찐자구조대 로그인</title>
	<link rel="stylesheet" href="${path}/css/login.css" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap">
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
	<script src="https://kit.fontawesome.com/53a8c415f1.js"crossorigin="anonymous"></script>
</head>

<body>
	<div class="wrap">
		<div class="login">
			<h2>확찐자구조대</h2>
		
			<form action="${path}/member/login" method="post">
				<div class="login_id">
					<h4>아이디</h4>
					<input type="id" placeholder="아이디" name="id">
				</div>
				
				<div class="login_pw">
					<h4>비밀번호</h4>
					<input type="password" placeholder="비밀번호" name="password">
				</div>
	
				<div class="login_etc">
					
				</div>
					
				<div class="a_box">
					<ul>
						<li><i class="fas fa-address-card"></i><span> 회원가입</span></li>
						<li><i class="fas fa-search"></i><span> 아이디 찾기</span></li>
						<li><i class="fas fa-key"></i><span> 비밀번호 찾기</span></li>
					</ul>
				</div>
	
				<div class="submit">
					<button type="submit">로그인</button>
					<!-- <input type="submit" value="로그인">  -->
				</div>
			</form>
			
			<div class="login_sns">
				<ul>
					<li><i class="fab fa-instagram-square"></i></li>
					<li><i class="fab fa-facebook-square"></i></li>
					<li><i class="fab fa-twitter-square"></i></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>