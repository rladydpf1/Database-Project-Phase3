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
	// �Ķ���Ͱ� �������� "id" "passwd"
	// ����ڰ� �α��� �� �Է��� ��
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String dbId = "admin";
	String dbPass = "1234";
	
	// ���ڿ� ��
	// ���� ���̵�� DB�� ���̵� ���� ���� �н������ DB�� �н����尡 ������
	// ���ǰ� ���� ("id", id��) �� sessionMain.jsp�� �̵�
	// ���� �н������ DB�� �н����尡 �ٸ��� "�н����� Ʋ��"
	// ���̵� Ʋ���� "���̵� ����"
	if (id.equals(dbId)) { // ���̵� ����
		if(passwd.equals(dbPass)){
			session.setAttribute("id", id);
			out.println("�α��� ������<br>");
			response.sendRedirect("sessionMain.jsp");
			%>
			<script>
				alert('�α��� �����Ǿ����ϴ�.');
				location.href = 'sessionMain.jsp';
			</script>
			<%
		} else // �н����� Ʋ��
			out.println("�н�����Ʋ��<br>");
	} else // ���̵� ����
		out.println("���̵� ����<br>");
%>
</body>
</html>