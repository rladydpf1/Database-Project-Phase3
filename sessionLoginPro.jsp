<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>check with DB</title>
</head>
<body>
<h1>sessionLoginPro.jsp</h1>
<hr>
<%
	// 파라미터값 가져오기 "id" "passwd"
	// 사용자가 로그인 시 입력한 값
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String dbId = "admin";
	String dbPass = "1234";
	
	// 문자열 비교
	// 폼의 아이디와 DB의 아이디가 같고 폼의 패스워드와 DB의 패스워드가 같으면
	// 세션값 생성 ("id", id값) 후 sessionMain.jsp로 이동
	// 폼의 패스워드와 DB의 패스워드가 다르면 "패스워드 틀림"
	// 아이디가 틀리면 "아이디 없음"
	if (id.equals(dbId)) { // 아이디 있음
		if(passwd.equals(dbPass)){
			session.setAttribute("id", id);
			out.println("로그인 인증됨<br>");
			response.sendRedirect("sessionMain.jsp");
			%>
			<script>
				alert('로그인 인증되었습니다.');
				location.href = 'sessionMain.jsp';
			</script>
			<%
		} else // 패스워드 틀림
			out.println("패스워드틀림<br>");
	} else // 아이디 없음
		out.println("아이디 없음<br>");
%>
</body>
</html>