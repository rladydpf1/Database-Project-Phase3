<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
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
	int small_num = 0;
	try {
		temp = request.getParameter("small");
		small_num = Integer.parseInt(temp);
	}
	catch (Exception e){
		%>
		<script>
		alert('카테고리를 선택해주세요.')
		location.href = 'mainPage.jsp'
		</script>
		<%
	}
	
	
	String[] cate = new String[13];
	cate[4] = "사과/배"; cate[5] = "감귤/한라봉"; cate[6] = "감/곶감";
	cate[7] = "두부/콩나물"; cate[8] = "시금치/부추"; cate[9] = "새송이/표고/버섯";
	cate[10] = "돼지고기"; cate[11] = "닭/오리고기"; cate[12] = "계란/알류/가공란";
	
	sql = String.format("SELECT Iname, Price, Smallc, Inumber FROM ITEM WHERE Smallc = '%s'", cate[small_num]);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
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
		item = rs.getInt(4);
	%>
				<tr>
			        <td id="title"><%=name%></td>
			        <td id="title"><%=price%></td>
			        <td id="title"><%=category%></td>
			        <td> <form action = "showItem.jsp" method="post">
						<input type = "hidden" name = "num" value =<%=item%>>
						<input type = "submit" value = "상세">
						</form> 
					</td>
			    </tr>
	<%
}
	%>
	</table>
</body>
</html>