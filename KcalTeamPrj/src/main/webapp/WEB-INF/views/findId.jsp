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
	<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='${path}/member/goLogin';
		})
	})
</script>

	
</head>
<body>
	 <div >
		<div>
			<div >
				<h3>아이디 찾기 검색결과</h3>
			</div>
			<div>
				<h5>
					${ id }
				</h5>
				<p >
					<button type="button" id=loginBtn >Login</button>
					<button type="button" onclick="history.go(-1);">Cancel</button>
				</p>
			</div>
		</div>
	</div>



</body>
</html>