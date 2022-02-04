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
	                <button>로그인</button>
	                <ul>
	                    <li><i class="fas fa-address-card"></i>회원가입</li>
	                    <li><i class="fas fa-search"></i>ID/PW 찾기</li>
	                </ul>
            	</div>
	            </c:if>
        	<c:if test="${!empty sessionScope.account}">
                <div class="loginAfter">
	                <div class="logout">
	                    <p>${sessionScope.account.nickname}</p>
	                    <p>로그아웃</p>
	                </div>
                
	                <div class="profileLine">
	                    <div class="profileImage">
	                        <img src="${path}/images/main/main3.jpg" alt="">
	                    </div>
	                    <div class="profileBtns">
	                        <button>프로필</button>
	                        <button>마이페이지</button>
	                        <button>쪽지함</button>
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
                <p>Hot 게시글</p>
            </div>
        </div>

        <div class="bbsBox">
            <ul>
                <li class="bOne">
                    <p>자유게시판</p>
                    <ul>
                        <li>나랑놀사람 ~~~알수없는 알고리즘    border: 1px solid black;    border: 1px solid black;    border: 1px solid black;    border: 1px solid black;    border: 1px solid black;</li>
                        <li>누가 나좀 살려줘 ~알수없는 알고리즘</li>
                        <li>내가 이구역 미친X알수없는 알고리즘</li>
                        <li>알수없는 알고리즘알수없는 알고리즘</li>
                        <li>따라알수없는 알고리즘</li>
                    </ul>
                </li>
                <li class="bTwo">
                    <p>고민 & 질문</p>
                    <ul>
                        <li>나랑놀사람 ~~~알수없는 알고리즘</li>
                        <li>누가 나좀 살려줘 ~알수없는 알고리즘</li>
                        <li>내가 이구역 미친X알수없는 알고리즘</li>
                        <li>알수없는 알고리즘알수없는 알고리즘</li>
                        <li>따라알수없는 알고리즘</li>
                    </ul>
                </li>
                <li class="bThree">
                    <p>팁 & 노하우</p>
                    <ul>
                        <li>나랑놀사람 ~~~알수없는 알고리즘</li>
                        <li>누가 나좀 살려줘 ~알수없는 알고리즘</li>
                        <li>내가 이구역 미친X알수없는 알고리즘</li>
                        <li>알수없는 알고리즘알수없는 알고리즘</li>
                        <li>따라알수없는 알고리즘</li>
                    </ul>
                </li>
                <li>
                    <p>다이어트 후기</p>
                    <ul>
                        <li>나랑놀사람 ~~~알수없는 알고리즘</li>
                        <li>누가 나좀 살려줘 ~알수없는 알고리즘</li>
                        <li>내가 이구역 미친X알수없는 알고리즘</li>
                        <li>알수없는 알고리즘알수없는 알고리즘</li>
                        <li>따라알수없는 알고리즘</li>
                    </ul>
                </li>
            </ul>
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
	         
		})
	</script>
</body>
</html>