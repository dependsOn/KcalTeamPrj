<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/css/default.css" />
	<link rel="stylesheet" href="${path}/css/index.css" />
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<header>
<div id="top">Top</div>
    <div class="logo">
        <img src="${path}/images/logoImg/logo.png" alt="">
        <ul>
            <li>확찐자구조대</li>
        </ul>
    </div>
    <div class="menuCenter">
        <ul>
            <li class='tip'>다이어트 꿀팁</li>
            <li class='kcal'>칼로리 계산기</li>
            <li class='map'>내 주변 시설</li>
            <li class='notice'>공지사항</li>
            <li class='cs'>고객센터</li>
        </ul>
    </div>
    <div class="menuRight">
        <ul>
        	<c:if test="${sessionScope.account.isadmin} != 'Y'">
                <li><button class="rightBtn admin">관리자 페이지</button></li>
            </c:if>
            <li><button class="rightBtn community">커뮤니티</button></li>
        </ul>
        <ul>
        	<c:if test="${empty sessionScope.account}">
                <li>회원가입</li>
                <li id="login">로그인</li>
            </c:if>
        	<c:if test="${!empty sessionScope.account}">
                <li>${sessionScope.account.nickname}</li>
                <li id="logout">로그아웃</li>
            </c:if>
        </ul>
    </div>
</header>
 	<script type="text/javascript">
	 	document.getElementById('top').addEventListener('click', function() {
	        window.scrollTo(0,0);
	    });
	 	
		$(function(){
			$("#login").click(function(){
				location.href = '${path}/member/goLogin';
			});
			
			$("#logout").click(function(){
				location.href = '${path}/member/logout';
			});
			
			$(".tip").click(function(){
				location.href = '${path}/tip/goTip';
			});
			
			$(".kcal").click(function(){
				location.href = '${path}/kcal/goKcal';
			});
			
			$(".map").click(function(){
				location.href = '${path}/map/goMap';
			});
			
			$(".notice").click(function(){
				location.href = '${path}/notice/goNotice';
			});
			
			$(".cs").click(function(){
				location.href = '${path}/cs/goCs';
			});
			
			$(".admin").click(function(){
				location.href = '${path}/admin/goAdmin';
			});
			
			$(".community").click(function(){
				location.href = '${path}/community/goCommunity';
			});
		});
    </script>
</body>
</html>























