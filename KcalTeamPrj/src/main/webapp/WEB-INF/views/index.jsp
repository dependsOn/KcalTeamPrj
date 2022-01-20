<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/default.css" />
	<link rel="stylesheet" href="css/index.css" />
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
    <header>
        <div class="logo">
            <img src="images/logoImg/logo.png" alt="">
            <ul>
                <li>확찐자구조대</li>
            </ul> 
            
        </div>
        <div class="menuCenter">
            <ul>
                <li>다이어트 꿀팁</li>
                <li>칼로리 계산기</li>
                <li>내 주변 시설</li>
                <li>공지사항</li>
                <li>고객센터</li>
            </ul>
        </div>
        <div class="menuRight">
            <ul>
                <li><button class="rightBtn admin">관리자 페이지</button></li>
                <li><button class="rightBtn community">커뮤니티</button></li>
            </ul>
            <ul>
                <li>회원가입</li>
                <li id="login">로그인</li>
            </ul>
        </div>
    </header>
    <div class="main">
        <div class="mainImgBox">
            <div class="mainImg">
                <img id="mainImgSlide" src="images/main/main1.jpg" alt="">
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
                    <img src="images/main/fcimg.jpg" alt="">
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
                    <button>칼럼 보러가기</button>
                </div>
            </div>

            <div class="secondContents">
                <div class="sCImg">
                    <img src="images/main/scimg.jpg" alt="">
                </div>
                <div class="sCMent">
                    <p>칼로리 계산기</p>
                    <p>오늘 내가 먹은 음식은 몇 Kacl일까?</p>
                    <p>
                        칼로리 계산기는 오늘 먹은 음식을 선택하면 자동으로 계산해주는
                        편리한 기능입니다. 오늘 섭취한 칼로리를 알고싶다면 지금 바로 
                        계산하고 운동하러 갑시다!
                    </p>
                    <button>계산하러 가기</button>
                </div>
            </div>

            <div class="thirdContents">
                <div class="tCImg">
                    <img src="images/main/tcimg.jpg" alt="">
                </div>
                <div class="tCMent">
                    <p>내 주변 시설</p>
                    <p>내 주변 시설을 검색해 운동하자!</p>
                    <p>
                        내 주변 시설 검색기능은 회원님의 주소를 기준으로 반경 몇km 이내에
                        공원, 수영장, 헬스장, 등등 운동시설 검색이 가능한 서비스입니다.
                    </p>
                    <button>검색하러 가기</button>
                </div>
            </div>

            <div class="fourthContents">
                <div class="fourCImg">
                    <img src="images/main/fourcimg.jpg" alt="">
                </div>
                <div class="fourCMent">
                    <p>고객센터</p>
                    <p>무엇이든 물어보살!</p>
                    <p>
                        회원님의 궁금증을 풀어드립니다. QnA 혹은 1:1 문의를 통한 답변
                        궁금한게 있으시다면 문의를 남겨주세요!
                    </p>
                    <button>문의하러 가기</button>
                </div>
            </div>

            <div class="fiveContents">
                <div class="fiveCImg">
                    <img src="images/main/fivecimg.png" alt="">
                </div>
                <div class="fiveCMent">
                    <p>커뮤니티</p>
                    <p>운동인을 위한 커뮤니티!</p>
                    <p>운동인들 모두 모여라 ~!</p>
                    <p>나만 알고있던 꿀팁, 식단을 공유하고 운동 메이트를 구하기도 하고 잡담을 할 수 있는 운동인을 위한 커뮤니티입니다.</p>
                    <button>커뮤니티 가기</button>
                </div>
            </div>
        </div>

        <footer>
            
        </footer>
    </div>
</div>
    <script type="text/javascript">
	    document.getElementById('login').addEventListener('click', function() {
	        location.href = '${path}/member/login'
	    });
	   
        const imgSlide = document.getElementById('mainImgSlide');
        let imgArray = ['main1.jpg', 'main2.jpg', 'main3.jpg', 'main4.jpg'];
        let imgIndex = 0;

        function imgShow() {
            imgSlide.setAttribute('src', 'images/main/' + imgArray[imgIndex]);
            imgIndex++;
            if (imgIndex >= imgArray.length) {
                imgIndex = 0;
            }
        }

        setInterval(imgShow, 2000);
    </script>
</body>
</html>