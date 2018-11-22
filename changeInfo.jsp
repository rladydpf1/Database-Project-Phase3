<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>change information</title>
</head>
<body>
<h2>회원정보 수정 페이지 입니다.</h2>
<%
int number = (int)session.getAttribute("num");
System.out.println(number);
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

sql = String.format("SELECT * FROM CUSTOMER WHERE Cnumber = %d", number);

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
int age = 0;
String name = null, address = null , job = null, sex = null , phone = null , grade = null, id = null, pwd = null;

while (rs.next()) {
	name = rs.getString(1);
	address = rs.getString(2);
	job = rs.getString(3);
	age = rs.getInt(4);
	sex = rs.getString(6);
	phone = rs.getString(7);
	grade = rs.getString(8);
	id = rs.getString(9);
	pwd = rs.getString(10);
}
%> 
<form action = "updateInfo.jsp" method="post">
	<table>
		<tr>
			<td id="title">아이디 :</td>
	        <td id="title"><%=id %></td>
	    </tr>
	</table>  
	아이디는 바꿀 수 없습니다. <br>
	
	<table>
		<tr>
			<td id="title">비밀번호 :</td>
	        <td id="title"><%=pwd %></td>
	    </tr>
	</table>
	패스워드(5~10자): <input type = "password" name = "passwd"><br>
	<table>
		<tr>
			<td id="title">주소 :</td>
	        <td id="title"><%=address %></td>
	    </tr>
	</table>
	주소: <select name = "big" >
			<option value="1">서울</option>
			<option value="2">경기</option>
			<option value="3">강원</option>
			<option value="4">충남</option>
			<option value="5">충북</option>
			<option value="6">경북</option>
			<option value="7">경남</option>
			<option value="8">전북</option>
			<option value="9">전남</option>
			<option value="10">제주</option>
			<option value="11">인천</option>
			<option value="12">대전</option>
			<option value="13">광주</option>
			<option value="14">대구</option>
			<option value="15">울산</option>
			<option value="16">부산</option>
			</select> 
			<br>
	
	<table>
		<tr>
			<td id="title">휴대전화 :</td>
	        <td id="title"><%=phone %></td>
	    </tr>
	</table>
	휴대전화(- 포함해서 입력): <input type = "text" name = "phone"><br>
	
	<table>
		<tr>
			<td id="title">성별 :</td>
	        <td id="title"><%=sex %></td>
	    </tr>
	</table>
	성별: <select name = "sex" >
			<option value="M">남자</option>
			<option value="F">여자</option>
			</select> <br>
	
	<table>
		<tr>
			<td id="title">나이 :</td>
	        <td id="title"><%=age %></td>
	    </tr>
	</table>
	나이: <input type = "text" name = "age"> <br>
	
	<table>
		<tr>
			<td id="title">직업 :</td>
	        <td id="title"><%=job %></td>
	    </tr>
	</table>
	직업: <input type = "text" name = "job"> <br>
	<input type = "submit" value = "회원정보 수정">
	</form>
</body>
</html>
