<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인 페이지</title>
</head>
<body>
<%
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
	
	String id = null;
	String name = null;
	int number = 0;
	
	id = (String)session.getAttribute("id");
	sql = String.format("SELECT Cnumber, Cname FROM CUSTOMER WHERE ID = '%s' ", id);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	// 세션값 가져오기
	
	if (id == null) response.sendRedirect("login.jsp");
	// 세션값이 없으면 (null 이면) sessionLogin.jsp로 이동
	while (rs.next()) {
		number = rs.getInt(1);
		name = rs.getString(2);
	}
	
	session.setAttribute("num", number);
	
%>
<h1>팀5 쇼핑몰 메인 페이지</h1>
<hr>
<%=name %>님이 로그인하셨습니다.<br>
<input type = "button" value = "회원정보 수정" onclick = "location.href = 'changeInfo.jsp'">
<input type = "button" value = "로그아웃" onclick = "location.href = 'logout.jsp'">
<input type = "button" value = "과거 구매내역 확인" onclick = "location.href = 'previousPurchase.jsp'">
<input type = "button" value = "장바구니 확인" onclick = "location.href = 'shoppingBag.jsp'">
<input type = "button" value = "상품 검색" onclick = "location.href = 'searchItem.jsp'">
</body>
</html>
