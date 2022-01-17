<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${path}/css/login.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="wrap">
        <div class="login">
            <h2>확찐자구조대</h2>
            <div class="login_sns">
	            <li><a href=""><i class="fab fa-instagram"></i></a></li>
	            <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
	            <li><a href=""><i class="fab fa-twitter"></i></a></li>
            </div>
            <div class="login_id">
                <h4>이메일</h4>
                <input type="email" placeholder="이메일">
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="password" placeholder="비밀번호">
            </div>
            <div class="login_etc">
                <div class="checkbox">
                <input type="checkbox"> 아이디 저장
                </div>
                <div class="forgot_pw">
                <a href="">비밀번호 찾기</a>
            </div>
            </div>
            <div class="submit">
                <input type="submit" value="로그인">
            </div>
        </div>
    </div>
</body>
</html>