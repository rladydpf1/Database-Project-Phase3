<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>update information</title>
</head>
<body>
<%
int number = (int)session.getAttribute("num");
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
String temp = request.getParameter("age");
int age = Integer.parseInt(temp);
String name = request.getParameter("name");
//String address = request.getParameter("big"); 이건 나중에 처리합시다
String job = request.getParameter("job");
String sex = request.getParameter("sex");
String phone = request.getParameter("phone");
String pwd = request.getParameter("passwd");
boolean key = true;

if (pwd.isEmpty() || 5 > pwd.length() || pwd.length() > 10) {
	%>
	<script>
	alert('비밀번호 형식이 틀렸습니다.')
	location.href = 'changeInfo.jsp'
	</script>
	<%
	key = false;
}
System.out.println(phone.isEmpty());
if (phone.isEmpty() || phone.charAt(3) != '-' || phone.charAt(8) != '-' || phone.length() != 13) {
	%>
	<script>
	alert('휴대전화 번호 형식이 틀렸습니다.')
	location.href = 'changeInfo.jsp'
	</script>
	<%
	key = false;
}
if (name.isEmpty()) {
	%>
	<script>
	alert('이름을 쓰지 않았습니다.')
	location.href = 'changeInfo.jsp'
	</script>
	<%
	key = false;
}
if (age < 1) {
	%>
	<script>
	alert('나이가 올바르지 않습니다.')
	location.href = 'changeInfo.jsp'
	</script>
	<%
	key = false;
}
if (key) {
	if (age < 1) sql = String.format("UPDATE CUSTOMER SET Age = null WHERE Cnumber = %d", number);
	else sql = String.format("UPDATE CUSTOMER SET Age = %s WHERE Cnumber = %d", age, number);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

	sql = String.format("UPDATE CUSTOMER SET Cname = '%s' WHERE Cnumber = %d", name, number);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

	if (job.isEmpty()) sql = String.format("UPDATE CUSTOMER SET Job = null WHERE Cnumber = %d", number);
	else sql = String.format("UPDATE CUSTOMER SET Job = '%s' WHERE Cnumber = %d", job, number);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

	sql = String.format("UPDATE CUSTOMER SET Pwd = '%s' WHERE Cnumber = %d", pwd, number);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

	if (sex.isEmpty()) sql = String.format("UPDATE CUSTOMER SET Sex = null WHERE Cnumber = %d", number);
	else sql = String.format("UPDATE CUSTOMER SET Sex = '%s' WHERE Cnumber = %d", sex, number);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

	sql = String.format("UPDATE CUSTOMER SET Phone = '%s' WHERE Cnumber = %d", phone, number);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

	//if (job == "") sql = String.format("UPDATE CUSTOMER SET Job = null WHERE Cnumber = %d", number);
	//sql = String.format("UPDATE CUSTOMER SET Address = '%s' WHERE Cnumber = %d", address, number); // 주소는 나중으로 미루자..
	//pstmt = conn.prepareStatement(sql);
	//pstmt.executeUpdate();
}
%> 
<script>
	alert('정보를 성공적으로 바꿨습니다.')
	location.href = 'changeInfo.jsp'
</script>
</body>
</html>
