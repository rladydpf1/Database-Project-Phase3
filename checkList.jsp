<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>check the list</title>
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
sql = String.format("CREATE OR REPLACE VIEW V_stock AS " + 
					"SELECT Inum, SUM(Squantity) AS SSQ FROM STOCK GROUP BY Inum");
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();

sql = String.format("SELECT Inum, Iname, Price, SSQ FROM ITEM, V_stock WHERE Inum = Inumber AND SSQ <= 20");
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
%>
<h2>재고가 모자란 아이템 리스트</h2>
<table width="400" cellpadding="5" border ="1">

		<tread>
			<tr>
				<th>상품 번호</th>
				<th>상품 이름</th>
				<th>가격</th>
				<th>총 수량</th>
			</tr>
	    </tread>
<%
String name = null;
int price = -1, quantity = -1, num = -1;
while (rs.next()) {
	num = rs.getInt(1);
	name = rs.getString(2);
	price = rs.getInt(3);
	quantity = rs.getInt(4);
%>
			<tr>
				<td id="title"><%=num%></td>
		        <td id="title"><%=name%></td>
		        <td id="title"><%=price%>원</td>
		        <td id="title"><%=quantity%></td>
		    </tr>
<%
}
%>
</table>
</body>
</html>
