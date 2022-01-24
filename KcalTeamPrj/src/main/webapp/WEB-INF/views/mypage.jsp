<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/css/mypage.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div id="mypageWrap">
		<ul class="tabs">
			<li class="tabTitle">회원정보관리</li>
			<li class="tab" data-tab="memberInfo">회원정보</li>
			<li class="tab" data-tab="modifyPw">비밀번호변경</li>
			<li class="tab" data-tab="withdraw">회원탈퇴</li>
			<li class="tabTitle">내 활동관리</li>
			<li class="tab" data-tab="letter">쪽지함</li>
			<li class="tab" data-tab="myPost">작성글</li>
			<li class="tab" data-tab="myComments">작성댓글</li>
			<li class="tab" data-tab="myTips">찜한 꿀팁</li>
			<li class="tab" data-tab="myAsk">1:1 문의내역</li>
		</ul>

		<div class="contents">
			<div id="memberInfo" class="content memberCon">
				<span class="subTitle">회원정보</span>
				<table>
					<tr>
						<th>아이디</th>
						<td>${sessionScope.account.id}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password" class="password">
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>${sessionScope.account.nickname}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" value="${sessionScope.account.email}"
							name="email" class="email" required>
							<p class="emailCheckResult"></p> <input type="hidden"
							class="isPossible" value="possible" /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" value="${sessionScope.account.addr1}"
							class="addr addr1" name="addr1" readonly>
							<button type="button" class="findAddr">주소검색</button>
							<br /> <input type="text" value="${sessionScope.account.addr2}"
							class="addr addr2" name="addr2" readonly><br> <input
							type="text" value="${sessionScope.account.addr3}"
							class="addr addr3" name="addr3" required></td>
					</tr>
				</table>
				<button type="button" class="modifyMember">회원정보 수정</button>
			</div>

			<div id="modifyPw" class="content memberCon">
				<span class="subTitle">비밀번호변경</span>
				<ul>
					<li><span>아이디</span> <span>${sessionScope.account.id}</span></li>
					<li><span>현재 비밀번호</span> <input type="password"
						class="currentPw" required></li>
					<li><span>새 비밀번호</span> <input type="password" class="newPw"
						required></li>
					<li><span>새 비밀번호 확인</span> <input type="password"
						class="newPwConfirm" required></li>
					<li><button type="button" class="modifyPw">변경</button></li>
				</ul>
			</div>

			<div id="withdraw" class="content memberCon">
				<span class="subTitle">회원탈퇴</span>
				<ul>
					<li class="wdNotice">※ 탈퇴 후 복구가 불가능합니다.</li>
					<li><span>아이디</span> <span>${sessionScope.account.id}</span></li>
					<li><span>비밀번호</span> <input type="password"
						class="wdPassword" required></li>
					<li><span>회원탈퇴 입력</span> <input type="text"
						class="confirmWord" placeholder="'회원탈퇴'를 입력해주세요." required>
					</li>
					<li><button type="button" class="withdraw">탈퇴하기</button></li>
				</ul>
			</div>

			<div id="letter" class="content">
				<ul class="letterTabs">
					<li class="ltab" data-tab="receive">받은 쪽지</li>
					<li class="ltab" data-tab="send">보낸 쪽지</li>
				</ul>
				<div class="lcon receive" id="receive"></div>
				<div class="lcon send" id="send"></div>
			</div>

			<div id="myPost" class="content"></div>

			<div id="myComments" class="content"></div>

			<div id="myTips" class="content"></div>

			<div id="myAsk" class="content"></div>
		</div>
	</div>

	<script type="text/javascript">
		$(function(){
			$(".tab[data-tab='${currTab}']").addClass("selected");
            $("#${currTab}").addClass("selected");
			
	        // 사이드메뉴 클릭시  
	        $(".tabs .tab").click(function(){
	        	
	            let tabId = $(this).attr("data-tab");
	
	            $(".tabs .tab").removeClass("selected");
	            $(".content").removeClass("selected");
	
	            $(this).addClass("selected");
	            $("#"+tabId).addClass("selected");
	        });
	        
	       
	        
	        // 쪽지리스트 부르는 함수
	        let getLetter = function(rnum, snum){
	        	$.ajax({
		        	url: "${path}/letter/letterList",
		        	type: "GET",	
		        	dataType : "text",
		        	data: { "nickname" : "${sessionScope.account.nickname}",
		        			"rnum" : rnum,
		        			"snum" : snum
		        	},
		        	success: function(result) {		        		
		        		let html = jQuery('<div>').html(result);
		        		let rl = html.find("div#rl").html(); 
		        		let sl = html.find("div#sl").html(); 
		        		$("#receive").html(rl);
		        		$("#send").html(sl);
		        	},
		        	error: function(result) {
		        		alert("error");
		        	}
		        })
	        }
	        
	     // 쪽지함 클릭
	        $(".tab[data-tab='letter']").click(function(){
	        	$(".letterTabs .ltab").removeClass("selected");
	            $(".lcon").removeClass("selected");
	            
	            $(".ltab[data-tab='receive']").addClass("selected");
	            $("#receive").addClass("selected");
		        
		        getLetter(1,1);
	        });
	        
	            
	        
	       // 받은쪽지함 페이징 
	        $(document).on('click', '#r_preBlock', function(){ 
	        	rminBlock = parseInt($("#r_minBlock").val());
	        	rnum = rminBlock-1; 
	        	getLetter(rnum, 1);
	        })
	        $(document).on('click', '#r_pre', function(){ 
	        	rnum = parseInt($(".r_currPage").text())-1;
	        	getLetter(rnum, 1);
	        })
	        $(document).on('click', '.r_page', function(){ 
	        	rnum = $(this).text();	        	
	        	getLetter(rnum, 1);
	        })
	        $(document).on('click', '#r_next', function(){ 
	        	rnum = parseInt($(".r_currPage").text())+1;
	        	getLetter(rnum, 1);
	        })
	        $(document).on('click', '#r_nextBlock', function(){ 
	        	rmaxBlock = parseInt($("#r_maxBlock").val());
	        	rnum = rmaxBlock+1; 
	        	getLetter(rnum, 1);
	        })
	        
	        // 보낸쪽지함 페이징
	        $(document).on('click', '#s_preBlock', function(){ 
	        	sminBlock = parseInt($("#s_minBlock").val());
	        	snum = sminBlock-1; 
	        	getLetter(1, snum);
	        })
	        $(document).on('click', '#s_pre', function(){ 
	        	snum = parseInt($(".s_currPage").text())-1;
	        	getLetter(1, snum);
	        })
	        $(document).on('click', '.s_page', function(){ 
	        	snum = $(this).text();	        	
	        	getLetter(1, snum);
	        })
	        $(document).on('click', '#s_next', function(){ 
	        	snum = parseInt($(".s_currPage").text())+1;
	        	getLetter(1, snum);
	        })
	        $(document).on('click', '#s_nextBlock', function(){ 
	        	smaxBlock = parseInt($("#s_maxBlock").val());
	        	snum = smaxBlock+1; 
	        	getLetter(1, snum);
	        })
	        
	        // 쪽지 하위탭	        
	        $(document).on('click', '.letterTabs .ltab', function(){
	        	let tabId = $(this).attr("data-tab");
	        	
	        	$(".letterTabs .ltab").removeClass("selected");
	            $(".lcon").removeClass("selected");
	            
	            $(this).addClass("selected");
	            $("#"+tabId).addClass("selected");
	            
	            getLetter(1,1);	            
	        });
	       
	       // 체크한 쪽지 삭제
	       $(document).on('click', '.letterDelete', function(){
	    	   let chkLetter = [];
	    	   $('input[name="delete"]:checked').each(function(){
	               chkLetter.push($(this).val());
	           });

	    	   if(chkLetter.length == 0) {
	    		   alert("선택한 쪽지가 없습니다.");
	    	   }else {
		    	   let ldConfirm = confirm("선택한 쪽지를 삭제하시겠습니까?");
		    	   if(ldConfirm) {
		    		   $.ajax({
			    		   url: "${path}/letter/deleteLetter",	
			    		   traditional: true,
		                   type:   "POST",
		                   data: { "deleteLetterList" : chkLetter },
		                   success: function(data){
		                	   getLetter(parseInt($(".r_currPage").text()), parseInt($(".s_currPage").text()));
		                	   alert("선택한 쪽지 " + data + "개가 삭제되었습니다.");
		                   },
		                   error: function(data) {
		                	   alert("error");
		                   }
			    	   })
	    	   		}
		       }   
	       })
	       
	       // 쪽지 제목 클릭시 쪽지 보기
	       $(document).on('click', '.letterTitle', function(){
	    	   let lnum = parseInt($(this).attr("data-lnum"));
	    	   
	    	   
	    	   $.ajax({
	    		   url: "${path}/letter/letterDetail",	
	    		   traditional: true,
                   type:   "POST",
                   data: { "lnum" : lnum },
                   success: function(result){
                	   /* let letterUrl = "${path}/letter/openLetter";
        	    	   let popOption = "width=600, height=800, resizable=no";
                	   window.open(letterUrl, "쪽지", popOption); */
                   },
                   error: function(result) {
                	   alert("error");
                   }
	    	   })
	       })
	        
	        
	        
	
	        // 주소검색 클릭시 주소찾기 팝업
	        $(".findAddr").click(function() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    $(".addr1").val(data.zonecode);
	                    $(".addr2").val(data.roadAddress);
	                }
	            }).open();
	        });
	        
	        // 이메일 중복 실시간 확인
	        $(".email").on("keyup", function(){
	        	let email = $(".email").val();
	        	
	        	if(email == "") {
	        		$(".emailCheckResult").text("이메일을 입력해주세요.");
	        		$(".emailCheckResult").css("color", "red");
	        	}else {
		        	$.ajax({
		        		url: "${path}/member/checkEmail",
		        		type: "POST",
		        		data: {
		        			"email" : email,
		        			"id" : "${sessionScope.account.id}"
		        		},	        		
		        		success: function(data) {
		        			if(data == "possible") {
		        				$(".emailCheckResult").text("사용가능한 이메일입니다.");
		        				$(".emailCheckResult").css("color", "blue");
		        				$(".isPossible").val(data);
		        			}else {
		        				$(".emailCheckResult").text("이미 사용중인 이메일입니다.");
		        				$(".emailCheckResult").css("color", "red");
		        				$(".isPossible").val(data);
		        			}
		        		}
		        	})	        		
	        	}	        	
	        });	                
	        
	        // 회원정보수정
	        $(".modifyMember").click(function(){	
	        	let data = {
	        			"unum" : ${sessionScope.account.unum},
	        			"email" : $(".email").val(),
	        			"addr1" : $(".addr1").val(),
	        			"addr2" : $(".addr2").val(),
	        			"addr3" : $(".addr3").val()
	        			}	
	        	
	        	if($(".addr3").val() == "") {
	        		alert("상세주소를 입력해주세요.");
	        	}else if(($(".isPossible").val() == "impossible") || ($(".email").val() == "")) {
	        		alert("이메일 입력란을 확인해주세요.");
	        	}else if($(".password").val() != ${sessionScope.account.password}) {
	        		alert("비밀번호가 일치하지 않습니다.");
	        	}else {
	        		$.ajax({
		        		url: "${path}/member/updateMember",
		        		type: "POST",	
		        		data: JSON.stringify(data),
		                dataType : 'json',
		                contentType : 'application/json; charset=UTF-8',
		        		success: function(data) {
		        			location.href = "${path}/member/mypage?currTab=memberInfo";
		        			
		        			alert("회원정보가 수정되었습니다.");
		        		},
		        		error: function(data) {
		        			alert("error");
		        		}
		        	})
	        	}
	        })
	        
	        // 비밀번호 수정
	        $(".modifyPw").click(function(){
	        	let data = {
	        			"unum" : ${sessionScope.account.unum},
	        			"password" : $(".newPw").val()
	        			}
	        	
	        	if($(".currentPw").val() != ${sessionScope.account.password}) {
	        		alert("현재 비밀번호가 회원정보와 일치하지 않습니다.");
	        	}else if(($(".newPw").val() == "") || ($(".newPwConfirm").val() == "") || ($(".newPw").val() != $(".newPwConfirm").val())) {
	        		alert("새 비밀번호가 일치하지 않습니다.")	;
	        	}else {
	        		$.ajax({
		        		url: "${path}/member/updateMember",
		        		type: "POST",	
		        		data: JSON.stringify(data),
		                contentType : 'application/json; charset=UTF-8',
		                dataType : 'json',
		        		success: function(data) {
		        			location.href = "${path}/member/mypage?currTab=modifyPw";
		        			
		        			alert("비밀번호가 수정되었습니다.");
		        		},
		        		error: function(data) {
		        			alert("error");
		        		}
		        	})
	        	}
	        })
	        
	        // 회원탈퇴	        
	        $(".withdraw").click(function(){
	        	if($(".wdPassword").val() != ${sessionScope.account.password}) {
	        		alert("비밀번호가 일치하지 않습니다.");
	        	}else if($(".confirmWord").val() != "회원탈퇴") {
	        		alert("탈퇴문구를 정확히 입력하세요.");
	        	}else {
	        		let result = confirm("탈퇴하시겠습니까?");
	        		if(result) {      			
		        		location.href = "${path}/member/deleteMember";	        			
	        		}
	        	}
	        })
	    })
	</script>




</body>
</html>