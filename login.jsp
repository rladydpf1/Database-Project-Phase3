<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login_page</title>
</head>
<body>
<h1>김요엘, 이현민조 Phase3 시작화면</h1>
<h2>팀5 쇼핑몰 로그인 페이지 입니다.</h2>
<hr>
<form action = "loginSession.jsp" method="post">
	아이디: <input type = "text" name = "id"><br>
	패스워드: <input type = "password" name = "passwd"><br>
	<input type = "submit" value = "로그인">
</form>
<input type = "button" value = "회원가입" onclick = "location.href = 'joinMembership.jsp'">
</body>
</html>
