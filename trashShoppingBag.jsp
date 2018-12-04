<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update shoppingBag</title>
</head>
<body>
<%
int customer = -1;
try {
	customer = (int)session.getAttribute("customer");
}
catch (Exception e) {
	%>
	<script>
	alert('로그인 해주세요.')
	location.href = 'login.jsp'
	</script>
	<%
}
String user = "root";
String password = "rladydpf2";
String url = "jdbc:mysql://localhost:3306/Shopping_mall?autoReconnect=true& useUnicode=true& characterEncoding=utf8 &useSSL=false&serverTimezone=Asia/Seoul";
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Connection conn = null;
String sql = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	System.out.println("Driver loading success");
}
catch (ClassNotFoundException e) {
	e.printStackTrace();
}
boolean key = true;
String temp = null;
try {
	temp = request.getParameter("item");
}
catch(Exception e) {}
if (temp == null) {
	key = false;
	%>
	<script>
	alert('장바구니에서 삭제할 아이템을 정하지 않았습니다.')
	location.href = 'shoppingBag.jsp'
	</script> 
	<%
}
if (key){
	sql = String.format("DELETE FROM SHOPPINGBAG WHERE Cnum = %d AND Inum = %s", customer, temp);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	%>
		<script>
			alert('해당 아이템을 장바구니에서 삭제했습니다.')
			location.href = 'mainPage.jsp'
		</script>
	<% 
}
%>
</body>
</html>