<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력한 정보에 따른 추천 목록</title>
</head>
<body>
<h1>★★회원 가입을 축하드립니다!★★</h1><br>
<h3>성별 정보를 입력하지 않으셨군요?</h3><br>
<%
String user = "root";
String password = "brandon0504";
String url = "jdbc:mysql://localhost:3306/Shopping_mall?autoReconnect=true& useUnicode=true& characterEncoding=utf8 &useSSL=false&serverTimezone=Asia/Seoul";
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Connection conn = null;
String sql = null;
String agetemp = request.getParameter("age");
int age = Integer.parseInt(agetemp);
age = age / 10 * 10;
out.println("다른 "+ age + "대 고객분들에게 가장 인기 많은 상품 Top5 입니다.");

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	System.out.println("Driver loading success");
}
catch (ClassNotFoundException e) {
	e.printStackTrace();
}

sql = String.format("CREATE OR REPLACE VIEW V8 AS"
		+ " SELECT Ino "
		+ " FROM ORDER1 JOIN CUSTOMER ON Cno = Cnumber"
		+ " WHERE age >=" + age + " AND age < " + (age + 10));
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();

sql = String.format("SELECT Iname, Price, Smallc " +
		"FROM V8 JOIN ITEM ON Ino = Inumber " +
		"GROUP BY Inumber " +
		"ORDER BY COUNT(Inumber) DESC LIMIT 5");
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();

%>
<table width="700" cellpadding="5" border ="1">
		<tread>
			<tr>
				<th>상품 이름</th>
				<th>가격</th>
				<th>카테고리</th>
			</tr>
	    </tread>
<%
String name = null, category = null;
int price, item;
while (rs.next()) {
	name = rs.getString(1);
	price = rs.getInt(2);
	category = rs.getString(3);
%>
			<tr>
		        <td id="title"><%=name%></td>
		        <td id="title"><%=price%></td>
		        <td id="title"><%=category%></td>
		    </tr>
<%
}
%>
</body>
</html>