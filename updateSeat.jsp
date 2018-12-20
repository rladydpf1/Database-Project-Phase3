<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석현황 업데이트</title>
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
	
	String name = null;
	int max = 0;
	sql = String.format("SELECT r.resName, c.maxSeat FROM RESTAURANT r, curSeat c WHERE r.resNum = c.resNum and c.resNum = %s ", restaurant);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		name = rs.getString(1);
		max = rs.getInt(2);
	}
	%>
	<h3><%=name %> 좌석현황 업데이트 페이지</h3><hr>
	<form action = "updateSession.jsp" method = "post">
	전체 좌석 : <input type = "number" name = "max" value = "<%=max %>"><br>
	좌석 현황 : <input type = "number" name = "cur" value = "0"><br>
	<input type = "submit" value = "업데이트"><br><br>
	</form>
	<button onclick="location='resMain.jsp'">메인페이지로</button>
</body>
</html>