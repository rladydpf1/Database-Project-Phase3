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

String temp = request.getParameter("num");
int num = Integer.parseInt(temp);
temp = request.getParameter("price");
int price = Integer.parseInt(temp);
temp = request.getParameter("quantity");
int quantity = Integer.parseInt(temp);
System.out.println(num);
System.out.println(price);
System.out.println(quantity);
%>

</body>
</html>
