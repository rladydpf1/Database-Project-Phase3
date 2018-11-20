<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Phase3 test</title>
</head>
<body>
<%
String user = "root";
String password = "rladydpf2";
String url = "jdbc:mysql://172.20.10.3:3306/Shopping_mall?autoReconnect=true& useUnicode=true& characterEncoding=utf8& verifyServerCertificate=false& useSSL=false& serverTimezone=UTC &sessionVariables=storage_engine%3DInnoDB &interactiveClient=true";
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
%>

</body>
</html>
