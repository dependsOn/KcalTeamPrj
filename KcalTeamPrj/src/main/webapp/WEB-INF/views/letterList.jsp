<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="rl">
		<table id="rlTable">
			<thead>
				<tr>
					<th>제목</th>
					<th>보낸이</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${receiveLetterList}">
					<tr>
						<td>${item.title}</td>
						<td>${item.snick}</td>
						<td>${item.date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<%
	// num : 현재 페이지
      int num = (Integer)request.getAttribute("num");
	// count : 전체 데이터 개수
      int count = (Integer)request.getAttribute("count");
	// total : 전체 페이지 개수
      int total = count/10+((count%10==0)?0:1);
	// minBlock : 한 블럭의 가장 작은번호인 페이지 num
      int minBlock = (((num-1)/5)*5)+1;
	// maxBlock : 한 블럭의 가장 큰 번호인 페이지 num
      int maxBlock = (((num-1)/5)+1)*5;
      
      pageContext.setAttribute("total", total);
      pageContext.setAttribute("minBlock", minBlock);
      pageContext.setAttribute("maxBlock", maxBlock);
      
   %>
   <input type="hidden" value="${num}" id="num" />
   <input type="hidden" value="${minBlock}" id="minBlock" />
   <input type="hidden" value="${maxBlock}" id="maxBlock" />
   <c:choose>
   	<c:when test="${minBlock-1 < 1}">
   		<span>◀◀</span>
   	</c:when>
   	<c:otherwise>
   		<a id="preBlock">◀◀</a>
   	</c:otherwise>
   </c:choose>
   &nbsp;&nbsp;
   <c:choose>
      <c:when test="${num==1}">
         <span>◀</span>
      </c:when>
      <c:otherwise>
         <a id="pre">◀</a>
      </c:otherwise>
   </c:choose>
   <c:forEach begin="${minBlock}" end="${(total<maxBlock)?total:maxBlock}" step="1" var="i">
      <c:choose>
         <c:when test="${num == i}">
            <span class="currPage">${i}</span>
         </c:when>
         <c:otherwise>
            <a class="page">${i}</a>
         </c:otherwise>
      </c:choose>

   </c:forEach>
   <c:choose>
      <c:when test="${num == total}">
         <span>▶</span>
      </c:when>
      <c:otherwise>
         <a id="next">▶</a>    
      </c:otherwise>
   </c:choose>
   &nbsp;&nbsp;
   <c:choose>
   	<c:when test="${maxBlock > total}">
   		<span>▶▶</span>
   	</c:when>
   	<c:otherwise>
   		<a id="nextBlock">▶▶</a>
	</c:otherwise>
   </c:choose>
	</div>
	
	<div id="sl">
		<table id="slTable">
			<thead>
				<tr>
					<th>제목</th>
					<th>받는이</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${sendLetterList}">
					<tr>
						<td>${item.title}</td>
						<td>${item.rnick}</td>
						<td>${item.date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>