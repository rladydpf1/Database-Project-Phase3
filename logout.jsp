<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Logout 페이지</title>
</head>
<body>
<h1>로그아웃 페이지</h1>
<%
	session.invalidate();
%>
<script>
	alert('로그아웃 되었습니다.');
	location.href = 'login.jsp'
</script>
</body>
</html>
