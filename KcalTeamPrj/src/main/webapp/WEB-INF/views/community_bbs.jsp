<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${path}/css/community_bbs.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="community_header.jsp"></jsp:include>
	
	<div id="boardWrap">
		<div id="ad"></div>
		<div id="categoryTitle">자유게시판</div>
		<div id="bbsCon">
			<p>카테고리 안내 문구</p>
			<table id="bbs">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회</th>
							<th>추천</th>
						</tr>
					</thead>
					<tbody id="noticeList">
						
					</tbody>
					<tbody id="bbsList">
						
					</tbody>
				</table>
				<button type="button" id="create">글쓰기</button>
				<div id="pageBox">
				</div>
		</div>
		
	</div>
	
	
	<!-- 푸터 -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script type="text/javascript">
	$(function(){
		// 작성글 불러오는 함수
	    let getBBSList = function(category, pageNum){
	    	$("#bbsList").empty();
	    	$("#pageBox").empty();
	    	const bbsListCon = document.querySelector("#bbsList");
	    	const pageBox = document.querySelector("#pageBox");
	    	
	    	let data = {
	    			"category" : category,
	    			/* "unum" : ${sessionScope.account.unum}, */
	    			"pageNum" : pageNum
	    	}
	    	
	    	$.ajax({
	    		url: "${path}/bbs/bbsList",
	    		type: "POST",	
	    		data: data,
	            dataType : 'json',
	    		success: function(data) {
	    			
	    			if(data.postCnt != 0) {

		   	        	 for(let item of data.bbsList) {
		   		        	 const tr = document.createElement("tr");
		   		        	 let bnumTd = document.createElement("td");
		   		        	 let titleTd = document.createElement("td");
		   		        	 let ownerTd = document.createElement("td");
		   		        	 let dateTd = document.createElement("td");
		   		        	 let viewTd = document.createElement("td");
		   		        	 let recommendTd = document.createElement("td");
		   		        	 
		   		        	 titleTd.setAttribute('data-bnum', item.bnum);
		   		        	 
		   		        	 bnumTd.innerText = item.bnum;
		   		        	 titleTd.innerText = item.title;
		   		        	 ownerTd.innerText = item.nickname;
		   		        	 dateTd.innerText = item.createdate;
		   		        	 viewTd.innerText = item.viewCnt;
		   		        	 recommendTd.innerText = item.recommend;
		   		        	 
		   		        	 tr.append(bnumTd);
		   		        	 tr.append(titleTd);
		   		        	 tr.append(ownerTd);
		   		        	 tr.append(dateTd);
		   		        	 tr.append(viewTd);
		   		        	 tr.append(recommendTd);
		   	        		 
		   		        	 bbsList.append(tr);
		   	        	 }
		   	        	 
		   	        	 
		   	        	let preBlock = document.createElement("span");
		   	        	 preBlock.innerHTML = '<i class="fas fa-angle-double-left"></i>';
		   	        	 if(data.minBlock-1 >= 1) {
		   	        		preBlock.setAttribute("class", "PreBlock");
		   	        		preBlock.setAttribute("data-num", data.minBlock-1);
		   	        		preBlock.setAttribute("data-category", category);
		   	        	 }
	   	        		 pageBox.append(preBlock);
		   	        	 
		   	        	 let prePage = document.createElement("span");
		   	        	 prePage.innerHTML = '<i class="fas fa-angle-left"></i>';
		   	        	 if(data.pageNum != 1) {
		   	        		prePage.setAttribute("class", "PrePage");
		   	        		prePage.setAttribute("data-num", data.pageNum-1);
		   	        		prePage.setAttribute("data-category", category);
		   	        	 }
	   	        		 pageBox.append(prePage);
	   	        		 
	   	        		 let maxBlock = 0;
	   	        		 if(data.pageCnt < data.maxBlock) {
	   	        			 maxBlock = data.pageCnt;
	   	        		 }else {
	   	        			 maxBlock = data.maxBlock;
	   	        		 }
	   	        		
	   	        		 for(let i = data.minBlock; i <= maxBlock; i++) {
	   	        			 let page = document.createElement("span");
	   	        			 page.innerText = i;
	   	        			 page.setAttribute("class", "PageNum");
	   	        			 page.setAttribute("data-num", i);
	   	        			 page.setAttribute("data-category", category);
	   	        			 if(i == data.pageNum) {
	   	        				 page.style.fontWeight = "bold";
	   	        				 page.style.textDecoration = "underline";
	   	        				 page.style.color = "orangered";
	   	        			 } 
	   	        			pageBox.append(page);
	   	        		 }

	   	        		 let nextPage = document.createElement("span");
		   	        	nextPage.innerHTML = '<i class="fas fa-angle-right"></i>';
		   	        	 if(data.pageNum != data.pageCnt) {
		   	        		nextPage.setAttribute("class", "NextPage");
		   	        		nextPage.setAttribute("data-num", data.pageNum+1);
		   	        		nextPage.setAttribute("data-category", category);
		   	        	 }
		   	        	pageBox.append(nextPage);
	   	        		 
	   	        		let nextBlock = document.createElement("span");
	   	        		nextBlock.innerHTML = '<i class="fas fa-angle-double-right"></i>';
		   	        	 if(data.maxBlock < data.pageCnt) {
		   	        		nextBlock.setAttribute("class", "NextBlock");
		   	        		nextBlock.setAttribute("data-num", data.maxBlock+1);
		   	        		nextBlock.setAttribute("data-category", category);
		   	        	 }
		   	        	pageBox.append(nextBlock);
	    			}else {
	    				const tr = document.createElement("tr");
	    				const noneTd = document.createElement("td");
	    				noneTd.setAttribute("colspan", "6");
	    				noneTd.innerText = "글이 없습니다."; 
	    				noneTd.style.textAlign = "center";
	    				noneTd.style.height = "450px";
	    				
	    				tr.append(noneTd);
	    				bbsList.append(tr);
	    			}
		        		 
	    		},
	    		error: function(data) {
	    			alert("error");
	    		}
	    	})    	
	    }
			
		// 
		getBBSList("free", 1);
		$(".menuTab").removeClass("selected");
   	 	$(".menuTab[data-category='free']").addClass("selected");
		
		// 페이지 숫자 클릭
        $(document).on('click', '.PageNum', function(){
        	getBBSList($(this).data("category"), $(this).data("num"));
		})		
		// 페이지블럭 <<
		 $(document).on('click', '.PreBlock', function(){
			 getBBSList($(this).data("category"), $(this).data("num"));
		 })
		// 페이지블럭 <
		 $(document).on('click', '.PrePage', function(){
			 getBBSList($(this).data("category"), $(this).data("num"));
		 })
		// 페이지블럭 >
		 $(document).on('click', '.NextPage', function(){
			 getBBSList($(this).data("category"), $(this).data("num"));
		 })
		// 페이지블럭 >>
		 $(document).on('click', '.NextBlock', function(){
			 getBBSList($(this).data("category"), $(this).data("num"));
		 })	
		 
		 // 메뉴탭 클릭
         $(document).on('click', '.menuTab', function(){
        	 $(".menuTab").removeClass("selected");
        	 $(this).addClass("selected");
        	 
        	 let category = $(this).attr("data-category");
        	 if(category == "free") { $("#categoryTitle").text("자유게시판"); }
        	 else if(category == "question") { $("#categoryTitle").text("고민&질문"); }
        	 else if(category == "tip") { $("#categoryTitle").text("팁&노하우"); }
        	 else if(category == "review") { $("#categoryTitle").text("다이어트후기"); }
        	 else if(category == "emate") { $("#categoryTitle").text("운동메이트"); }
        	 
        	 getBBSList(category, 1);
         })
         
         $("#create").click(function(){
        	 alert("글쓰기버튼 클릭");
         })
			
	})
	
	
	</script>
</body>
</html>