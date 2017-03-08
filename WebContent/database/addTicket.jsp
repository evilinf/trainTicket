<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title> add|Train Ticket</title>
<link href="../style/page_right.css" rel="stylesheet" type="text/css">
</head>
<body>
<% 	Date today=new Date();
	DateFormat nowDate=DateFormat.getDateInstance();
	String todayDate=nowDate.format(today);	
%>
<div id="mainBg">
	<div id="menu">铁路局管理 &gt;添加新的票务信息</div>
	<div id="content">
	<form action="" method="post" name="">
		<label>车次</label><input name="a_no" type="text" size="30"/><br>
		<label>座位数量</label><input name="a_num" type="text" size="30"/><br>
		<label>出发日期</label><input name="a_date" type="text" value="<%= todayDate %>" size="30"/><br>
		<input type="submit" value="添加" style="width:200px;margin-top:50px;height:30px;"/>
		</form>
	</div>		
</div>
<%	request.setCharacterEncoding("gb2312");
	String ano=request.getParameter("a_no");
	String anum=request.getParameter("a_num");
	String adate=request.getParameter("a_date");
	if(ano==null||ano.equals("")||anum==null||anum.equals("")||adate==null||adate.equals("")){
		out.print("请填写完整!!!");
	}else{
		int num=Integer.parseInt(anum);
	try{	Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){}
	String url="jdbc:mysql://127.0.0.1:3306/train?"+"user=root&password=root&characterEncoding=gb2312";
	Connection con;
	Statement sql;
	int rs;
	try{
		con=DriverManager.getConnection(url);
		sql=con.createStatement();
		rs=sql.executeUpdate("INSERT INTO announce VALUES('"+ano+"','"+adate+"',"+num+")");
		if(rs>0){
			out.print("添加成功");
		}else{
			out.print("输入有错");
	}
	}catch(SQLException e){
		out.print(e);
	}
}
%>
</body>
</html>