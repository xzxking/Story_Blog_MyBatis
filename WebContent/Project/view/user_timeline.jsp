<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>Story Blog - User</title>
</head>
<body>
<!-- 전체 틀 div ★ -->  
<div>&nbsp;

<!-- 타임라인 (이페이지에서는 사진 X) -->
<div style="margin-top:54px; margin-left: 10%;"><br>
	<!-- <div class="w3-col m8 w3-row" style="margin-left: 22%; margin-top: 5%; margin-bottom: 3%;"> -->

<!-- 타임라인 margin -->
<div style="margin-left: 10%; margin-right: 10%;">

		<!-- 하루의 끝 - form 전송 -->
		<form action="<%=request.getContextPath() %>/story/user_write" method="post">
				
			<!-- 하루의 끝 -->
			<div class="w3-row-padding">
				<div class="w3-col m12">
					<div class="w3-card w3-round w3-white">
						<div class="w3-container w3-padding">
							<h6 class="w3-text-gray">오늘 하루를 요약해보세요.</h6>
							<input class="w3-input w3-border w3-text-grey" name="subject" type="text" style="font-size: 9pt;" value="${subject}"><br>
							<button type="submit" class="w3-button w3-theme w3-pink w3-right" 
								onclick="location.href='/Story_Blog_MyBatis/story/user_write'">글쓰기</button>
								<input type="hidden" name="diaryid" value="${diaryid}">
								<input type="hidden" name="subject" value="${subejct}">
						</div>
					</div>
				</div>
			</div>
			<!-- end. 하루의 끝 -->
				
		</form>
		<!-- end. 하루의 끝 - form 전송 -->
			
		
		<!-- 일기가 없을 때 -->	
        <c:if test="${count==0}">
        <div class="w3-container w3-card w3-white w3-round w3-margin">
       		<h3 class="w3-center">일기 수:${count}</h3>

	        <div class="w3-center w3-container">
	       		<p class="w3-pink">일기를 써주세요!!</p>
	       	</div>	
        </div>
        </c:if>
       
	    
	    <!-- 일기가 있을 때 -->
	    <c:if test="${count!=0}">
	    <div class="w3-container w3-card w3-white w3-round w3-margin">
	    	<h3 class="w3-center">일기 수:${count}</h3>
	    </div>
	    
        <!-- 일기 (타임라인) -->
        <c:forEach var="diary" items="${diaryList}">
		<div class="w3-container w3-card w3-white w3-round w3-margin">
			<br> 
			<img src="<%=request.getContextPath() %>/userSave/${filename}" alt="${filename}"  class="w3-left w3-circle w3-margin-right"
				style="width: 60px; height: 60px"> 
			<!-- 날짜 출력 -->
			<span class="w3-right w3-text-gray">${diary.cdate}</span>
			<!-- 제목 출력 -->
			<b>제목: </b><a href="<%=request.getContextPath()%>/story/user_content?num=${diary.num}&pageNum=${currentPage}"><b>${diary.subject}</b></a>
			<!-- 수정, 삭제 -->
			<div style="margin-top: 6px;">
				<form method="post" style="display: inline-block; margin-left: 10px;" class="w3-right" action="<%=request.getContextPath() %>/story/user_deleteDPro">
					<input type="submit" class="w3-button w3-red w3-small" value="삭제">
					
					<!-- hidden으로  deleteDPro에 넘기기!!!  -->
               		<%-- <input type="hidden" name="email" value="<%=diary.getEmail() %>"> --%>
               		<input type="hidden" name="diaryid" value="${diary.diaryid}">
               		<input type="hidden" name="num" value="${diary.num}">
               		<!--  -->
				</form>
					
				<form method="post" style="display: inline-block;" class="w3-right" action="<%=request.getContextPath() %>/story/user_updateDForm">
					 <input type="submit" class="w3-button w3-blue w3-small" value="수정">
					 
					 <!-- hidden으로  updateDForm에 넘기기!!!  -->
               		<%-- <input type="hidden" name="email" value="<%=diary.getEmail() %>"> --%>
               		<input type="hidden" name="diaryid" value="${diary.diaryid}">
               		<input type="hidden" name="num" value="${diary.num}">
               		<!--  -->
				</form>
			</div>
			<!-- end. 수정, 삭제 -->
			
			<!-- 이메일 출력 -->		
			<p class="w3-text-gray" style="font-size: 9pt;">${diary.email}</p>
			
			<hr class="w3-clear">
			<!-- 내용 출력 -->
			<p>${diary.content}</p>

			<!-- 이미지 출력 / 타임라인에선 사용안함.-->
			<c:if test="${diary.filename0!=null}">
				<div class="w3-right w3-text-gray" style="font-size: 5pt;">
					&nbsp;!Picture&nbsp;
				</div>
			</c:if>
			<c:if test="${diary.filename1!=null}">
				<div class="w3-right w3-text-gray" style="font-size: 5pt;">
					&nbsp;!Picture&nbsp;
				</div>
			</c:if>
			<c:if test="${diary.filename2!=null}">
				<div class="w3-right w3-text-gray" style="font-size: 5pt;">
					&nbsp;!Picture&nbsp;
				</div>
			</c:if>
			<c:if test="${diary.filename3!=null}">
				<div class="w3-right w3-text-gray" style="font-size: 5pt;">
					&nbsp;!Picture&nbsp;
				</div>
			</c:if>
			<c:if test="${diary.filename4!=null}">
				<div class="w3-right w3-text-gray" style="font-size: 5pt;">
					&nbsp;!Picture&nbsp;
				</div>
			</c:if>
		</div>

		</c:forEach>
		</c:if>
			
		<!-- end. 일기 (타임라인) -->	
		
		<!-- 일기 페이지 -->
		<div class = "w3-center w3-container w3-card w3-white w3-round w3-margin">
			<c:if test="${count>0}"> 
				<c:if test="${startPage > bottomLine}">
					<a href="user_timeline?pageNum=${startPage - bottomLine}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="user_timeline?pageNum=${i}"> <c:if test="${i != currentPage}">[${i}]</c:if>
						<c:if test="${i == currentPage}">
							<font color='red'>[${i}]</font>
						</c:if>
					</a>
				</c:forEach>
				
				<c:if test="${endPage < pageCount}">
						<a href="user_timeline?pageNum=${startPage + bottomLine}">[다음]</a>
		
					</c:if>
				</c:if>
		</div>
<!-- end. 일기 페이지 -->
		
      	
</div>
<!-- end. 타임라인 margin -->
</div>
<!-- end. 타임라인 -->

</div>
<!-- end. 전체 틀 div ★ -->



</body>
</html>