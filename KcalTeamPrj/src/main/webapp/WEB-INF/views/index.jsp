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
	<link rel="stylesheet" href="${path}/css/index.css" />
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
	    <jsp:include page="main_menu_bar.jsp"></jsp:include>
	    <div class="main">
	        <div class="mainImgBox">
	            <div class="mainImg">
	                <img class="imgSlide" src="${path}/images/main/main1.jpg" alt="">
	                <img class="imgSlide" src="${path}/images/main/main2.jpg" alt="">
	                <img class="imgSlide" src="${path}/images/main/main3.jpg" alt="">
	                <img class="imgSlide" src="${path}/images/main/main4.jpg" alt="">
	            </div>
	
	            <div class="mainMent">
	                <p>Kcal Dynamite</p>
	                <p>칼로리를 부셔버릴 <span>Dynamite</span>가 필요한 순간</p>
	            </div>
	        </div>
	
	        <div class="mainContentBox">
	            <div class="contentsBga"></div>
	            <div class="contentsBgb"></div>
	
	            <div class="subMent">
	                <p>For health, For body. <span>&nbsp; Kcal - Dynamite</span></p>
	                <p>Kcal Dynamite 는 여러분의 건강을 위해 여러가지 서비스를 제공하고 있습니다. 제공된 서비스를 활용하고 커뮤니티를 통해 소통하며 건강 챙기세요!</p>
	                <div class="mark"></div>
	                <div class="underMark"></div>
	            </div>
	
	            <div class="firstContents">
	                <div class="fCImg">
	                    <img src="${path}/images/main/fcimg.jpg" alt="">
	                </div>
	
	                <div class="fCMent">
	                    <p>다이어트 꿀팁</p>
	                    <p>몸은 힘든데 오히려 살이 찐다?</p>
	                    <p>
	                        다이어트는 남녀를 불문하고 매년 새해 계획에서 빠지지 않는 사항이 됐다. 
	                        그만큼 한 번에 끝나는 것도 아니고, 설사 다이어트에 성공했다 해도 평생 
	                        그 상태를 유지하기란 힘들기 때문. 해마다 다이어트 계획을 세웠는데도 
	                        번번이 실패했다면 이번은 속다이어트를 시도해보면 어떨까?
	                    </p>
	                    <button class='tip' onclick='curPageFn(curTip)'>칼럼 보러가기</button>
	                </div>
	            </div>
	
	            <div class="secondContents">
	                <div class="sCImg">
	                    <img src="${path}/images/main/scimg.jpg" alt="">
	                </div>
	                <div class="sCMent">
	                    <p>칼로리 계산기</p>
	                    <p>오늘 내가 먹은 음식은 몇 Kacl일까?</p>
	                    <p>
	                        칼로리 계산기는 오늘 먹은 음식을 선택하면 자동으로 계산해주는
	                        편리한 기능입니다. 오늘 섭취한 칼로리를 알고싶다면 지금 바로 
	                        계산하고 운동하러 갑시다!
	                    </p>
	                    <button class='kcal' onclick='curPageFn(curKcal)'>계산하러 가기</button>
	                </div>
	            </div>
	
	            <div class="thirdContents">
	                <div class="tCImg">
	                    <img src="${path}/images/main/tcimg.jpg" alt="">
	                </div>
	                <div class="tCMent">
	                    <p>내 주변 시설</p>
	                    <p>내 주변 시설을 검색해 운동하자!</p>
	                    <p>
	                        내 주변 시설 검색기능은 회원님의 주소를 기준으로 반경 몇km 이내에
	                        공원, 수영장, 헬스장, 등등 운동시설 검색이 가능한 서비스입니다.
	                    </p>
	                    <button class='map' onclick='curPageFn(curMap)'>검색하러 가기</button>
	                </div>
	            </div>
	
	            <div class="fourthContents">
	                <div class="fourCImg">
	                    <img src="${path}/images/main/fourcimg.jpg" alt="">
	                </div>
	                <div class="fourCMent">
	                    <p>고객센터</p>
	                    <p>무엇이든 물어보살!</p>
	                    <p>
	                        회원님의 궁금증을 풀어드립니다. QnA 혹은 1:1 문의를 통한 답변
	                        궁금한게 있으시다면 문의를 남겨주세요!
	                    </p>
	                    <button class='cs' onclick='curPageFn(curNotice)'>문의하러 가기</button>
	                </div>
	            </div>
	
	            <div class="fiveContents">
	                <div class="fiveCImg">
	                    <img src="${path}/images/main/fivecimg.png" alt="">
	                </div>
	                <div class="fiveCMent">
	                    <p>커뮤니티</p>
	                    <p>운동인을 위한 커뮤니티!</p>
	                    <p>운동인들 모두 모여라 ~!</p>
	                    <p>나만 알고있던 꿀팁, 식단을 공유하고 운동 메이트를 구하기도 하고 잡담을 할 수 있는 운동인을 위한 커뮤니티입니다.</p>
	                    <button id='communityBtn'>커뮤니티 가기</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    <jsp:include page="footer.jsp"></jsp:include>
	</div>
    <script type="text/javascript">
	    let index = 0;
	
	    function slideShow() {
	        const mainImg = document.querySelector('mainImg');
	        let img = document.getElementsByClassName('imgSlide');
	        
	        for (i = 0; i < img.length; i++) {
	            img[i].style.display = 'none';
	            img[i].style.opacity = '0';             
	        }
	
	        index++;
	
	        if (index > img.length) {
	            index = 1;
	        }
	        img[index-1].style.display = 'block';
	        img[index-1].style.opacity = '1';
	
	        setTimeout(slideShow, 4000);
	    }
	    
	    slideShow();
        
	    /* $(function(){
			$('.tip').click(function() {
				location.href = '${path}/goTip?curPage=curTip';
			});
		}); */
    </script>
</body>
</html>