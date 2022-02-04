<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/css/default.css"/>
	<link rel="stylesheet" href="${path}/css/tip.css"/>
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://kit.fontawesome.com/604dbbab30.js"></script>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
		<div class="tipBox">
            <div class="tipImg">
                <img src="${path}/images/menu/tipImg.jpg" alt="">
                <div class="tipImgMent">
                    <p>Diet Tips</p>
                </div>
            </div>

            <div class="tipContents">
                <div class="tipTitle">
                    <button class="tabMenu" id="default" onclick="openCity(event, 'column')">칼럼</button>
                    <button class="tabMenu" onclick="openCity(event, 'workout')">운동</button>
                </div>
                
				<div id="column" class="tabContent">
                    <ul class="titleBox">
                        <li>Diet Tips(칼럼)</li>
                        <li>
                            <p>날짜순</p>
                            <p>조회순</p>
                        </li>
                    </ul>
                    
                   <c:forEach var="tipList" items="${list}">
                   		<c:if test="${tipList.category eq 'column'}">
		                    <div class="contentBox">
		                        <img src="${path}/images/main/fcimg.jpg" alt="">
		                        <ul>
		                            <li>
		                            	<p><a href="${path}/tip/tipDetail?tnum=${tipList.tnum}&curPage=curTip"><c:out value="${tipList.title}" escapeXml="false" /></a></p>
		                            </li>
		                            <li>
		                            	<p><c:out value="${tipList.contents}" escapeXml="false" /></p>
		                            </li>
		                            <li>
		                            	<p><c:out value="${tipList.createdate}" escapeXml="false" /></p>
		                                <div>
		                                    <i class="xi-eye-o"><span> ${tipList.view_cnt}</span></i>
		                                    <i class="xi-heart"></i>
		                                </div>
		                            </li>
		                        </ul>
		                    </div>
	                    </c:if>
	                </c:forEach>
                </div>
                
                <div id="workout" class="tabContent">
                    <ul class="titleBox">
                        <li>Diet Tips(운동)</li>
                        <li>
                            <p>날짜순</p>
                            <p>조회순</p>
                        </li>
                    </ul>
                    
                    <c:forEach var="tipList" items="${list}">
	                    <c:if test="${tipList.category eq 'workout'}">
		                    <div class="contentBox">
		                        <img src="${path}/images/main/fcimg.jpg" alt="">
		                        <ul>
		                            <li>
		                                <p><a href="${path}/tip/tipDetail?tnum=${tipList.tnum}"><c:out value="${tipList.title}" escapeXml="false" /></a></p>
		                            </li>
		                            <li>
		                                <p><c:out value="${tipList.contents}" escapeXml="false" /></p>
		                            </li>
		                            <li>
		                                <p><c:out value="${tipList.createdate}" escapeXml="false" /></p>
		                                <div>
		                                    <i class="fas fa-eye"><span> ${tipList.view_cnt}</span></i>
		                                    <i class="fas fa-heart"></i>
		                                </div>
		                            </li>
		                        </ul>
		                    </div>
		                </c:if>
                   	</c:forEach>
				</div>
			</div>
			<c:if test="${sessionScope.account.isadmin eq 'Y'}">
                <div class="writeBox">
                	<button class="createBtn">작성하기</button>
            	</div>
            </c:if>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
	<script type="text/javascript">
		function openCity(evt, openMenu) {
	        let i, tabcontent, tabMenu;
	
	        tabContent = document.getElementsByClassName('tabContent');
	        for (i = 0; i < tabContent.length; i++) {
	            tabContent[i].style.display = "none";
	        }
	
	        tabMenu = document.getElementsByClassName('tabMenu');
	        for (i = 0; i < tabMenu.length; i++) {
	            tabMenu[i].className = tabMenu[i].className.replace(' active', '');
	        }
	
	        document.getElementById(openMenu).style.display = 'block';
	        evt.currentTarget.className += ' active';
	    }
		
		document.getElementById('default').click();
		
		document.querySelector('.createBtn').addEventListener('click', function() {
			location.href = '${path}/tip/createTip?curPage=curTip';
		});
	</script>
</body>
</html>


















































