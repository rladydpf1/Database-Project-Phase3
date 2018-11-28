<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인 페이지</title>
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
 
	String name = null;
	
	sql = String.format("SELECT Cname FROM CUSTOMER WHERE Cnumber = %d ", customer);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		name = rs.getString(1);
	}
	
%>
<h1>팀5 쇼핑몰 메인 페이지</h1>
<hr>
<%=name %>님이 로그인하셨습니다.<br>
<input type = "button" value = "회원정보 수정" onclick = "location.href = 'changeInfo.jsp'">
<input type = "button" value = "로그아웃" onclick = "location.href = 'logout.jsp'">
<input type = "button" value = "과거 구매내역 확인" onclick = "location.href = 'previousPurchase.jsp'">
<input type = "button" value = "장바구니 확인" onclick = "location.href = 'shoppingBag.jsp'">
<input type = "button" value = "상품 검색" onclick = "location.href = 'searchItem.jsp'"> <br>
<form action = "listItem.jsp" method="post">
카테고리: <select name = "big" onChange = "bigChange(this.value,small)">
			<option selected>-선택-</option>
			<option value="1">과일/견과</option>
			<option value="2">채소</option>
			<option value="3">정육/계란류</option>
			</select>
		<select name = "small">
			<option selected>-선택-</option>
			</select>
			<input type = "submit" value = "해당 카테고리 보기">
<script type = "text/javascript">
<!--
var big_num = new Array(1,2,3);
var big_name = new Array('과일/견과','채소','정육/계란류');
var small_num = new Array();
var small_name = new Array();
small_num[1] = new Array(4,5,6);
small_name[1] = new Array('사과/배', '감귤/한라봉', '감/곶감');
small_num[2] = new Array(7,8,9);
small_name[2] = new Array('두부/콩나물', '시금치/부추', '새송이/표고/버섯');
small_num[3] = new Array(10,11,12);
small_name[3] = new Array('돼지고기', '닭/오리고기', '계란/알류/가공란');
function bigChange(key,sel){
	if(key == '') return;
	var name = small_name[key];
	var val = small_num[key];
	for(i=sel.length-1; i>=0; i--) sel.options[i] = null;
	sel.options[0] = new Option('-선택-','', '', 'true');
	for(i=0; i<name.length; i++){
	 sel.options[i+1] = new Option(name[i],val[i]);
}
}
-->
</script>
</form>
</body>
</html>
