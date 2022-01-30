<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/css/community_header.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header>
			<div id="logo">
				<img src="${path}/images/logoImg/logo.png" alt="로고">
				<span>확찐자구조대</span>
			</div>
			<ul id="menu">
				<li class="communityMain">커뮤니티홈</li>
				<li class="menuTab" data-category="free">자유게시판</li>
				<li class="menuTab" data-category="question">고민 & 질문</li>
				<li class="menuTab" data-category="tip">팁 & 노하우</li>
				<li class="menuTab" data-category="review">다이어트 후기</li>
				<li class="menuTab" data-category="emate">운동메이트</li>
			</ul>
		<div id="header_r">
			<input type="text" name="search" placeholder="검색어"/>
			<button type="button" id="searchBtn"><i class="fas fa-search"></i></button>
			<c:if test="${!empty sessionScope.account}">	          
				<div id="user-login" class="user"><i class="fas fa-user fa-2x"></i></div>
	        </c:if>
			<c:if test="${empty sessionScope.account}">	          
				<div id="user-logout" class="user"><i class="fas fa-user fa-2x"></i></div>
	        </c:if>
		</div>
		<div class="userBox ubLogin">
			<span id="ubLoginClose"><i class="fas fa-times"></i></span>
			<div id="userImg"></div>
			<div id="userInfo">
				<span id="nickname">${sessionScope.account.nickname}</span>
				<span id="letterBox"><i class="fas fa-envelope"></i></span>
			</div>
			<div class="ubBtn myProfile">프로필</div>
			<div class="ubBtn myPage">마이페이지</div>
			<div class="ubBtn logout">로그아웃</div>
		</div>
		<div class="userBox ubLogout">
			<span id="ubLogoutClose"><i class="fas fa-times"></i></span>
			<p>로그아웃 상태</p>
			<div class="ubBtn login">로그인</div>
			<div class="ubBtn signup">회원가입</div>
		</div>
	</header>
	<script type="text/javascript">
		$(function(){
			
			// 로그인상태-계정 아이콘 클릭
			$(document).on('click', '#user-login', function(){
				$(".ubLogin").addClass("clicked");
			})
			
			// 로그아웃상태-계정 아이콘 클릭
			$(document).on('click', '#user-logout', function(){
				$(".ubLogout").addClass("clicked");
			})
			
			// 로그인상태-userBox 닫기 클릭
			$(document).on('click', '#ubLoginClose', function(){
				$(".ubLogin").removeClass("clicked");
			})
			
			// 로그아웃상태-userBox 닫기 클릭
			$(document).on('click', '#ubLogoutClose', function(){
				$(".ubLogout").removeClass("clicked");
			})
			
			// 로고 클릭
			$(document).on('click', '#logo', function(){
				location.href = "${path}/index";
			})
			
			// 커뮤티니홈 탭 클릭
			$(document).on('click', '.communityMain', function(){
				location.href = "${path}/community/main";
			})
			
			// 쪽지 아이콘 클릭: 쪽지함 이동
			$(document).on('click', '#letterBox', function(){
				location.href = "${path}/member/mypage?currTab=letter";
			})
						
			// userBox-프로필 클릭
			$(document).on('click', '.myProfile', function(){
				/* location.href = "${path}/member/"; */
			})
				
			// userBox-마이페이지 클릭
			$(document).on('click', '', function(){
				/* location.href = "${path}/member/mypage"; */
			})
			
			// userBox-로그아웃 클릭
			$(document).on('click', '.logout', function(){
				location.href = "${path}/member/logout";
			})
			
			// userBox-로그인 클릭
			$(document).on('click', '.login', function(){
				location.href = "${path}/member/goLogin";
			})
			
			// userBox-회원가입 클릭
			$(document).on('click', '.signup', function(){
				location.href = "${path}/member/createMember";
			})
			
			// 메뉴탭 클릭
			 let currCategory = "free"; 
			 
	         $(document).on('click', '.menuTab', function(){
	        	 location.href = "${path}/community/bbs?category="+$(this).data("category");	        	 
	         })
		})
	</script>
</body>

</html>