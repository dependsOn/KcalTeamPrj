<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/default.css" />
<link rel="stylesheet" href="${path}/resources/css/index.css" />
<script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
        <header>
            <div class="logo">
                <img src="logoImg/logo.png" alt="">
                <ul>
                    <li>확찐자 구조대</li>
                </ul> 
            </div>
            <div class="menuCenter">
                <ul>
                    <li>다이어트 꿀팁</li>
                    <li>칼로리 계산기</li>
                    <li>내 주변 시설</li>
                    <li>공지사항</li>
                    <li>고객센터</li>
                </ul>
            </div>
            <div class="menuRight">
                <ul>
                    <li><button class="admin">관리자 페이지</button></li>
                    <li><button class="community">커뮤니티</button></li>
                </ul>
                <ul>
                    <li>회원가입</li>
                    <li>로그인</li>
                </ul>
            </div>
        </header>
    </div>
    <script type="text/javascript"></script>
</body>
</html>