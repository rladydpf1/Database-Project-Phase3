<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>sessionLogin Page</title>
</head>
<body>
<h1>로그인 페이지</h1>
<hr>
<form action = "sessionLoginPro.jsp" method="post">
	아이디: <input type = "text" name = "id"><br>
	패스워드: <input type = "password" name = "passwd"><br>
	<input type = "submit" value = "로그인">
</form>
</body>
</html>