<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search result</title>
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
String keyword = null;
try {
	keyword = new String(request.getParameter("name").getBytes("8859_1"), "EUC-KR");
}
catch (Exception E) {
	%>
	<script>
	alert('제대로 검색을 해주세요.')
	location.href = 'searchItem.jsp'
	</script>
	<%
}
sql = String.format("SELECT Inumber, Iname, Price, Smallc FROM ITEM WHERE Iname LIKE '%%%s%%'", keyword);
System.out.println(sql);
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
int number = 0, price = 0;
String name = null, cate = null;
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
	while (rs.next()) {
		number = rs.getInt(1);
		name = rs.getString(2);
		price = rs.getInt(3);
		cate = rs.getString(4);
	%>
				<tr>
			        <td id="title"><%=name%></td>
			        <td id="title"><%=price%></td>
			        <td id="title"><%=cate%></td>
			        <td> <form action = "showItem.jsp" method="post">
						<input type = "hidden" name = "num" value =<%=number%>>
						<input type = "submit" value = "상세">
						</form> 
					</td>
			    </tr>
	<%
}
	%>
</body>
</html>