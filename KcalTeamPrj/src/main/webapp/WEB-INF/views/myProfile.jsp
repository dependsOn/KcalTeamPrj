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
	<link rel="stylesheet" type="text/css" href="${path}/css/myprofile.css">
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>


<title>Insert title here</title>
<style>
.defaultImg {
	background-Image: url('${path}/images/myprofile/default-profile.png')
}
</style>
</head>

<body>
<div id="wrapper">
	<jsp:include page="community_header.jsp"></jsp:include>

	<div id="profile">

		<div id="profileImg"
			<c:if test="${empty member.img_localname}">class="defaultImg"</c:if>
			<c:if test="${!empty member.img_localname}">style="background:url('${path}/images/myprofile/${member.img_servername}') no-repeat center center; background-size:contain;"
			 </c:if>></div>


		<div id="profileEx">
			<div>

				<div>
					<p id="usernick" style="display: inline-block;">${member.nickname}</p>
					
				    <c:if test="${sessionScope.account.nickname ne member.nickname}">
				    <span><i class="far fa-envelope" id="messageModal"></i></span> 
				    </c:if>
					<c:if test="${sessionScope.account.nickname eq member.nickname}">
					<span><i class="far fa-envelope" id="messageBtn"></i></span> 
					<span id="profileSet">
					<i class="fas fa-user-cog"></i>
					</span>
					</c:if>
					
				</div>
			</div>
			<div id="modalOverlay"></div>
			<div id="followDiv">
				<p class="followCnt" id="followerBtn">팔로워 ${followerCnt}</p>
				<p class="followCnt" id="followeeBtn">팔로우 ${followeeCnt}</p>
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
	<div id="gofollowDiv">
	
	<c:choose>
	<c:when test="${followcheck eq 'true' }">
	<button id="followDeleteBtn">팔로우 취소</button>
	</c:when>
	<c:when test="${followcheck eq 'false' }">
	<button id="followBtn">팔로우 하기</button>
	</c:when>
	<c:when test="${followcheck eq 'mine' }">
	
	</c:when>
	
	</c:choose>
	
	</div>
	</div>

	<div id="imageModal" class="modal">

		<c:if test="${empty member.img_localname}">
			<img src="${path}/images/myprofile/default-profile.png" alt="" />

		</c:if>
		<c:if test="${!empty member.img_localname}">
			<img src="${path}/images/myprofile/${member.img_servername}" alt="" />
		</c:if>
		<span class="closeBtn"><i class="fas fa-times"></i></span>


	</div>
	<div id="followerModal" class="modal">
		<h2 class="modalTitle">팔로워리스트</h2>
		<span class="closeBtn"><i class="fas fa-times"></i></span>
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
		<span class="closeBtn"><i class="fas fa-times"></i></span>
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
	<div id="profileModal" class="modal">
		<div id="profileDiv">
			<h2 class="modalTitle">프로필 설정</h2>
			<span class="closeBtn"><i class="fas fa-times"></i></span>
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
	
	<!-- 게시물 작성 div -->
		<div id="writeDiv">
			<h3 id="wpWrite">게시물 작성</h3>
			<h4 id="wpTitle">제목</h4>
			<input name="postTitle" id="postTitle" type="text" />
			
			<h4 id="contenth4">내용</h4>
			<textarea name="postContent" id="postContent" cols="120" rows="40"></textarea>
			
			<h4 id="wpYN">게시글 공개 여부</h4>
			<label for="post_isopenY">Yes</label><input type="radio"
				id="post_isopenY" name="post_isopen" value="Y" checked /> <label
				for="post_isopenN">No</label><input type="radio" name="post_isopen"
				id="post_isopenN" value="N" />
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
			<div id="postBtns">
			<button id="postSave">글 작성</button>
			<button id="postCancle">취소</button>
			</div>

		</div>
	
		
		
		<!-- 게시 -->
		<c:choose>
		<c:when test="${sessionScope.account.nickname ne member.nickname}">
		<section id="section1" class="main">
	<div id="section1Content">
	
	       
			
			
			
			<c:if test="${'N' eq member.p_isopen }">
				<p>비공개입니다.</p>

			</c:if>
			<c:if test="${'Y' eq member.p_isopen}">
				
					<ul id="userpostUl">
					</ul>

			</c:if>
			<div id="pageBox"></div>
</div>
	
		</section>
		</c:when>
		<c:when test="${sessionScope.account.nickname eq member.nickname}">
		<section id="section1" class="main">
		 <button id="modifyBtn">수정하기<i class="fas fa-cog"></i></button>
			<button id="writeBtn">글쓰기<i class="fas fa-pen"></i></button>
		<ul id="userpostUl">
					</ul>
			<div id="pageBox"></div>
		</section>
		
		</c:when>
		</c:choose>
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






	<jsp:include page="footer.jsp"></jsp:include>

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
          /* modal x버튼 */
			$(".closeBtn").click(function() {
				$("#modalOverlay").hide();
				$(".modal").hide();
				  /* $("#profileModal").load(window.location.href+' #profileModal');   */
				
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
/* 게시물 클릭 시 */
 $(document).on('click', '.userpostLi', function(){
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
					success: function(result){
 						if (result=="success") {
	                        /*   alert("팔로우가 삭제되었습니다.");
	   						location.reload(); */
	                      }else{
	                    	  alert("ERROR");
	                      }
					},
					error: function(){
						alert("stringify error");
					}
			})
			 

		});
         /* 페이징 처리 후 게시물 보여주기 */
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
		    		  if(data[0].pageCnt==0){
		    			  const li= document.createElement("li");
		    			  let title=document.createElement("h3");
		    			  title.setAttribute("class","nopost");
		    			  title.innerText="게시물이 없습니다."
		    			  li.append(title);
		    			  userpostUl.append(li);
		    		  }else{
		    			  
		    		  
		    			for(let item of data){             
		    				
		    				const li = document.createElement("li");
		    				let title = document.createElement("h3");
		    				let createdate = document.createElement("p");
		    				let flexWrap=document.createElement("div");
		    				let postThumbnail=document.createElement("div");
		    				let flexDiv=document.createElement("div");
		    				let contentTitle=document.createElement("h3")
		    				let content=document.createElement("p");
		    				let viewrec=document.createElement("p");
		    				let input=document.createElement("input");
		    				let deleteBtn=document.createElement("span");
		    				let modifyBtn=document.createElement("span");
		    				
		    				li.setAttribute("class","userpostLi");
		    				if(item.servername==null){
		    					 postThumbnail.setAttribute("style","background-Image:url('${path}/images/postfile/default-profile.png')");  
		    				}else{
		    					
		    					 postThumbnail.setAttribute("style","background-Image:url('${path}/images/postfile/"+item.servername+"')");  	    				
		                         				
		    				}
		    				
		    				postThumbnail.setAttribute("class","postThumbnail");
		    				
		    				
		    				title.innerText = item.title;
		    				var timestamp=item.createdate;
		    				var date = new Date(timestamp);
		    				deleteBtn.innerHTML = '<i class="far fa-trash-alt userControll" id="postDeleteBtn"></i>';
		    				modifyBtn.innerHTML = '<i class="fas fa-edit userControll" id="postModifyBtn"></i>';
			   		         createdate.innerText = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
			   		        contentTitle.innerText="게시물 내용";
			   		         content.innerText = item.content;
			   		         viewrec.innerText = "조회수 "+item.view_cnt+" 추천수 "+item.recommend;
			   		         
			   		        flexDiv.append(contentTitle);
			   		        flexDiv.append(content);
			   		        /* flexDiv.append(viewrec); */
			   		        flexWrap.append(postThumbnail);
			   		        flexWrap.append(flexDiv);
			   		        input.setAttribute("value",item.pnum);
			   		        input.setAttribute("style","display:none");
			   		      flexDiv.setAttribute("style","margin-left:40px; padding-top:10px"); 
			   		     flexWrap.setAttribute("style","display:flex; margin-left:20px");
			   		     title.setAttribute("style","margin:10px 5px 3px 20px");
			   		   viewrec.setAttribute("style","position:absolute; right:10px; bottom:10px"); 
			   		li.setAttribute("style","position:relative; z-index:2");
			   		createdate.setAttribute("class","createdate");
		    				
			   		      li.append(title);
			   		      li.append(createdate);
			   		      li.append(flexWrap);
			   		      li.append(viewrec);
			   		      li.append(deleteBtn);
			   		      li.append(modifyBtn);
			   		      /* input이 가장 마지막으로 append 해야함 */
			   		      li.append(input);
			   		   
			   		   userpostUl.append(li);
                              }
		    			
		    			 let prePage = document.createElement("span");
		   	        	 prePage.innerHTML = '<span class="leftBtn"><i class="fas fa-arrow-alt-circle-left pageBtn"></i></span>';
		   	        	 if(pageNum != 1) {
		   	        		prePage.setAttribute("class", "PrePage");
		   	        		prePage.setAttribute("data-num", pageNum-1);
		   	        	    
		   	        		
		   	        	 }
	   	        		 pageBox.append(prePage);
	   	        		 
		    			
		    			 let nextPage = document.createElement("span");
			   	        	nextPage.innerHTML = '<span class="rightBtn"><i class="fas fa-arrow-alt-circle-right pageBtn"></i></span>';
			   	        	 if(pageNum != data[0].pageCnt) {
			   	        		nextPage.setAttribute("class", "NextPage");
			   	        		nextPage.setAttribute("data-num", pageNum+1);
			   	        		
			   	        	 }
			   	        	pageBox.append(nextPage);
			   	        	
		    			 }
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
			 $("#modifyBtn").click(function(){
            	 $(".userControll").toggle();
				 
			 });
			
			 $("#followBtn").click(function(){
				 let followdata={"nickname":'${member.nickname}'}
				 
				 $.ajax({
						url:'${path}/follow/signupfollow',
						type:"POST",
						data: JSON.stringify(followdata),
						contentType:"application/json; charset=utf-8;",
						/* datatype: 'json' */
						success:function(result) {
		                      if (result=="success") {
		                          alert("팔로우 신청이 완료되었습니다.");
		   						location.reload();
		                      }else{
		                    	  alert("ERROR");
		                      }
						    
						},
						error: function(){
							alert("stringify error");
						}
			 });
			 });
             $("#followDeleteBtn").click(function(){

 				let deletefollow={
 						"follower_n":'${sessionScope.account.nickname}',
 						"followee_n":'${member.nickname}'
 						}
 				
 				
 				$.ajax({
 					url:'${path}/follow/deletefollow',
 					type:"POST",
 					data: JSON.stringify(deletefollow),
 					contentType:"application/json; charset=utf-8;",
 					/* datatype: 'json' */
 					success: function(result){
 						if (result=="success") {
	                          alert("팔로우가 삭제되었습니다.");
	   						location.reload();
	                      }else{
	                    	  alert("ERROR");
	                      }
 					    
 					},
 					error: function(){
 						alert("stringify error");
 					}
 			})
				 
			 });
             $("#messageBtn").click(function(){
				 
			 });
             $("#messageModal").click(function(){
				 
			 });
             
              $(document).on('click', '#postDeleteBtn', function(){
				 
			 });
		    		
		});
		
	</script>
</body>

</html>