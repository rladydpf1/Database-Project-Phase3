<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Logout ������</title>
</head>
<body>
<h1>sessionLogout.jsp �α׾ƿ� ������</h1>
<%
	// ���� �ʱ�ȭ
	session.invalidate();
	// �̵�
	// response.sendRedirect("sessionLogin.jsp");

%>
<script>
	alert('�α׾ƿ� �Ǿ����ϴ�.');
	location.href = 'sessionLogin.jsp'
</script>
</body>
</html>