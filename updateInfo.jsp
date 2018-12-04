<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update information</title>
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
int age = -1;
boolean key2 = true;
String temp = request.getParameter("age");
if (!temp.isEmpty()) {
	age = Integer.parseInt(temp);
	key2 = false;
}
String name = new String(request.getParameter("name").getBytes("8859_1"), "UTF-8");
String address = null;
try {
	address = new String(request.getParameter("address").getBytes("8859_1"), "UTF-8");
	System.out.println(address);
}
catch (Exception E) {
	%>
	<script>
	alert('제대로 주소를 적어주세요.')
	location.href = 'joinMembership.jsp'
	</script>
	<%
}
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
if (age < 1 && !key2) {
	%>
	<script>
	alert('나이가 올바르지 않습니다.')
	location.href = 'changeInfo.jsp'
	</script>
	<%
	key = false;
}
if (address.isEmpty()) {
	%>
	<script>
	alert('주소를 적으십시오.')
	location.href = 'joinMembership.jsp'
	</script>
	<%
	key = false;
}
if (key) {
	if (age < 1) sql = String.format("UPDATE CUSTOMER SET Age = null WHERE Cnumber = %d", customer);
	else sql = String.format("UPDATE CUSTOMER SET Age = %s WHERE Cnumber = %d", age, customer);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	sql = String.format("UPDATE CUSTOMER SET Cname = '%s' WHERE Cnumber = %d", name, customer);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	if (job.isEmpty()) sql = String.format("UPDATE CUSTOMER SET Job = null WHERE Cnumber = %d", customer);
	else sql = String.format("UPDATE CUSTOMER SET Job = '%s' WHERE Cnumber = %d", job, customer);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	sql = String.format("UPDATE CUSTOMER SET Pwd = '%s' WHERE Cnumber = %d", pwd, customer);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	if (sex.equals("0")) sql = String.format("UPDATE CUSTOMER SET Sex = null WHERE Cnumber = %d", customer);
	else sql = String.format("UPDATE CUSTOMER SET Sex = '%s' WHERE Cnumber = %d", sex, customer);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	sql = String.format("UPDATE CUSTOMER SET Phone = '%s' WHERE Cnumber = %d", phone, customer);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	sql = String.format("UPDATE CUSTOMER SET Address = '%s' WHERE Cnumber = %d", address, customer); // 주소는 나중으로 미루자..
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
}
%> 
<script>
	alert('정보를 성공적으로 바꿨습니다.')
	location.href = 'changeInfo.jsp'
</script>
</body>
</html>