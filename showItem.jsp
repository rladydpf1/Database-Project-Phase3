<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show item</title>
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
	String temp = null;
	int num = 0;
	try {
		temp = request.getParameter("num");
		num = Integer.parseInt(temp);
	}
	catch (Exception e){
		%>
		<script>
		alert('아이템을 선택해주세요.')
		location.href = 'mainPage.jsp'
		</script>
		<%
	}
	sql = String.format("SELECT Date_of_product, Price, Iname, Expiration_date, Origin, Importer, Producer, Smallc " +
						"FROM ITEM, PRODUCERLOCATION WHERE Inumber = %d AND Inumber = Inum", num);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	int price = -1;
	String date = null, name = null, expir = null, cate = null, origin = null, importer = null, producer = null;
	while (rs.next()) {
		date = rs.getString(1);
		price = rs.getInt(2);
		name = rs.getString(3);
		expir = rs.getString(4);
		origin = rs.getString(5);
		importer = rs.getString(6);
		producer = rs.getString(7);
		cate = rs.getString(8);
	}
%>
	<h3><%=name%></h3>
	<table width="400" cellpadding="5">
		<tr>
		    <td id="title">가격 :</td>
		    <td id="title"><%=price%></td>
	 	</tr>
		<tr>
		    <td id="title">제조일자 :</td>
		    <td id="title"><%=date%></td>
		</tr>
		<tr>
		    <td id="title">유통기한 :</td>
		    <td id="title"><%=expir%></td>
		</tr>
		<tr>
		   	<td id="title">원산지 :</td>
		   	<td id="title"><%=origin%></td>
	 	</tr>
		<tr>
			<td id="title">수입자 :</td>
			<td id="title"><%=importer%></td>
		</tr>
		<tr>
			<td id="title">생산자 :</td>
			<td id="title"><%=producer%></td>
		</tr>
		<tr>
			<td id="title">카테고리 :</td>
			<td id="title"><%=cate%></td>
		</tr>
	</table>
	<br>
	<form action = "putShoppingBag.jsp" method="post">
		<input type = "hidden" name = "num" value =<%=num%>>
		수량 : <input type = "number" name = "quantity">
		<input type = "submit" value = "장바구니에 담기">
	</form> 
</body>
</html>