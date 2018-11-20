<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>check with DB</title>
</head>
<body>
<h1>로그인 인증</h1>
<hr>
<%
	// 파라미터값 가져오기 "id" "passwd"
	// 사용자가 로그인 시 입력한 값
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String managerId = "rladydpf1";
	String managerPass = "rladydpf2";
	
	String managerId2 = "hyunmin1";
	String managerPass2 = "hyunmin2";
	
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
	else if (id.equals(managerId2)) {
		if(passwd.equals(managerPass2)){
			session.setAttribute("id", id);
			out.println("로그인 인증됨<br>");
			response.sendRedirect("mainPage.jsp");
			%>
			<script>
				alert('로그인 인증되었습니다.');
				location.href = 'mainPage.jsp';
			</script>
			<%
		} else // 패스워드 틀림
			out.println("패스워드틀림<br>");
	}
		
	else out.println("아이디 없음<br>");
%>
</body>
</html>
