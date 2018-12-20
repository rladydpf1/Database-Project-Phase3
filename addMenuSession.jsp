<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가</title>
</head>
<body>
<%
	String restaurant = "";
	try {
		restaurant = (String)session.getAttribute("restaurant");
	}
	catch (Exception e) {
		%>
		<script>
		alert('로그인 해주세요.')
		location.href = 'login.jsp'
		</script>
		<%
	}
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	String sql;
	String user = "hymi54";
	String pswd = "br0409";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pswd);
	
	String name = new String(request.getParameter("name").getBytes("8859_1"), "UTF-8");
	String temp = request.getParameter("price");
	int price = Integer.parseInt(temp);
	temp = request.getParameter("number");
	int number = Integer.parseInt(temp);
	
	sql = String.format("insert into resMenu values (%d, '%s', '%s', %d)", number, restaurant, name, price);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	conn.close();
	%>
	<script>
	alert('메뉴가 추가되었습니다.')
	location.href = 'resMain.jsp'
	</script>
</body>
</html>