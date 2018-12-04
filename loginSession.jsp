<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login session</title>
</head>
<body>
<h1>로그인 인증</h1>
<hr>
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
	// 파라미터값 가져오기 "id" "passwd"
	// 사용자가 로그인 시 입력한 값
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	System.out.println(id);
	String managerId = "manager1";
	String managerPass = "manager2";
	boolean key = false;
	String DBid, DBpwd;
	
	sql = "SELECT ID, Pwd, Cnumber FROM CUSTOMER";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (id.equals(managerId)) { // 아이디 있음
		if(passwd.equals(managerPass)){
			session.setAttribute("id", id);
			out.println("로그인 인증됨<br>");
			response.sendRedirect("manager.jsp");
			%>
			<script>
				alert('로그인 인증되었습니다.');
				location.href = 'manager.jsp';
			</script>
			<%
		} else // 패스워드 틀림
			out.println("패스워드틀림<br>");
	} 
	int number = -1;
	while (rs.next()) {
		if (key) break;
		DBid = rs.getString(1);
		DBpwd = rs.getString(2);
		number = rs.getInt(3);
		if (id.equals(DBid)) {
			key = true;
			if (passwd.equals(DBpwd)) {
				session.setAttribute("customer", number);
				out.println("로그인 인증됨<br>");
				response.sendRedirect("mainPage.jsp");
				%>
				<script>
					alert('로그인 인증되었습니다.');
					location.href = 'mainPage.jsp';
				</script>
				<%
			} 
		}
	}		
	if (key) {
		out.println("패스워드틀림<br>");
	}
	else out.println("아이디 없음<br>");
%>
</body>
</html>