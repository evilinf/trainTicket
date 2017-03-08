<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/page_right.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="mainBg">
	<div id="menu">铁路局管理 &gt;查看全部的票务信息</div>
	<form method="get">
	<table border=1>
		<tr><th>车次</th><th>出发日期</th><th>座位数量</th><th>操作</th></tr>
		<%	try{	Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){}
	String url="jdbc:mysql://127.0.0.1:3306/train?"+"user=root&password=root&characterEncoding=gb2312";
	Connection con;
	Statement sql;
	ResultSet rs;
	try{
		con=DriverManager.getConnection(url);
		sql=con.createStatement();
		rs=sql.executeQuery("SELECT * FROM announce");
		while(rs.next()){
			String train=rs.getString(1);
			Date date=rs.getDate(2);
			int num=rs.getInt(3);
			out.print("<tr><td>"+train+"</td><td>"+date+"</td><td>"+num+"</td><td><a href="+
			"../database/updateTicket.jsp?train="+train+"&date="+date+"&num="+num+">修改</a>"+
			"<a href="+"../database/deleteTicket.jsp?train="+train+"&date="+date+"&num="+num+">删除</a></td></tr>");
		}
	}catch(SQLException e){
		out.print(e);
	}
%>
	</table></form>	
</div>

</body>
</html>