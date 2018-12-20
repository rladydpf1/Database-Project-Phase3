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
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	String sql;
	String user = "hymi54";
	String pswd = "br0409";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pswd);
	
	int number = -1;
	sql = "select max(menuNum) from resMenu";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while (rs.next()) number = rs.getInt(1) + 1;
	%>
	<form action = "addMenuSession.jsp" method = "post">
	<h3>추가할 메뉴와 가격을 적어주세요.</h3><br>
	메뉴 이름 : <input type = "text" name = "name"><br>
	메뉴 가격 : <input type = "text" name = "price"><br>
	<input type = "hidden" name = "number" value = <%=number %>>
	<input type = "submit" value = "메뉴 추가">
	</form>
	<%
	conn.close();
	%>
</body>
</html>