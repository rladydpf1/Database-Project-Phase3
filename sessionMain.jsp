<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������</title>
</head>
<body>
<%
	// ���ǰ� ��������
	String id = (String)session.getAttribute("id");
	
	// ���ǰ��� ������ (null �̸�) sessionLogin.jsp�� �̵�
	if(id==null)
		response.sendRedirect("sessionLogin.jsp");
%>
<h1>sessionMain.jsp ���� ������</h1>
<hr>
<%=id %>���� �α����ϼ̽��ϴ�.<br>

<input type = "button" value = "�α׾ƿ�" onclick = "location.href = 'sessionLogout.jsp'">
</body>
</html>