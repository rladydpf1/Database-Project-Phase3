<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Logout 페이지</title>
</head>
<body>
<h1>sessionLogout.jsp 로그아웃 페이지</h1>
<%
	// 세션 초기화
	session.invalidate();
	// 이동
	// response.sendRedirect("sessionLogin.jsp");

%>
<script>
	alert('로그아웃 되었습니다.');
	location.href = 'sessionLogin.jsp'
</script>
</body>
</html>