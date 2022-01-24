<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>쪽지 보는 창</h1>
	<h4>${letter.lnum}</h4>
	<h4>${letter.title}</h4>
	<h4>${letter.content}</h4>
	<h4>${letter.date}</h4>
	<h4>${letter.rnick}</h4>
	<h4>${letter.snick}</h4>
	<h5>${sessionScope.account.nickname}</h5>
	
	<script type="text/javascript">
		$(function(){
			console.log(${letter.lnum});
		})
	</script>
</body>
</html>