<%-- <%@page import="com.db.DiaryDBBean" %> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <% request.setCharacterEncoding("EUC-KR"); %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%-- <jsp:useBean id="diary" class="com.db.DiaryDataBean">
	<jsp:setProperty name="diary" property="*"/>
	</jsp:useBean>
	<% System.out.println(diary); %>
	
	<%
	try {
		DiaryDBBean diaPro = DiaryDBBean.getInstance();
		int chk = diaPro.updateDiary(diary);
		
		String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum == "") {
				pageNum = "1";
			}
		
	%>
	
	<% System.out.println("수정여부: " + chk);  %> --%>
	
	<c:if test="${chk==1}">
		<script type="text/javascript">
			alert("수정 되었습니다.");
			location.href="/Story_Blog_MyBatis/story/user_main"; <!-- 나중엔 각 페이지 마다 뒤로 가게 만들기. 지금은 무조건 main으로감 -->
		</script>
	<meta http-equiv="Refresh" content="0;url=user_updateDForm?pageNum=${pageNum}"> 
	</c:if>
	<c:if test="${chk!=1}">
		<script type="text/javascript">
			alert("수정 불가");
			history.go(-1);
		</script>
	</c:if>

	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
<body>


</body>
</html>