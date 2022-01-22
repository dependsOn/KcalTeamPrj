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
            <li id='curTip' class='menu tip active' onclick='curPageFn(curTip)'>다이어트 꿀팁</li>
            <li id='curKcal' class='menu kcal active' onclick='curPageFn(curKcal)'>칼로리 계산기</li>
            <li id='curMap' class='menu map active' onclick='curPageFn(curMap)'>내 주변 시설</li>
            <li id='curNotice' class='menu notice active' onclick='curPageFn(curNotice)'>공지사항</li>
            <li id='curCs' class='menu cs active' onclick='curPageFn(curCs)'>고객센터</li>
        </ul>
    </div>
    <div class="menuRight">
        <ul>
        	<c:if test="${sessionScope.account.isadmin eq 'Y'}">
                <li><button class="rightBtn admin">관리자 페이지</button></li>
            </c:if>
            <li><button class="rightBtn community">커뮤니티</button></li>
        </ul>
        <ul>
        	<c:if test="${empty sessionScope.account}">
                <li id="signUp">회원가입</li>
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
	 	
	 	let curPageFn = function(cur) {
	 		if (cur === curTip) {
	 			location.href = '${path}/tip/goTip?curPage=curTip';
	 		} else if (cur === curKcal) {
	 			location.href = '${path}/kcal/goKcal?curPage=curKcal';
	 		} else if (cur === curMap) {
	 			location.href = '${path}/map/goMap?curPage=curMap';
	 		} else if (cur === curNotice) {
	 			location.href = '${path}/notice/goNotice?curPage=curNotice';
	 		} else if (cur === curCs) {
	 			location.href = '${path}/cs/goCs?curPage=curCs';
	 		}
	 	}
	 	
		$(function(){
			$('.logo').click(function() {
				location.href = '${path}/index';
			});
			
			$("#login").click(function(){
				location.href = '${path}/member/goLogin';
			});
			
			$("#logout").click(function(){
				location.href = '${path}/member/logout';
			});
			
			$('#signUp').click(function() {
				location.href = '${path}/member/creatMember'
			});
			
			$('.menu').removeClass('active');
			
			let curPage = "<c:out value = '${param.curPage}' />";
			
			$('#'+curPage).addClass('active');
		});
    </script>
</body>
</html>























