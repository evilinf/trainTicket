<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title> delete|Train Ticket</title>
<link href="../style/page_right.css" rel="stylesheet" type="text/css">
</head>
<body>
<%!	String train;String num;String date; %>
<%		request.setCharacterEncoding("gb2312");
		train=request.getParameter("train");
		num=request.getParameter("num");
		date=request.getParameter("date");
	%>
<div id="mainBg">
	<div id="menu">铁路局管理 &gt;删除票务信息</div>
	<div id="content">
		<form action="" method="post">
		<label>车次</label><input name="a_no" type="text" size="30" value="<%= train %>"/><br>
		<label>座位数量</label><input name="a_num" type="text" size="30" value="<%= num %>"/><br>
		<label>出发日期</label><input name="a_date" type="text" value="<%= date %>" size="30"/><br>
		<Input type="submit" style="width:200px;margin-top:50px;height:30px;" value="删除"/>
		</form>
	</div>	
</div>
<% 	request.setCharacterEncoding("gb2312");
	String ano=request.getParameter("a_no");
	String anum=request.getParameter("a_num");
	String adate=request.getParameter("a_date");
	if(ano!=null&&anum!=null&&adate!=null){
	try{	Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){}
	String url="jdbc:mysql://127.0.0.1:3306/train?"+"user=root&password=root&characterEncoding=gb2312";
	Connection con;
	Statement sql;
	int rs;
	try{
		con=DriverManager.getConnection(url);
		sql=con.createStatement();
		rs=sql.executeUpdate("DELETE FROM announce WHERE Announce_train='"+train+"' and Announce_date='"+date+"'");
		if(rs>0){
			out.print("成功删除");
		}else{
			out.print("删除失败");
	}
	}catch(SQLException e){
		out.print(e);
	}
	}
%>
</body>
</html>