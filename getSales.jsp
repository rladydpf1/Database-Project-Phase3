<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*, java.util.Date, java.util.Calendar, java.text.SimpleDateFormat" %>
<%!
	public boolean checkValid(int year, int month, int day) {
	if (month > 12 || month < 1) return false;
	int[] mdays = new int[13];
	mdays[1]=31;mdays[2]=28;mdays[3]=31;mdays[4]=30;mdays[5]=31;mdays[6]=30; 
	mdays[7]=31;mdays[8]=31;mdays[9]=30;mdays[10]=31;mdays[11]=30;mdays[12]=31;
	if ((year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0)))//윤년 판단 
    {
        mdays[2] = 29;//2월달의 날 수를 29로 설정 
    }
	if (mdays[month] < day || day < 1) return false;
	return true;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get sales</title>
</head>
<body>
<h2>매출 확인 페이지</h2>
<%
String manager = null;
manager = (String)session.getAttribute("id");
if (manager == null) {
	%>
	<script>
	alert('당신은 매니저가 아닙니다.')
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
String start = null, finish = null;
start = request.getParameter("start");
finish = request.getParameter("finish");
if (start.isEmpty()) start = "2016-10-01";
if (finish.isEmpty()) finish = "2018-12-31";
SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
Date from = null, to = null;
try {
	from = format.parse(start);
	to = format.parse(finish);
	int year = Integer.parseInt(start.substring(0, 4));
	int month = Integer.parseInt(start.substring(5, 7));
	int day = Integer.parseInt(start.substring(8, 10));
	if (!checkValid(year, month, day)) {
		throw new Exception();
	}
	int year2 = Integer.parseInt(finish.substring(0, 4));
	int month2 = Integer.parseInt(finish.substring(5, 7));
	int day2 = Integer.parseInt(finish.substring(8, 10));
	if (!checkValid(year2, month2, day2)) {
		throw new Exception();
	}
	if (year > year2) throw new Exception();
	else if (year == year2) {
		if (month > month2) throw new Exception();
		else if (month == month2) {
			if (day > day2) throw new Exception();
		}
	}
}
catch (Exception e) {
	%>
	<script>
	alert('제대로 된 날짜를 입력해주세요.')
	location.href = 'manager.jsp'
	</script>
	<%
}
System.out.println(start);
System.out.println(finish);
sql = String.format("CREATE OR REPLACE VIEW D_sales AS " +
					"SELECT Sum(Oquantity) as SO, Ino FROM ORDER1 WHERE DATE(Odate) BETWEEN '%s' AND '%s' GROUP BY Ino", start, finish);
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();
sql = String.format("SELECT SUM(Price * So) FROM D_sales Join ITEM On Ino = Inumber");
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
int total = 0;
while (rs.next()) {
	total = rs.getInt(1);
}
%>
<h3><%=start %> ~ <%=finish %></h3>
<h3>매출 = <%=total %>원 </h3>
</body>
</html>
