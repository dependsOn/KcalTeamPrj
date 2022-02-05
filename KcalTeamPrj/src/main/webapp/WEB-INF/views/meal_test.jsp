<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/meal_test.css"/>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<button id="getMeal">식단</button>
	<div id="content">
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("#getMeal").click(function(){
				const content = $("#content");
				content.empty();
				
				$.ajax({
		        	url: "${path}/kcal/mealList",
		        	type: "POST",	
		        	data: { "unum" : 1 },
		        	success: function(data) {
	        			let mealList = new Array();
	        			
		        		for(let item of data) {
		        			console.log(item.date);
		        			console.log(item.time);
		        			console.log(item.mealnum);
		        			console.log(item.menu);
		        			console.log(item.intake + "g");
		        			console.log(item.kcal + "kcal");
		        			
		        			let dateIndex = mealList.findIndex(i => i.date == item.date);
		        					        			
		        			if(dateIndex == -1) {
		        				let oneday = new Object();
		        				oneday.date = item.date;	
		        				let mealcards = new Array();
		        				oneday.mealcards = mealcards;
		        				oneday.todayKcal = 0;
		        				
		        				
		        				oneday = JSON.stringify(oneday)
		        				mealList.push(JSON.parse(oneday));
		        				
		        				dateIndex = mealList.findIndex(i => i.date == item.date);
		        				
		        				mealList[dateIndex].todayKcal += item.kcal;
		        			}else {
		        				mealList[dateIndex].todayKcal += item.kcal;
		        			}

		        			let cardIndex = mealList[dateIndex].mealcards.findIndex(i => i.mealnum == item.mealnum);
		        			if(cardIndex == -1) {
		        				let mealcard = new Object();
		        				mealcard.mealnum = item.mealnum;
		        				mealcard.time = item.time;
		        				let mealinfo = new Array();
		        				mealcard.mealinfo = mealinfo;
		        				mealcard.totalKcal = 0;
		        				
		        				mealcard = JSON.stringify(mealcard);
		        				mealList[dateIndex].mealcards.push(JSON.parse(mealcard));
		        				
		        				cardIndex = mealList[dateIndex].mealcards.findIndex(i => i.mealnum == item.mealnum);

		        				mealList[dateIndex].mealcards[cardIndex].totalKcal += item.kcal;
		        			}else {
		        				mealList[dateIndex].mealcards[cardIndex].totalKcal += item.kcal;
		        			}
		        			
		        			let mealinfo = new Object();
		        			mealinfo.menu = item.menu;
		        			mealinfo.intake = item.intake;
		        			mealinfo.kcal = item.kcal;
		        			
		        			mealinfo = JSON.stringify(mealinfo);
		        			mealList[dateIndex].mealcards[cardIndex].mealinfo.push(JSON.parse(mealinfo));
		        		}
		        		
		        		for(dateIndex in mealList) {
		        			let dayBox = document.createElement("div");
		        			dayBox.className = 'dayBox';
		        			
		        			let dayTop = document.createElement("div");
		        			dayTop.className = 'dayTop';
		        			let mealDate = document.createElement("span");
		        			mealDate.className = 'mealDate';
		        			mealDate.innerText = mealList[dateIndex].date;
		        			let todayKcal = document.createElement("span");
		        			todayKcal.className = 'todayKcal';
		        			todayKcal.innerText = '하루 총 섭취 열량  ' + mealList[dateIndex].todayKcal + 'kcal';
		        			
		        			dayTop.append(mealDate);
		        			dayTop.append(todayKcal);
		        			dayBox.append(dayTop);
		        			
		        			let mealcards = document.createElement("div");
		        			mealcards.className = 'mealcards'
		        			
		        			for(cardIndex in mealList[dateIndex].mealcards) {
		        				let mealcard = document.createElement("div");
		        				mealcard.className = 'mealcard';
		        				
		        				let mealtime = document.createElement("span");
		        				mealtime.className = 'mealtime';
		        				mealtime.innerText = '식사 시간 ' + mealList[dateIndex].mealcards[cardIndex].time;
		        				let totalKcal = document.createElement("span");
		        				totalKcal.className = 'totalKcal';
		        				totalKcal.innerText = '총 열량 ' + mealList[dateIndex].mealcards[cardIndex].totalKcal + "kcal";
		        				
		        				let menuList = document.createElement("div");
		        				menuList.className = 'menuList';
		        				let table = document.createElement("table");		        				
		        				for(menuIndex in mealList[dateIndex].mealcards[cardIndex].mealinfo) {
		        					let tr = document.createElement("tr");
		        					let menuTd = document.createElement("td");
		        					menuTd.innerText = mealList[dateIndex].mealcards[cardIndex].mealinfo[menuIndex].menu;
		        					let intakeTd = document.createElement("td");
		        					intakeTd.innerText = mealList[dateIndex].mealcards[cardIndex].mealinfo[menuIndex].intake + "g";
		        					let kcalTd = document.createElement("td");
		        					kcalTd.innerText = mealList[dateIndex].mealcards[cardIndex].mealinfo[menuIndex].kcal + "kcal";
		        					
		        					tr.append(menuTd);
		        					tr.append(intakeTd);
		        					tr.append(kcalTd);
		        					
		        					table.append(tr);
		        					menuList.append(table);
		        				}
		        				
		        				mealcard.append(mealtime);	
		        				mealcard.append(menuList);
		        				mealcard.append(totalKcal);
		        				mealcards.append(mealcard);
		        				dayBox.append(mealcards);
		        			}
		        			
		        			content.append(dayBox);
		        		}
		        		
		        	},
		        	error: function(data) {
		        		alert("error");	
		        	}
				})
			})
		})
		
		
	</script>
</body>
</html>