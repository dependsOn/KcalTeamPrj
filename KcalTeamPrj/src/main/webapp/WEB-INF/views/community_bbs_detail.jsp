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
		<div id="titleBox">
			<div id="category">
				<c:choose>
					<c:when test="${bbsVO.category eq 'free'}">자유게시판</c:when>
					<c:when test="${bbsVO.category eq 'question'}">고민 & 질문</c:when>
					<c:when test="${bbsVO.category eq 'tip'}">팁 & 노하우</c:when>
					<c:when test="${bbsVO.category eq 'review'}">다이어트 후기</c:when>
					<c:when test="${bbsVO.category eq 'emate'}">운동메이트</c:when>	
					<c:when test="${bbsVO.category eq 'cnotice'}">커뮤니티 공지</c:when>	
				</c:choose>
			</div>
			<p id="title">
				<c:if test="${!empty bbsVO.region}">[${bbsVO.region}]</c:if>&nbsp;${bbsVO.title}			
			</p>
			<ul id="bbsInfo">
				<li>
					<a href="" id="ownerNickname">${bbsVO.nickname}</a>
					<span id="createdate">${bbsVO.createdate}</span>
					<span id="viewCnt">조회수 ${bbsVO.view_cnt}</span>
				</li>
				<li id="controllBtns">
					<c:if test="${sessionScope.account.unum eq bbsVO.unum}">
						<button id="modifyBBS">수정</button>
						<button id="deleteBBS">삭제</button>					
					</c:if>
				</li>
			</ul>
		</div>
		<div id="contentBox">
			<p id="content">
				<c:out value="${bbsVO.content}" escapeXml="false" />
			</p>
			<span id="reccomend"><i class="fas fa-thumbs-up"></i>&nbsp;&nbsp;${bbsVO.recommend}</span>
			<span id="backToList"><i class="fas fa-list"></i>&nbsp;&nbsp;목록</span>
		</div>
		<div id="commentBox">
			<p id="commentCnt">댓글 0개</p>
			<div id="newComment">
				<textarea rows="5" id="comment"></textarea>
				<button id="putComment">댓글 등록</button>
			</div>
			<div id="comments">
			</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(function(){
			// 현재 카테고리
			let currCategory = "${bbsVO.category}";
			$(".menuTab[data-category="+currCategory+"]").addClass("selected");
			
			// 헤더 탭메뉴 클릭 시
			$(document).on('click', '.menuTab', function() {
				location.href = "${path}/community/bbs?category=" + $(this).data("category");
			})
			
			// 수정버튼 클릭
	        $(document).on('click', '#modifyBBS', function(){
   				location.href = "${path}/bbs/modify?bnum=${bbsVO.bnum}";
   			})
   			
   			// 목록버튼 클릭
   			$("#backToList").click(function(){
   				window.history.back();
   			})
   			
		})
	</script>
</body>
</html>