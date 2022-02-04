<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${path}/css/community_bbs_detail.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="community_header.jsp"></jsp:include>
	
	<div id="wrap">
		<ul>
			<li><h4>카테고리 : ${bbsVO.category}</h4></li>
			<li>
				<c:if test="${!empty bbsVO.region}">
					<h4>지역 : ${bbsVO.region}</h4>
				</c:if>
			</li>				
			<li><h4>${bbsVO.title}</h4></li>
			<li><h4>${bbsVO.nickname}</h4></li>
			<li><h4>작성일 : ${bbsVO.createdate}</h4></li>
			<li><h4>조회수 : ${bbsVO.viewCnt}</h4></li>
			<li><h4>추천 : ${bbsVO.recommend}</h4></li>
			<li><p>${bbsVO.content}</p></li>
			<li>
				<c:if test="${sessionScope.account.unum == bbsVO.unum}">
					<button id="modify">수정</button>
					<button id="delete">삭제</button>
				</c:if>
			</li>	
		</ul>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(function(){
			// 수정버튼 클릭
	        $(document).on('click', '#modify', function(){
   				location.href = "${path}/bbs/modify?bnum=${bbsVO.bnum}";
   			})
		})
	</script>
</body>
</html>