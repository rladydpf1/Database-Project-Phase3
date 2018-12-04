<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager page</title>
</head>
<body>
<%
String manager = null;
manager = (String)session.getAttribute("id");
if (manager == null) {
	%>
	<script>
	alert('당신은 매니저가 아닙니다.')
	location.href = 'login.jsp'
	</script>
	<%
}
%>
<h2>매니저 전용 페이지 입니다.</h2>
<form action = "updateStock.jsp" method="post">
	아이템 고유 번호 입력: <input type = "number" name = "id"><br>
	매장 번호 입력: <input type = "number" name = "retail"><br>
	수량 입력: <input type = "number" name = "passwd"><br>
	<input type = "submit" value = "해당 상품 주문">
</form>
<br>
<input type = "button" value = "재고가 모자란 상품 확인" onclick = "location.href = 'checkList.jsp'">
<br><br>
<form action = "getSales.jsp" method="get">
	날짜 입력: <input type = "date" name = "start" value="2018-12-05" min="2016-10-01" max="2018-12-31"> 
	 ~ <input type = "date" name = "finish" value="2018-12-05" min="2016-10-01" max="2018-12-31">
	<input type = "submit" value = "매출 확인"> <br>
</form>
<input type = "button" value = "로그아웃" onclick = "location.href = 'logout.jsp'">
</body>
</html>