<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 수정</title>
</head>
<body>
	<form action = "modMenuSession.jsp" method = "post">
	<h3>수정할 메뉴를 적어주세요.</h3><br>
	이전 메뉴 이름 : <input type = "text" name = "prename"><br>
	새 메뉴 이름 : <input type = "text" name = "postname"><br>
	새 메뉴 가격 : <input type = "text" name = "price"><br>
	<input type = "submit" value = "메뉴 수정">
	</form>
</body>
</html>