<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/css/notice.css"/>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
		<div class="noticeBox">
            <div class="noticeImg">
                <img src="${path}/images/menu/noticeImg.jpg" alt="">
                <div class="noticeImgMent">
                    <p>Notice</p>
                </div>
            </div>

            <div class="noticeContents">
                <div class="noticeTitle">
                    <p>공지사항</p>
                </div>
                <div class="noticeContent">
                    <p>메뉴</p>
                </div>
            </div>
        </div>
	</div>
</body>
</html>