<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title> add|Train Ticket</title>
<link href="../style/page_right.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="mainBg">
	<div id="menu">铁路局管理 &gt;添加车次</div>
	<div id="content">
	<form action="" method="post" name="">
		<label>火车类型</label>
		<select name="train_type">
		<option value="K快速">K快速</option>
		<option value="T/N特快">T/N特快</option>
		<option value="Z直达">Z直达</option>
		<option value="D动车">D动车</option>
		<option value="G高铁">G高铁</option></select><br>
		<label>车次编号</label><input name="train_num" type="text" size="30"/><br>
		<label>起始站</label><input name="train_start" type="text" size="30"/><br>
		<label>终点站</label><input name="train_end" type="text" size="30"/><br>
		<label>历经时长</label><input name="train_time" type="text" size="30"/><br>
		<input type="submit" value="添加" style="width:200px;margin-top:10px;height:30px;"/>
		</form>
	</div>	
</div>
<%	request.setCharacterEncoding("gb2312");
	String ttype=request.getParameter("train_type");
	String tnum=request.getParameter("train_num");
	String tstart=request.getParameter("train_start");
	String tend=request.getParameter("train_end");
	String ttime=request.getParameter("train_time");
	if(tnum==null||tnum.equals("")||tstart==null||tstart.equals("")||tend==null||tend.equals("")||ttime==null||ttime.equals("")){
		out.print("请填写完整!!!");
	}else{
	try{	Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){}
	String url="jdbc:mysql://127.0.0.1:3306/train?"+"user=root&password=root&characterEncoding=gb2312";
	Connection con;
	Statement sql;
	int rs;
	try{
		con=DriverManager.getConnection(url);
		sql=con.createStatement();
		rs=sql.executeUpdate("INSERT INTO train VALUES('"+ttype+"','"+tnum+"','"+tstart+"','"+tend+"','"+ttime+"')");
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