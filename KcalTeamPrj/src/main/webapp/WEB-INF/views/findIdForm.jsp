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
	 <div>
      <div>
        <form action="${path}/member/findId" method="post">
          <div>
            <h3>아이디 찾기</h3>
          </div>
          <div>
            <p>
              <label>Email</label>
              <input type="text" id="email" name="email" required />
            </p>
            <p>
              <button type="submit" id="findBtn">find</button>
              <button type="button" onclick="history.go(-1);">Cancel</button>
            </p>
          </div>
        </form>
      </div>
    </div>
    
    <script type="text/javascript">

	
	
	

	
	
	
</script>
</body>
</html>