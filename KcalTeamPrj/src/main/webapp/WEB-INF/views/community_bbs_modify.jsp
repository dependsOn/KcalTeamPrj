<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${path}/css/community_bbs_modify.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="community_header.jsp"></jsp:include>
	
	<div id="wrap">
		form
	
		<form:form modelAttribute="BBSVO" action="${path}/bbs/community_modify_result">
		<ul>
			<li><label for="title">제목 : </label><form:input path="title" value="${bbsVO.title}"/></li>
			<li><form:textarea path="content" cols="50" rows="10" value="${bbsVO.content}"/></li>
			<form:hidden path="bnum" value="${bbsVO.bnum}"/>
			<%-- <form:hidden path="filelist"/> --%>
		</ul>
		<button type="button" id="modify">수정</button>
		</form:form>
	<%-- <c:forEach var="file" items="${filelist}">
	<div class="file-item">
		<a href="${pageContext.request.contextPath}/downloadFile/${file.localName}/${file.serverName}">${file.localName}</a>
		<button data-num="${file.num}" class="deleteFile">삭제</button>
	</div>
	</c:forEach>
	<button class="alldelete" data-bnum="${BBSVO.num}">전체삭제</button><br>
	<label for="upload">파일 추가 :</label><input type="file" id="upload" name="upload" multiple> --%>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		
	</script>
</body>
</html>