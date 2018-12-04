<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>previous purchase</title>
</head>
<body>
<h2>구매목록 페이지입니다.</h2>
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
sql = String.format("SELECT Oquantity, Address, Odate, Iname, Ino " +
		"FROM ORDER1, RETAILER, ITEM WHERE Cno = %d AND Ino = Inumber AND Rno = Rnumber", customer);
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
%>
<table width="700" cellpadding="5" border ="1">
		<tread>
			<tr>
				<th>상품 이름</th>
				<th>배송 매장</th>
				<th>배송 날자</th>
				<th>수량</th>
			</tr>
	    </tread>
<%
String name = null, retail = null, date = null;
int quantity = -1, item;
while (rs.next()) {
	quantity = rs.getInt(1);
	retail = rs.getString(2);
	date = rs.getString(3);
	name = rs.getString(4);
	item = rs.getInt(5);
%>
			<tr>
		        <td id="title"><%=name%></td>
		        <td id="title"><%=retail%></td>
		        <td id="title"><%=date%></td>
		        <td id="title"><%=quantity%></td>
		        <td> <form action = "showItem.jsp" method="post">
					<input type = "hidden" name = "num" value =<%=item%>>
					<input type = "submit" value = "상세">
					</form> 
				</td>
		    </tr>
<%
}
%>
</table>

</body>
</html>