<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>search items</title>
</head>
<body>
<h2>상품 이름 검색</h2>
<form action = "searchResult.jsp" method="post">
<input type = "text" name = "name">
<input type = "submit" value = "검색">
</form>
</body>
</html>
