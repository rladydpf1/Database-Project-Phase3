<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Logout 페이지</title>
</head>
<body>
<h1>로그아웃 페이지</h1>
<%
String manager = null;
try {
	manager = (String)session.getAttribute("id");
	session.invalidate();
}
catch (Exception e) {
	int customer = -1;
	try {
		customer = (int)session.getAttribute("customer");
	}
	catch (Exception e1) {
		%>
		<script>
		alert('로그인 해주세요.')
		location.href = 'login.jsp'
		</script>
		<%
	}
	session.invalidate();
}
%>
<script>
	alert('로그아웃 되었습니다.');
	location.href = 'login.jsp'
</script>
</body>
</html>
