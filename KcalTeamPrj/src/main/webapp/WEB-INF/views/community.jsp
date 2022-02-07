<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/css/default.css" />
	<link rel="stylesheet" href="${path}/css/community.css" />
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="community_header.jsp"></jsp:include>
		<div class="adNLogin">
            <div class="ad">
                <img src="${path}/images/main/main3.jpg" alt="">
            </div>
            
            <c:if test="${empty sessionScope.account}">
                <div class="login">
	                <p>로그인 후 자유롭게 이용하세요</p>
	                <button class="changeBtn">로그인</button>
            	</div>
            	
            	<div class="loginSubmit">
	                <div class="loginSiteName">
	                    <p>Kcal Dynamite</p>
	                </div>
	                <form action="${path}/community/login" id="loginPass" method="post">
	                    <div class="idWrite">
	                        <label for="id">아이디</label>
	                        <input type="text" id="id" name="id">
	                    </div>
	                    <div class="pwWrite">
	                        <label for="password">비밀번호</label>
	                        <input type="password" id="password" name="password">
	                    </div>
	                    <div class="logBtnBox">
                        	<button class="logBtn">로그인</button>
                    	</div>
	                </form>
	                <div class="supportBox">
	                    <p id="goJoinMember"><i class="fas fa-address-card"></i><span> 회원가입</span></p>
	                    <p id="goFindId"><i class="fas fa-search"></i><span> 아이디 찾기</span></p>
	                    <p id="goFindPw"><i class="fas fa-key"></i><span> 비밀번호 찾기</span></p>
	                </div>
	            </div>
            </c:if>
            
        	<c:if test="${!empty sessionScope.account}">
                <div class="loginAfter">
	                <div class="logout">
	                    <p>${sessionScope.account.nickname}</p>
	                    <p id="logoutBtn">로그아웃</p>
	                </div>
                
	                <div class="profileLine">
	                    <div class="profileImage">
	                        <img src="${path}/images/main/main3.jpg" alt="">
	                    </div>
	                    <div class="profileBtns">
	                        <button id="goProfile">프로필</button>
	                        <button id="goMypage">마이페이지</button>
	                        <button id="goLetter">쪽지함</button>
	                    </div>
	                </div>
            	</div>
            </c:if>
        </div>

        <div class="peopleBox">
            <div class="pTitle">
                <p>오늘의 피플</p>
            </div>
        </div>

        <div class="peopleList">
            <ul>
                <li>
                    <img src="${path}/images/main/main1.jpg" alt="">
                    <p>계랑마리</p>
                    <ul>
                        <li>팔로우<span> 10000</span></li>
                        <li>팔로워<span> 10000</span></li>
                    </ul>
                </li>
                <li>
                    <img src="${path}/images/menu/kcalImg.jpg" alt="">
                    <p>종훈짱123</p>
                    <ul>
                        <li>팔로우<span> 20000</span></li>
                        <li>팔로워<span> 20000</span></li>
                    </ul>
                </li>
                <li>
                    <img src="${path}/images/main/fourcimg.jpg" alt="">
                    <p>얼음공듀</p>
                    <ul>
                        <li>팔로우<span> 30000</span></li>
                        <li>팔로워<span> 30000</span></li>
                    </ul>
                </li>
                <li>
                    <img src="${path}/images/menu/noticeImg.jpg" alt="">
                    <p>앵무새앵무새</p>
                    <ul>
                        <li>팔로우<span> 40000</span></li>
                        <li>팔로워<span> 40000</span></li>
                    </ul>
                </li>
                <li>
                    <img src="${path}/images/main/main3.jpg" alt="">
                    <p>핑크겅듀</p>
                    <ul>
                        <li>팔로우<span> 50000</span></li>
                        <li>팔로워<span> 50000</span></li>
                    </ul>
                </li>
                <li>
                    <img src="${path}/images/main/main2.jpg" alt="">
                    <p>먹방BJ</p>
                    <ul>
                        <li>팔로우<span> 50000</span></li>
                        <li>팔로워<span> 50000</span></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="bbsHotBox">
            <div class="bTitle">
                <p>최신글</p>
            </div>
        </div>

        <div class="bbsBox">
        	<div id="free">
        		<div class="titleCon">
        			<span class="cateTitle">자유게시판</span>
        			<span class="more" data-category="free">더보기&nbsp;<i class="fas fa-plus"></i></span>
        		</div>
        		<ul id="freeList">
        			<li class="bbsTitle" data-bnum="${free[0].bnum}">${free[0].title}</li>
        			<li class="bbsTitle" data-bnum="${free[1].bnum}">${free[1].title}</li>
        			<li class="bbsTitle" data-bnum="${free[2].bnum}">${free[2].title}</li>
        			<li class="bbsTitle" data-bnum="${free[3].bnum}">${free[3].title}</li>
        			<li class="bbsTitle" data-bnum="${free[4].bnum}">${free[4].title}</li>
        		</ul>
        	</div>
        	
        	<div id="question">
        		<div class="titleCon">
        			<span class="cateTitle">고민&질문</span>
        			<span class="more" data-category="question">더보기&nbsp;<i class="fas fa-plus"></i></span>
        		</div>
        		<ul id="questionList">
        			<li class="bbsTitle" data-bnum="${question[0].bnum}">${question[0].title}</li>
        			<li class="bbsTitle" data-bnum="${question[1].bnum}">${question[1].title}</li>
        			<li class="bbsTitle" data-bnum="${question[2].bnum}">${question[2].title}</li>
        			<li class="bbsTitle" data-bnum="${question[3].bnum}">${question[3].title}</li>
        			<li class="bbsTitle" data-bnum="${question[4].bnum}">${question[4].title}</li>
        		</ul>
        	</div>
        	
        	<div id="tip">
        		<div class="titleCon">
        			<span class="cateTitle">팁&노하우</span>
        			<span class="more" data-category="tip">더보기&nbsp;<i class="fas fa-plus"></i></span>
        		</div>
        		<ul id="tipList">
        			<li class="bbsTitle" data-bnum="${tip[0].bnum}">${tip[0].title}</li>
        			<li class="bbsTitle" data-bnum="${tip[1].bnum}">${tip[1].title}</li>
        			<li class="bbsTitle" data-bnum="${tip[2].bnum}">${tip[2].title}</li>
        			<li class="bbsTitle" data-bnum="${tip[3].bnum}">${tip[3].title}</li>
        			<li class="bbsTitle" data-bnum="${tip[4].bnum}">${tip[4].title}</li>
        		</ul>
        	</div>
        	
        	<div id="review">
        		<div class="titleCon">
        			<span class="cateTitle">다이어트후기</span>
        			<span class="more" data-category="review">더보기&nbsp;<i class="fas fa-plus"></i></span>
        		</div>
        		<ul id="freeList">
        			<li class="bbsTitle" data-bnum="${review[0].bnum}">${review[0].title}</li>
        			<li class="bbsTitle" data-bnum="${review[1].bnum}">${review[1].title}</li>
        			<li class="bbsTitle" data-bnum="${review[2].bnum}">${review[2].title}</li>
        			<li class="bbsTitle" data-bnum="${review[3].bnum}">${review[3].title}</li>
        			<li class="bbsTitle" data-bnum="${review[4].bnum}">${review[4].title}</li>
        		</ul>
        	</div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
	</div>
	
	<script type="text/javascript">
		$(function(){
			// 메뉴탭 클릭
			 let currCategory = "free"; 
			 
	         $(document).on('click', '.menuTab', function(){
	        	 location.href = "${path}/community/bbs?category="+$(this).data("category");	        	 
	         })
	         
	         $(document).ready(function() {
	        	 $('.adNLogin .login').show(); 
	        	 $('.loginSubmit').hide();
	        	 
	        	 $('.changeBtn').click(function(){
		        	 $ ('.adNLogin .login').hide(); 
		        	 $ ('.loginSubmit').show(); 
		        	 return false;
	        	 });
        	 });
	         
	         // 로그아웃
	         $("#logoutBtn").click(function(){
					location.href = '${path}/member/logout';
			 });
	         
	         // 회원가입
	         $("#goJoinMember").click(function(){
					location.href = '${path}/member/createMember';
			 });
	         
	         // ID 찾기
	         /* $("#goFindId").click(function(){
					location.href = '${path}/';
			 }); */
	         
	         // PW 찾기
	         /* $("#goFindPw").click(function(){
					location.href = '${path}/';
			 }); */
	         
	         // 프로필
	         $("#goProfile").click(function(){
					location.href = '${path}/profile/main?nickname=${sessionScope.account.nickname}';
			 }); 
	         
	         // 마이페이지
	         $("#goMypage").click(function(){
			 		location.href = '${path}/member/mypage';
			 });
			 
	         
	         // 쪽지함
	         $("#goLetter").click(function(){
					location.href = '${path}/member/mypage?currTab=letter';
			 });
	         
	         
	         
	         // 최신글 더보기 클릭
	         $(".more").click(function() {
	        	 location.href = "${path}/community/bbs?category=" + $(this).data("category");
	         })
	         
	         // 게시물 제목클릭
        
	         $(document).on('click', '.bbsTitle', function(){
	        	 location.href = "${path}/bbs/detail?bnum=" + $(this).data("bnum");         
	         })
		
		})
	</script>
</body>
</html>