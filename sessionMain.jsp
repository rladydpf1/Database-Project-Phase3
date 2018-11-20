<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인 페이지</title>
</head>
<body>
<%
	// 세션값 가져오기
	String id = (String)session.getAttribute("id");
	
	// 세션값이 없으면 (null 이면) sessionLogin.jsp로 이동
	if(id==null)
		response.sendRedirect("sessionLogin.jsp");
%>
<h1>sessionMain.jsp 메인 페이지</h1>
<hr>
<%=id %>님이 로그인하셨습니다.<br>

<input type = "button" value = "로그아웃" onclick = "location.href = 'sessionLogout.jsp'">
</body>
</html>