<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="${path}/css/community_bbs_create.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="community_header.jsp"></jsp:include>

	<div id="wrap">
		<form:form modelAttribute="BBSVO" action="${path}/bbs/create_result"
			method="post">
			<ul>
				<li><form:select path="category" id="category">
						<form:option value="free">자유게시판</form:option>
						<form:option value="question">고민&질문</form:option>
						<form:option value="tip">팁&노하우</form:option>
						<form:option value="review">다이어트후기</form:option>
						<form:option value="emate">운동메이트</form:option>
					</form:select>
					<form:input path="region" placeholder="지역" id="region"/>
				</li>
				<li><form:input path="title" placeholder="제목" /></li>
				<li><form:textarea path="content" cols="50" rows="10" /></li>

				<form:hidden path="unum" value="${sessionScope.account.unum}" />
				<form:hidden path="id" value="${sessionScope.account.id}" />
				<form:hidden path="nickname" value="${sessionScope.account.nickname}" />
				<%-- <form:hidden path="filelist"/> --%>

				<li><button id="submit">전송</button></li>
			</ul>
		</form:form>
	</div>


	<!-- 푸터 -->
	<jsp:include page="footer.jsp"></jsp:include>


	<script type="text/javascript">
		$(function() {
			let currCategory = "free";

			$(document).on('click', '.menuTab', function() {
				location.href = "${path}/community/bbs?category=" + $(this).data("category");
			})

			$("#region").hide();
			$("#region").attr("disabled", true);
			$("#category").on("change", function(){ 
				let select = $("#category option:selected").val();
				if (select == "emate") {
					$("#region").show();
					$("#region").attr("disabled", false);
				} else {
					$("#region").hide();
					$("#region").attr("disabled", true);
				}

			});
			

		})
	</script>

</body>
</html>