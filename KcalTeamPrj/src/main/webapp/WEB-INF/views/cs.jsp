<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/css/cs.css"/>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
		<div class="csBox">
            <div class="csImg">
                <img src="${path}/images/menu/csImg.jpg" alt="">
                <div class="csImgMent">
                    <p>Customer Service</p>
                </div>
            </div>

            <div class="csContents">
                <div class="csTitle">
                    <button class="tabMenu" id="default" onclick="openCity(event, 'csFaq')">FAQ</button>
                    <button class="tabMenu" onclick="openCity(event, 'csOne')">1:1 문의</button>
                </div>

                <div id="csFaq" class="tabContent">
                    <p>메뉴1</p>
                </div>
                
                <div id="csOne" class="tabContent">
                    <p>메뉴2</p>
                </div>
            </div>
        </div>
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
	</script>
</body>
</html>