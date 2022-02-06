<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>Insert title here</title>
<style>
body {
	width: 80%;
	margin: 0 auto;
}

#section2, #section3, #section4 {
	display: none;
}

.radioBtn {
	display: none;
}

ul {
	list-style: none;
}

#profile {
	display: flex;
}

#profileImg {
	width: 100px;
	height: 100px;
	border: 1px solid black;
	border-radius: 70%;
	margin-left: 10vw;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
}

.defaultImg {
	background-Image: url('${path}/images/myprofile/default-profile.png')
}

#followDiv {
	display: flex;
}

#profileEx {
	margin-left: 5vw;
}

#menuBar {
	display: flex;
	padding: 0;
	justify-content: space-between;
}

#menuBar li {
	width: 25%;
	text-align: center;
	border: 1px solid black;
}

.menuBarH3 {
	display: block;
	margin: 0;
	padding: 7% 0;
}

.main {
	width: 90%;
	margin: 0 auto;
	border: 1px solid black;
}

ul {
	list-style: none;
}

#modalOverlay {
	width: 100%;
	height: 100%;
	position: absolute;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	display: none;
	z-index: 2;
}

.modal {
	display: none;
	position: absolute;
	width: 400px;
	height: 200px;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -70%);
	border: 1px solid black;
	z-index: 200;
	background-color: white;
}

textarea {
	resize: none;
}

.modalTitle {
	text-align: center;
}

.hr {
	background-color: gray;
	width: 90%;
	height: 2px;
	margin: 0 auto;
}

.fa-times {
	position: absolute;
	top: 5%;
	right: 5%;
	font-size: 30px;
}

#profileDiv {
	width: 90%;
	margin: 0 auto;
}

#updateComment {
	width: 350px;
	margin: 0 auto;
}

#proImgPreview {
	width: 60px;
	height: 60px;
	border-radius: 70%;
	border: 1px solid black;
	display: inline-block;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
}

#profileImgSet {
	display: none;
}

#profileImgSetLB {
	border: 1px solid black;
}

#proImgDiv {
	
}

#userpostUl {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	padding: 0;
}

#userpostUl>li {
	border: 1px solid black;
	margin: 40px;
}

#imageModal {
	text-align: center;
	height: 700px;
	display: none;
	position: absolute;
	width: 400px;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -30%);
	border: 1px solid black;
	z-index: 200;
	background-color: white;
}

#imageModal>img {
	width: 350px;
	height: 500px;
	object-fit: contain;
}

#wrapper {
	position: relative;
}

#writeBtn {
	position: absolute;
	top: 2vh;
	right: 5vw;
}

#writeDiv {
	display: none;
	position: absolute;
	width: 100%;
	height: 900px;
	background-color: white;
	top: 0;
	left: 0;
}

.postImgDiv {
	width: 100px;
	height: 100px;
	border: 1px solid black;
	background: url('${path}/images/myprofile/default-profile.png');
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	margin-right: 15px;
}

.postfiles {
	display: none;
}

#postfileUl {
	display: flex;
}

#postThumbnailDf {
	width: 150px;
	height: 150px;
	border: 1px solid black;
	background: url('${path}/images/myprofile/default-profile.png');
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
}

#postThumbnail {
	width: 150px;
	height: 150px;
	border: 1px solid black;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
}

.followImg {
	width: 60px;
	height: 60px;
	border-radius: 70%;
	border: 1px solid black;
	display: inline-block;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
}

#followerModal, #followeeModal {
	height: 700px;
	overflow: scroll;
	transform: translate(-50%, -30%);
}

.displayNone {
	display: none;
}
</style>
</head>

<body>
	<header> 헤더 </header>

	<div id="profile">

		<div id="profileImg"
			<c:if test="${empty member.img_localname}">class="defaultImg"</c:if>
			<c:if test="${!empty member.img_localname}">style="background:url('${path}/images/myprofile/${member.img_servername}') no-repeat center center; background-size:contain;"
			 </c:if>></div>


		<div id="profileEx">
			<div>

				<div>
					<p style="display: inline-block;">${member.nickname}</p>
					<i class="far fa-envelope"></i> <i class="fas fa-user-cog"
						id="profileSet"></i>
				</div>
			</div>
			<div id="modalOverlay"></div>
			<div id="followDiv">
				<p id="followerBtn">팔로워 ${followerCnt}</p>
				<p id="followeeBtn">팔로우 ${followeeCnt}</p>
			</div>
			<div>
				<p>
					<c:if test="${null eq member.comment}">
                        자기소개가 없습니다.
                    </c:if>
					<c:if test="${null ne member.comment}">
                        ${member.comment}
                    </c:if>
				</p>
			</div>
		</div>

	</div>

	<div id="imageModal" class="modal">

		<c:if test="${empty member.img_localname}">
			<img src="${path}/images/myprofile/default-profile.png" alt="" />

		</c:if>
		<c:if test="${!empty member.img_localname}">
			<img src="${path}/images/myprofile/${member.img_servername}" alt="" />
		</c:if>
		<i class="fas fa-times"></i>


	</div>
	<div id="followerModal" class="modal">
		<h2 class="modalTitle">팔로워리스트</h2>
		<i class="fas fa-times"></i>
		<div class="hr"></div>
		<ul>
			<c:forEach var="item" items="${followerList}">
				<li><div
						<c:if test="${empty item.erimg_servername}">class="defaultImg followImg"</c:if>
						<c:if test="${!empty item.erimg_servername}">class="followImg" style="background-Image:url('${path}/images/myprofile/${item.erimg_servername}');"
			 </c:if>></div>

					<a href="main?nickname=${item.follower_n}">${item.follower_n}</a> <c:if
						test=""></c:if></li>
			</c:forEach>

		</ul>
	</div>
	<div id="followeeModal" class="modal">
		<h2 class="modalTitle">팔로우리스트</h2>
		<i class="fas fa-times"></i>
		<div class="hr"></div>
		<ul>
			<c:forEach var="item" items="${followeeList}">
				<li><div
						<c:if test="${empty item.eeimg_servername}">class="defaultImg followImg"</c:if>
						<c:if test="${!empty item.eeimg_servername}">class="followImg" style="background-Image:url('${path}/images/myprofile/${item.eeimg_servername}');"
			 </c:if>></div>
					<a href="main?nickname=${item.followee_n}">${item.followee_n}</a>
					<button id="followCancle">팔로우 취소</button> <input type="text"
					id=followerNick class="displayNone" value="${item.follower_n}" /> <input
					type="text" id=followeeNick class="displayNone"
					value="${item.followee_n}" /></li>
			</c:forEach>

		</ul>
	</div>
	<div id="profileModal" class="modal"
		style="height: 700px; transform: translate(-50%, -30%);">
		<div id="profileDiv">
			<h2 class="modalTitle">프로필 설정</h2>
			<i class="fas fa-times"></i>
			<div class="hr"></div>

			<h3>프로필 사진</h3>
			<div id="proImgDiv">
				<div id="proImgPreview"
					<c:if test="${empty member.img_localname}">class="defaultImg"</c:if>
					<c:if test="${!empty member.img_localname}">style="background:url('${path}/images/myprofile/${member.img_servername}') no-repeat center center; background-size:contain;"
			 </c:if>>
				</div>
				<label id="profileImgSetLB" for="profileImgSet">프로필 사진 변경</label> <input
					type="file" id="profileImgSet" name="profileImgSet" />
			</div>
			<h3>자기소개</h3>
			<textarea name="comment" id="comment" cols="40" rows="10">${member.comment}</textarea>
			<h3>공개 여부</h3>
			<div class="hr" style="width: 100%;"></div>
			<ul>
				<li>게시물 <input type="radio" name="p_isopen" id="ra_py"
					value="Y" <c:if test="${'Y' eq member.p_isopen}">checked</c:if>><label
					for="ra_py">공개</label> <input type="radio" name="p_isopen"
					id="ra_pn" value="N"
					<c:if test="${'N' eq member.p_isopen}">checked</c:if>><label
					for="ra_pn">비공개</label>
				</li>
				<li>식단기록 <input type="radio" name="d_isopen" id="ra_dy"
					value="Y" <c:if test="${'Y' eq member.d_isopen}">checked</c:if>><label
					for="ra_dy">공개</label> <input type="radio" name="d_isopen"
					id="ra_dn" value="N"
					<c:if test="${'N' eq member.d_isopen}">checked</c:if>><label
					for="ra_dn">비공개</label>
				</li>
				<li>인바디기록 <input type="radio" name="i_isopen" id="ra_iy"
					value="Y" <c:if test="${'Y' eq member.i_isopen}">checked</c:if>><label
					for="ra_iy">공개</label> <input type="radio" name="i_isopen"
					id="ra_in" value="N"
					<c:if test="${'N' eq member.i_isopen}">checked</c:if>><label
					for="ra_in">비공개</label>
				</li>
				<li>운동계획표 <input type="radio" name="e_isopen" id="ra_ey"
					value="Y" <c:if test="${'Y' eq member.e_isopen}">checked</c:if>><label
					for="ra_ey">공개</label> <input type="radio" name="e_isopen"
					id="ra_en" value="N"
					<c:if test="${'N' eq member.e_isopen}">checked</c:if>><label
					for="ra_en">비공개</label>
				</li>

			</ul>

			<button type="button" id="profileSetBtn">저장</button>
		</div>

	</div>


	<ul id="menuBar">
		<li id="menuBar1"><label for="menu1">
				<h3 class="menuBarH3">게시물</h3>
		</label><input class="radioBtn" type="radio" name="menu" id="menu1" value=1
			checked></li>
		<li id="menuBar2"><label for="menu2">
				<h3 class="menuBarH3">식단기록</h3>
		</label><input class="radioBtn" type="radio" name="menu" id="menu2" value=2></li>
		<li id="menuBar3"><label for="menu3">
				<h3 class="menuBarH3">인바디 기록</h3>
		</label><input class="radioBtn" type="radio" name="menu" id="menu3" value=3></li>
		<li id="menuBar4"><label for="menu4">
				<h3 class="menuBarH3">운동계획표</h3>
		</label><input class="radioBtn" type="radio" name="menu" id="menu4" value=4></li>
	</ul>
	<div id="wrapper">
		<!-- 게시물 작성 div -->
		<div id="writeDiv">
			<h3>게시물 작성</h3>
			<h4>제목</h4>
			<input name="postTitle" id="postTitle" type="text" />
			<h4>게시글 공개 여부</h4>
			<label for="post_isopenY">Yes</label><input type="radio"
				id="post_isopenY" name="post_isopen" value="Y" checked /> <label
				for="post_isopenN">No</label><input type="radio" name="post_isopen"
				id="post_isopenN" value="N" />
			<h4>내용</h4>
			<textarea name="postContent" id="postContent" cols="120" rows="40"></textarea>
			<p>사진 파일은 최대 3개까지 가능합니다.</p>
			<ul id="postfileUl">

				<li><label for="postfile1"><div id="postfile1Img"
							class="postImgDiv"></div></label><input type="file" class="postfiles"
					id="postfile1" /></li>
				<li><label for="postfile2"><div id="postfile2Img"
							class="postImgDiv"></div></label><input type="file" class="postfiles"
					id="postfile2" /></li>
				<li><label for="postfile3"><div id="postfile3Img"
							class="postImgDiv"></div></label><input type="file" class="postfiles"
					id="postfile3" /></li>
			</ul>
			<button id="postSave">글 작성</button>
			<button id="postCancle">취소</button>

		</div>
		<!-- 게시물 클릭 시 뷰 -->
		<div id="postDetail" class="displayNone">
			<h2 id="postTitleD"></h2>
			<p id="postDateD"></p>
			<div id="postImgD"></div>
			<p id="postContentD"></p>
			<div id="postVRD">
				<button id="listBtn">목록보기</button>
			</div>


		</div>
		<!-- 게시 -->
		<section id="section1" class="main">
			<button id="writeBtn">글쓰기</button>
			
			<ul id="userpostUl">
			
			</ul>
			<c:if test="${'N' eq member.p_isopen }">
				<p>비공개입니다.</p>

			</c:if>
			<c:if test="${'Y' eq member.p_isopen}">
				<c:if test="${empty userpostList}">
					<p>게시물이 없습니다.</p>
				</c:if>

				<c:if test="${null ne userpostList}">
					<ul id="userpostUl">
					</ul>
				</c:if>
			</c:if>
			<div id="pageBox"></div>


		</section>
		<section id="section2" class="main">

			<p>91022</p>
		</section>
		<section id="section3" class="main">
			<p>91022</p>
		</section>
		<section id="section4" class="main">
			<p>99199</p>
		</section>
	</div>






	<footer></footer>

	<script type="text/javascript">
		$(function() {
		
			$("input:radio[name=menu]").click(function() {
				let checkValue = $("input:radio[name=menu]:checked").val();
				$(".main").hide();
				$("#section" + checkValue).show();
				$("#writeDiv").hide();
				$("#postDetail").hide();

			});
			$("#profileImg").click(function(){
				$("#modalOverlay").show();
				$("#imageModal").show();
			});

			$("#followerBtn").click(function() {
				$("#modalOverlay").show();
				$("#followerModal").show();
			});

			$("#followeeBtn").click(function() {
				$("#modalOverlay").show();
				$("#followeeModal").show();
			});

			$("#profileSet").click(function() {
				$("#modalOverlay").show();
				$("#profileModal").show();
			});

			$(".fa-times").click(function() {
				$("#modalOverlay").hide();
				$(".modal").hide();
				$("#profileModal").load(location.reload());
				
			});
			$("#modalOverlay").click(function() {
				$("#modalOverlay").hide();
				$(".modal").hide();
			});
			
			/* 프로필 변경 */
			$("#profileImgSet").change(function(){
				readInputFile(this);
			});

			$("#profileSetBtn").click(function() {
				
                 let profileUpdate={
                	"nickname":'${member.nickname}',
                	"comment":$("#comment").val(),
                	"p_isopen":$("input:radio[name=p_isopen]:checked").val(),
                	"d_isopen":$("input:radio[name=d_isopen]:checked").val(),
                	"i_isopen":$("input:radio[name=i_isopen]:checked").val(),
                	"e_isopen":$("input:radio[name=e_isopen]:checked").val()
                	
                } 
                const profileImg =$("#profileImgSet");
                const formData = new FormData();
                let files=profileImg[0].files;
                console.log(files);
                formData.append("uploadFile",files[0]);
                formData.append('data', new Blob([ JSON.stringify(profileUpdate)], {type : "application/json"}));
				$.ajax({
					url :'${path}/profile/profileUpdate',
					processData : false,
					contentType : false,
					enctype : 'multipart/form-data',
					type: "POST",	
	        		/* data: JSON.stringify(profileUpdate), */
	              /*   contentType : 'application/json; charset=UTF-8', */
	                data : formData,
					success : function(result) {
						if(result == "success") {
							$("#modalOverlay").hide();
							$(".modal").hide();
							alert("프로필정보가 수정되었습니다.");
							location.reload();
						}
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("error");
					}
				});
                
			});
			
			
			
			function readInputFile(input){
				
				if(input.files && input.files[0]) { 
					var reader = new FileReader(); 
				reader.onload = function (e) { 
					
					$("#proImgPreview").css({"background-image":'url(\"'+e.target.result+'\")'}); 	
					} 
				
				reader.readAsDataURL(input.files[0]); 
				}

				
			}
			/*userpost 글쓰기 */
			$("#writeBtn").click(function(){
				$("#section1").hide();
				$("#writeDiv").show();
			});
			$("#postCancle").click(function(){
				$("#writeDiv").hide();
				$("#writeDiv").load(location.reload());
			});
			$(".postfiles").change(function(e){
				let id=e.target.getAttribute('id');
				 readPostInputFile(this,id); 
			});
function readPostInputFile(input, id){
				console.log(id);
				if(input.files && input.files[0]) { 
					var reader = new FileReader(); 
				reader.onload = function (e) { 
					
					$("#"+id+"Img").css({"background-image":'url(\"'+e.target.result+'\")'}); 	
					} 
				
				reader.readAsDataURL(input.files[0]); 
				}

				
			}
			/* 글 작성 버튼 */
			$("#postSave").click(function(){
				let userpost={
						"unum":'${member.unum}',
	                	"content":$("#postContent").val(),
	                	"title":$("#postTitle").val(),
	                	"isopen":$("input:radio[name=post_isopen]:checked").val(),
	                	
				}
				 const fileInput =$(".postfiles");
                const formData = new FormData();
                for (var i = 0; i < fileInput.length; i++) {
                	if (fileInput[i].files.length > 0) {
                		for (var j = 0; j < fileInput[i].files.length; j++) {           			
                			// formData에 'postfile'이라는 키값으로 fileInput 값을 append 시킨다.  
                			formData.append('postfiles', $('.postfiles')[i].files[j]);
                		}
                	}
                }
                formData.append('userpost', new Blob([ JSON.stringify(userpost)], {type : "application/json"}));
			    
                $.ajax({
                    url: '${path}/post/userpost',
                    data: formData,
                    contentType: false,               
                    processData: false,  
                    type: "POST",
                    enctype : 'multipart/form-data',  
                    success: function(result) {
                      if (result=="success") {
                       alert("게시물이 작성되었습니다.");
						location.reload();
                      } else {
                       alert("실패");
                       }
                    }
              });
			
			
			
			
			});
			
			/* 게시물 클릭 시 */
			$(".userpostDiv").click(function(){
				$("#postImgD").empty();
				$("#postDetail").show();
				$("#section1").hide();
				let pnumval=$(this).children().last().val();
				let pnum={"pnum":pnumval};
				$.ajax({
					url:'${path}/post/userpostView',
					type:"POST",
					data: JSON.stringify(pnum),
					contentType:"application/json; charset=utf-8;",
					/* datatype: 'json' */
					success: function(data){
						
						$("#postTitleD").html(data.title);
				        $("#postDateD").html(data.createdate);
				        $("#postContentD").html(data.content);
				     
						$.ajax({
							url:'${path}/post/userpostViewImg',
							type:"POST",
							data: JSON.stringify(pnum),
							contentType:"application/json; charset=utf-8;",
							
							success: function(data){
								
								$(data).each(function(){
									
									$("#postImgD").append("<img src='${path}/images/postfile/"+this.servername+"'></img>");
									});
							},
							error: function(){
								alert("stringify error");
							}
						});
					},
					error: function(){
						alert("stringify error");
					}
				});
			});
			$("#listBtn").click(function(){
				$("#postDetail").hide();
				$("#section1").show();
			});
			
			/* 팔로우 취소 */
			$("#followCancle").click(function(){
				
				
				let deletefollow={
						"followee_n":$(this).siblings().last().val(),
						"follower_n":$(this).siblings().last().prev().val()
						}
				$(this).parent().remove();
				
				$.ajax({
					url:'${path}/follow/deletefollow',
					type:"POST",
					data: JSON.stringify(deletefollow),
					contentType:"application/json; charset=utf-8;",
					/* datatype: 'json' */
					success: function(){
					    
					},
					error: function(){
						alert("stringify error");
					}
			})
			 

		});
        
			let getuserpostList=function(pageNum){
				$("#userpostUl").empty();
				
				const userpostUl = $("#userpostUl");
				const pageBox=$("#pageBox");
				userpostUl.empty();
				pageBox.empty();
				let data={"pageNum" : pageNum,
						  "count" : 8,
						  "nickname":'${member.nickname}'
				}
				$.ajax({
		    		url: "${path}/pofile/getuserpostList",
		    		type: "POST",	
		    		data: data,
		            dataType : 'json',
		    		success: function(data) {
		    		
		    			for(let item of data){             
		    				
		    				const li = document.createElement("li");
		    				
		    				let title=document.createElement("h3");
		    				let createdate=document.createElement("p");
		    				let postThumbnail=document.createElement("div");
		    				let content=document.createElement("p");
		    				let viewrec=document.createElement("p");
		    				
		    				
		    				 title.innerText = item.title;
			   		         createdate.innerText = item.createdate;
			   		         postThumbnail.innerText = item.servername;
			   		         content.innerText = item.content;
			   		         viewrec.innerText = "조회수 "+item.view_cnt+"추천수 "+item.recommend;
		    				
			   		      li.append(title);
			   		      li.append(createdate);
			   		      li.append(postThumbnail);
			   		      li.append(content);
			   		      li.append(viewrec);
			   		   userpostUl.append(li);
                              }
		    			
		    			 let prePage = document.createElement("span");
		   	        	 prePage.innerHTML = '<i class="fas fa-chevron-left"></i>';
		   	        	 if(pageNum != 1) {
		   	        		prePage.setAttribute("class", "PrePage");
		   	        		prePage.setAttribute("data-num", pageNum-1);
		   	        	    
		   	        		
		   	        	 }
	   	        		 pageBox.append(prePage);
		    			
		    			 let nextPage = document.createElement("span");
			   	        	nextPage.innerHTML = '<i class="fas fa-chevron-right"></i>';
			   	        	 if(pageNum != data[0].pageCnt) {
			   	        		nextPage.setAttribute("class", "NextPage");
			   	        		nextPage.setAttribute("data-num", pageNum+1);
			   	        		
			   	        	 }
			   	        	pageBox.append(nextPage);
		    			 },
		    		
					error: function(){
						alert("stringify error");
					}
                })
                }
			// 페이지블럭 <
			 $(document).on('click', '.PrePage', function(){
				 getuserpostList($(this).data("num"));
			 })
			// 페이지블럭 >
			 $(document).on('click', '.NextPage', function(){
				 getuserpostList($(this).data("num"));
			 })
			
			getuserpostList(1);
			
		    		
		});
	</script>
</body>

</html>