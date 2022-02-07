<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/cs.css" />
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
					<button class="tabMenu" id="default"
						onclick="openCity(event, 'csFaq')">FAQ</button>
					<button class="tabMenu" onclick="openCity(event, 'csOne')">1:1문의</button>
				</div>

				<div id="csFaq" class="tabContent">

					<div>

						<ul class="faq">
							<li><input type="checkbox" id="faq-1"> <label
								for="faq-1">회원가입을 다른 소셜 계정으로 가입해도 될까요?</label>

								<div>
									<p>네 가능합니다.</p>
									<p>저희 '확찐자구조대'는 OO, OO, OO, 소셜계정으로도 가입합니다.</p>
								</div></li>

							<li><input type="checkbox" id="faq-2"> <label
								for="faq-2">비회원은 커뮤니티, 게시판 이용이 불가능 한가요?</label>

								<div>
									<p>죄송하지만 불가능합니다.</p>
									<p>커뮤니티, 게시판 안에서의 사건·사고 예방을 위하여 실명제를 하고 있습니다.</p>
									<p>불편하시겠지만 너그러운 이해 부탁드립니다.</p>

								</div></li>
							<li><input type="checkbox" id="faq-3"> <label
								for="faq-3">쪽지 내용이 불건전 하거나 보고싶지 않아요.</label>
								<div>
									<p>먼저 불편을 드려 죄송합니다.</p>
									<p>현재 쪽지함 내의 차단/신고 서비스는 준비 중에 있습니다.</p>
									<p>빠른 시일 내에 준비하도록 노력하겠습니다.</p>

								</div></li>
							<li><input type="checkbox" id="faq-4"> <label
								for="faq-4">프로필을 남에게 보여주고 싶지 않아요.</label>
								<div>
									<p>저희 '확찐자구조대'는 개인정보 혹은 사생활 보호를 위해 비공개 유무를 선택하실 수 있습니다.</p>
									<p>프로필 페이지 내의 '톱니바퀴' 모양을 눌러 설정 확인해주시면 감사드리겠습니다.</p>
								</div></li>
							<li><input type="checkbox" id="faq-5"> <label
								for="faq-5">1:1 문의는 어떤 방식으로 운영 되는건가요?</label>
								<div>
									<p>1:1 문의는 저희 쪽 cs업무실에서 처리는 하는 중 입니다.</p>
									<p>말 그대로 1:1 문의를 위해 많은 직원들이 처리 중에 있으며, 최대한 빠르게 문의에 답변을 드릴 수
										있도록 노력하는 '확찐짜구조대' 가 되겠습니다.</p>
								</div></li>
						</ul>
					</div>


				</div>



				<div id="csOne" class="tabContent">

					<div class="qna">


						<form action="${path}/cs/insertCsqna" method="POST"
							name="csqnaForm" id="csqnaForm">

							<input type="hidden" name="currentPage" value="1"
								id="currentPage" />
							<table>
								<thead>
								
									<th id="n1">닉네임</th>
									<th id="n1">제목</th>
									<th id="n1">내용</th>
								</thead>
								<tbody>
									<c:forEach var="result" items="${list}">
										<tr>
											<td>${result.nickname }</td>
											<td>${result.title }</td>
											<td>${result.contents }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<a href="#" onclick="fn_page(1)">1</a> 
							<a href="#" onclick="fn_page(2)">2</a>
							<a href="#" onclick="fn_page(3)">3</a>
							<a href="#" onclick="fn_page(4)">4</a>
							<a href="#" onclick="fn_page(5)">5</a>



							<table class="works_table" style="width: 100%;">

								<colgroup>
									<col style="width: 15%" />
									<col />
								</colgroup>

								<tbody>

									<tr
										style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
										<th style="text-align: center;">닉네임</th>
										<td>${result.input_nm }<input type="text" name="nickname"
											id="nickname" maxlength="150" style="width: 100%" /></td>
									</tr>

									<tr
										style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
										<th style="text-align: center;">비밀번호</th>
										<td><input type="password" name="password" id="password"
											maxlength="150" style="width: 100%" /></td>
									</tr>

									<tr
										style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
										<th style="text-align: center;">제목</th>
										<td><input type="text" name="title" id="title"
											value="${result.title}" maxlength="150" style="width: 100%" /></td>
									</tr>

									<tr
										style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
										<th style="text-align: center;">내용</th>
										<td><textarea type="text" name="contents" id="contents"
												maxlength="150" style="width: 100%; height: 200px;"></textarea></td>
									</tr>

									<tr>
										<td><input id="submit_button" type="submit" value="작성하기"
											onclick="fn_inputCs()" /></td>
									</tr>
								</tbody>

							</table>

						</form>
					</div>

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
	


  

		function fn_page(num) {
			var frm = document.csqnaForm;
			frm.currentPage.value = num;
			frm.method = "GET";
			frm.action = "${path}/cs/goCs";
			frm.submit();

		}

		function fn_inputCs() {
			$.ajax({
				url : "${path}/cs/insertCsqna",
				type : "POST",
				data : $("#csqnaForm").serialize(),
				success : function(data) {
					location.href = "${path}/cs/goCs";
				}
			})
		}
		
		
	/* 	function openCity(evt, openMenu) {
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
	
	    document.getElementById('default').click(); */ 
		
	</script>
	


</body>
</html>