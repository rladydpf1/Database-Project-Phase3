<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>order</title>
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

int item = 0, price = 0, quantity = -1, stock = -1;;
boolean key = true;
try {
	String temp = request.getParameter("num");
	item = Integer.parseInt(temp);
	temp = request.getParameter("price");
	price = Integer.parseInt(temp);
	temp = request.getParameter("quantity");
	quantity = Integer.parseInt(temp);
}
catch (Exception e) {}
if (item < 1 || item > 45) {
	key = false;
	%>
	<script>
	alert('아이템을 선택해주세요.')
	location.href = 'shoppingBag.jsp'
	</script>
	<%
}
%>
<script>
var con_test = confirm("정말 구매하시겠습니까?");
if(con_test == true){
<%
	sql = String.format("SELECT Inum, SUM(Squantity) FROM STOCK WHERE Inum = %d GROUP BY Inum", item);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		stock = rs.getInt(2);
		if (stock - quantity < 0) {
			%>
			alert("재고가 부족하여 구매할 수 없습니다.");
		    location.href = 'shoppingBag.jsp'
		    <%
		}
		else {
			key = true;
			sql = "LOCK TABLES STOCK WRITE";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}
	}
%>
}
else if(con_test == false){
    alert("구매 취소되었습니다.");
    location.href = 'shoppingBag.jsp'
}
</script>
<%

sql ="UNLOCK TABLES";
%>
</body>
</html>
