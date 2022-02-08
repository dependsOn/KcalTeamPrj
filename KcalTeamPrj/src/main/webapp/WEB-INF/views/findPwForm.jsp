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
<script>
	$(function(){
		$("#send").click(function(){
			$.ajax({
				url : "${path}/member/findPW",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					if(result == "success") {
						alert("임시비밀번호가 발송되었습니다.");
					}
				},
				error: function(result) {
					alert("error");
				}
			})
		});
	})
</script>
<title>비밀번호 찾기</title>
</head>
<body>
	<div>
		<div>
			<div>
				<h3>비밀번호 찾기</h3>
			</div>
			
			
				<label>ID</label>
				<input type="text" id="id" name="id" required>
				<label>Email</label>
				<input  type="text" id="email" name="email" required>
				
				<button id="send" type="button">find</button>
				<button type="button" onclick="history.go(-1);">Cancel</button>
			
			
		</div>
	</div>
</body>
</html>