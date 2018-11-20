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
<form action = "updateInfo.jsp" method="post">
	아이디는 바꿀 수 없습니다. <br>
	패스워드(5~10자): <input type = "password" name = "passwd"><br>
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
	휴대전화(- 포함해서 입력): <input type = "text" name = "phone"><br>
	성별: <select name = "sex" >
			<option value="M">남자</option>
			<option value="F">여자</option>
			</select> <br>
	나이: <input type = "text" name = "age"> <br>
	직업: <input type = "text" name = "job"> <br>
	<input type = "submit" value = "회원정보 수정">
	</form>
</body>
</html>
