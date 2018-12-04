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
int number = -1;
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
sql = "SELECT MAX(Cnumber) FROM CUSTOMER";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while (rs.next()) number = rs.getInt(1) + 1;
int age = -1;
boolean key2 = true;
String temp = request.getParameter("age");
String id = request.getParameter("id");
if (!temp.isEmpty()){
	age = Integer.parseInt(temp);
	key2 = false;
}
String name = request.getParameter("name");
//String address = request.getParameter("big"); 이건 나중에 처리합시다
String job = request.getParameter("job");
String sex = request.getParameter("sex");
String phone = request.getParameter("phone");
String pwd = request.getParameter("passwd");
String dup_id = null;
boolean key = true;
if (id.isEmpty() || 5 > id.length() || id.length() > 10) {
	%>
	<script>
	alert('아이디 형식이 틀렸습니다.')
	location.href = 'joinMembership.jsp'
	</script>
	<%
}
sql = "SELECT ID FROM CUSTOMER";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while (rs.next()) {
	dup_id = rs.getString(1);
	if (id.equals(dup_id)) {
		%>
		<script>
		alert('중복된 아이디 입니다.')
		location.href = 'joinMembership.jsp'
		</script>
		<%
		key = false;
		break;
	}
}
if (pwd.isEmpty() || 5 > pwd.length() || pwd.length() > 10) {
	%>
	<script>
	alert('비밀번호 형식이 틀렸습니다.')
	location.href = 'joinMembership.jsp'
	</script>
	<%
	key = false;
}
if (phone.isEmpty() || phone.charAt(3) != '-' || phone.charAt(8) != '-' || phone.length() != 13) {
	%>
	<script>
	alert('휴대전화 번호 형식이 틀렸습니다.')
	location.href = 'joinMembership.jsp'
	</script>
	<%
	key = false;
}
if (name.isEmpty()) {
	%>
	<script>
	alert('이름을 쓰지 않았습니다.')
	location.href = 'joinMembership.jsp'
	</script>
	<%
	key = false;
}
if (age < 1 && !key2) {
	%>
	<script>
	alert('나이가 올바르지 않습니다.')
	location.href = 'joinMembership.jsp'
	</script>
	<%
	key = false;
}
if (key) {
	sql = String.format("INSERT INTO CUSTOMER VALUES('%s', 'no address', null, null, %d, null, '%s', 'E', '%s', '%s')", name, number, phone, id, pwd);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	if (age > 0) {
		sql = String.format("UPDATE CUSTOMER SET Age = '%s' WHERE Cnumber = %d", age, number);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
	}
	if (!job.isEmpty()) {
		sql = String.format("UPDATE CUSTOMER SET Job = '%s' WHERE Cnumber = %d", job, number);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
	}
	if (!sex.isEmpty()) {
		sql = String.format("UPDATE CUSTOMER SET Sex = '%s' WHERE Cnumber = %d", sex, number);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
	}
	//if (job == null) sql = String.format("UPDATE CUSTOMER SET Job = null WHERE Cnumber = %d", number);
	//sql = String.format("UPDATE CUSTOMER SET Address = '%s' WHERE Cnumber = %d", address, number); // 주소는 나중으로 미루자..
	//pstmt = conn.prepareStatement(sql);
	//pstmt.executeUpdate();
}
%> 
<script>
	alert('회원가입을 완료했습니다.')
	location.href = 'login.jsp'
</script>
</body>
</html>