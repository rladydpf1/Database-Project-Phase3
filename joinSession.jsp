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
String sex = "0";
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
//String address = request.getParameter("big");
String job = request.getParameter("job");
sex = request.getParameter("sex");
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
	sql = String.format("INSERT INTO CUSTOMER VALUES('%s', '%s', null, null, %d, null, '%s', 'E', '%s', '%s')", name, address, number, phone, id, pwd);
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
	if (sex == "0") {
		sql = String.format("UPDATE CUSTOMER SET Sex = '%s' WHERE Cnumber = %d", sex, number);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
	}
}
	%>
	<script>
	alert('★★회원가입을 완료했습니다★★')
	</script>
	<%
if (age > 0 && !sex.equals("0")) {
	%>
	<form action = "recommendList4.jsp" method="post">
	<input type = "hidden" name = "sex" value =<%=sex%>>
	<input type = "hidden" name = "age" value =<%=age%>>
	<input type = "submit" value = "로그인 하러가기">
	</form>
	<%
}
else if (age > 0 && sex.equals("0")) {
	%>
	<form action = "recommendList2.jsp" method="post">
	<input type = "hidden" name = "age" value =<%=age%>>
	<input type = "submit" value = "로그인 하러가기">
	</form>
	<%
}
else if (age <= 0 && !sex.equals("0")) {
	%>
	<form action = "recommendList3.jsp" method="post">
	<input type = "hidden" name = "sex" value =<%=sex%>>
	<input type = "submit" value = "로그인 하러가기">
	</form>
	<%
}
else {
	%>
	<form action = "recommendList1.jsp" method="post">
	<input type = "submit" value = "로그인 하러가기">
	</form>
	<%
}
%> 
</body>
</html>
