<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
int item = 0, quantity = 0;
boolean key = true;
String temp = null;
try {
	temp = request.getParameter("num");
	item = Integer.parseInt(temp);
	temp = request.getParameter("quantity");
	quantity = Integer.parseInt(temp);
}
catch(Exception e) {
	key = false;
	%>
	<script>
	alert('제대로된 수량을 정해주세요.')
	</script>
	<form action = "showItem.jsp" method="post">
		<input type = "hidden" name = "num" value =<%=item%>>
		<input type = "submit" value = "이전 페이지로 돌아가기">
	</form> 
	<%
}
if (key && quantity <= 0) {
	%>
	<script>
	alert('제대로된 수량을 정해주세요.')
	</script>
	<form action = "showItem.jsp" method="post">
		<input type = "hidden" name = "num" value =<%=item%>>
		<input type = "submit" value = "이전 페이지로 돌아가기">
	</form> 
	<%
}
sql = String.format("SELECT Bquantity FROM SHOPPINGBAG WHERE Cnum = %d AND Inum = %d", customer, item);
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

int overlap = 0;
while (rs.next()) {
	overlap = rs.getInt(1);
	sql = String.format("DELETE FROM SHOPPINGBAG WHERE Cnum = %d AND Inum = %d", customer, item);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
}

sql = String.format("INSERT INTO SHOPPINGBAG VALUES (%d, %d, %d)", customer, quantity + overlap, item);
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();
%>
	<script>
		alert('장바구니에 담았습니다.')
		location.href = 'mainPage.jsp'
	</script>
</body>
</html>
