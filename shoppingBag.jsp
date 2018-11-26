<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>shopping bag</title>
</head>
<body>
<h2>장바구니 페이지입니다.</h2>
<%
int number = (int)session.getAttribute("num");
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
sql = String.format("SELECT Iname, Price, Bquantity, Inum FROM CUSTOMER, ITEM, SHOPPINGBAG WHERE Cnumber = %d AND Cnumber = Cnum AND Inumber = Inum", number);
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

%>
<table width="400" cellpadding="5" border ="1">
		<tread>
			<tr>
				<th>상품 이름</th>
				<th>가격</th>
				<th>수량</th>
			</tr>
	    </tread>
<%
String name = null;
int price = -1, quantity = -1, num;
while (rs.next()) {
	name = rs.getString(1);
	price = rs.getInt(2);
	quantity = rs.getInt(3);
	num = rs.getInt(4);
	price = price * quantity;
%>
			<tr>
		        <td id="title"><%=name%></td>
		        <td id="title"><%=price%>원</td>
		        <td id="title"><%=quantity%></td>
		     
		        <td> <form action = "order.jsp" method="post">
					<input type = "hidden" name = "num" value =<%=num%>>
					<input type = "hidden" name = "price" value =<%=price%>>
					<input type = "hidden" name = "quantity" value =<%=quantity%>>
					<input type = "submit" value = "구매">
					</form> 
				</td>
		    </tr>
<%
}
%>
</table>

</body>
</html>
