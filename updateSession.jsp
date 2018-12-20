<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>좌석 현황 업데이트</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
</head>
<body class="bg-2dark">
<%
	String restaurant = "";
	try {
		restaurant = (String)session.getAttribute("restaurant");
	}
	catch (Exception e) {
		%>
		<script>
		alert('로그인 해주세요.')
		location.href = 'login.jsp'
		</script>
		<%
	}
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	String sql;
	String user = "hymi54";
	String pswd = "br0409";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pswd);
	
	String temp = request.getParameter("max");
	int max = Integer.parseInt(temp);
	if(max<=0){
		%>
		<script>
		alert('0 또는 음수는 총 좌석 수가 될 수 없습니다.')
		location.href = 'updateSeat.jsp'
		</script>
		<%
	}
	temp = request.getParameter("cur");
	int cur = Integer.parseInt(temp);
	if(cur>max){
		%>
		<script>
		alert('좌석 현황은 총 좌석 수보다 클 수 없습니다.')
		location.href = 'updateSeat.jsp'
		</script>
		<%
	}
	sql = String.format("update curSeat set maxSeat = %d, curSeat = %d WHERE resNum = '%s' ", max, cur, restaurant);
	System.out.println(temp);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	conn.close();
	%>
	<script>
	alert('업데이트 완료')
	location.href = 'updateSeat.jsp'
	</script>
</body>
</html>