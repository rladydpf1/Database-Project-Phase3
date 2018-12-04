<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.util.Calendar, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
int item = 0, price = 0, quantity = -1, stock = -1, retail = -1, onum = -1;
int retails[] = new int[17];
int stocks[] = new int[17];
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
Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy:MM:dd hh:mm:ss");
String str = sdf1.format(cal.getTime());
boolean key2 = false;
if (key) {
	sql = String.format("SELECT Inum, SUM(Squantity) FROM STOCK WHERE Inum = %d GROUP BY Inum", item);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		stock = rs.getInt(2);
		if (stock - quantity < 0) {
			%>
			<script>
			alert("재고가 부족하여 구매할 수 없습니다.");
		    location.href = 'shoppingBag.jsp'
		    </script>
		    <%
		}
		else {
			key2 = true;
			sql = String.format("SELECT MAX(Onumber) FROM ORDER1");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				onum = rs.getInt(1) + 1;
			}
			sql = String.format("SELECT Squantity, Rnum FROM STOCK WHERE Inum = %d", item);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int cnt = 0;
			while (rs.next()) {
				stock = rs.getInt(1);
				retail = rs.getInt(2);
				if (stock >= quantity) {
					sql = String.format("UPDATE STOCK SET Squantity = %d WHERE Inum = %d AND Rnum = %d", stock - quantity, item, retail);
					pstmt = conn.prepareStatement(sql);
					pstmt.executeUpdate();
					
					sql = String.format("INSERT INTO ORDER1 VALUES (%d, %d, %d, %d, %d, '%s')", 
										onum, quantity, customer, item, retail, str);
					pstmt = conn.prepareStatement(sql);
					pstmt.executeUpdate();
					key = false;
					break;
				}
				else if (stock > 0) {
					stocks[cnt] = stock;
					retails[cnt++] = retail;
				}
			}
			int temp = quantity;
			if (key) {
				int i;
				for (i = 0; i < cnt ; i++) {
					if (quantity <= stocks[i]) break;
					sql = String.format("UPDATE STOCK SET Squantity = %d WHERE Inum = %d AND Rnum = %d", 
										0, item, retails[i]);
					pstmt = conn.prepareStatement(sql);
					pstmt.executeUpdate();
					quantity = quantity - stocks[i];
				}
				sql = String.format("UPDATE STOCK SET Squantity = %d WHERE Inum = %d AND Rnum = %d", 
						stocks[i] - quantity, item, retails[i]);
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				sql = String.format("INSERT INTO ORDER1 VALUES (%d, %d, %d, %d, %d, '%s')", 
						onum, temp, customer, item, retails[0], str);
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				retail = retails[0];
			}
			sql = String.format("DELETE FROM SHOPPINGBAG WHERE Cnum = %d AND Inum = %d", customer, item);
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}
	}
}
if (key2) {
	String address = null, iname = null, rname = null;
	sql = String.format("SELECT Address FROM CUSTOMER WHERE Cnumber = %d", customer);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		address = rs.getString(1);
	}
	sql = String.format("SELECT Iname FROM ITEM WHERE Inumber = %d", item);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		iname = rs.getString(1);
	}
	sql = String.format("SELECT Address FROM RETAILER WHERE Rnumber = %d", retail);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		rname = rs.getString(1);
	}
	%>
	<script>
		alert("구매 완료하였습니다.")
	</script>
	<h3>구매내역</h3>
	<table width="400" cellpadding="5">
		<tr>
		    <td id="title">주문 번호 :</td>
		    <td id="title"><%=onum%></td>
		</tr>
		<tr>
			<td id="title">상품 이름 :</td>
			<td id="title"><%=iname%></td>
		</tr>
		<tr>
		   	<td id="title">수량 :</td>
		   	<td id="title"><%=quantity%></td>
	 	</tr>
		<tr>
		    <td id="title">가격 :</td>
		    <td id="title"><%=price%></td>
	 	</tr>
		<tr>
		    <td id="title">배송지 :</td>
		    <td id="title"><%=address%></td>
		</tr>
		<tr>
			<td id="title">배송 매장 :</td>
			<td id="title"><%=rname%></td>
		</tr>
		<tr>
			<td id="title">구매 날짜 :</td>
			<td id="title"><%=str%></td>
		</tr>
	</table>
	<%
}
%>
<br>
<input type = "button" value = "이전으로 돌아가기" onclick = "location.href = 'mainPage.jsp'">
</body>
</html>
