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
	<div id="menu">铁路局管理 &gt;添加站点信息</div>
	<div id="content">
	<form action="" method="post" name="">
		<label>站次编号</label><input name="site_num" type="text" size="30"/><br>
		<label>站点名字</label><input name="site_name" type="text" size="30"/><br>
		<label>通行车次</label><input name="site_train" type="text" size="30"/><br>
		<label>停留时长</label><input name="site_time" type="text" size="30"/><br>
		<label>到站时间</label><input name="site_dao" type="text" size="30"/><br>
		<label>出发时间</label><input name="site_chufa" type="text" size="30"/><br>
		<label>该站票价</label><input name="site_price" type="text" size="30"/><br>
		<input type="submit" value="添加" style="width:200px;margin-top:10px;height:30px;"/>
		</form>
	</div>		
</div>
<%	request.setCharacterEncoding("gb2312");
	String num=request.getParameter("site_num");
	String sname=request.getParameter("site_name");
	String strain=request.getParameter("site_train");
	String stime=request.getParameter("site_time");
	String sdao=request.getParameter("site_dao");
	String schufa=request.getParameter("site_chufa");
	String price=request.getParameter("site_price");
	if(num==null||num.equals("")||sname==null||sname.equals("")||strain==null||strain.equals("")){
		out.print("请填写完整!!!");
	}else{
		int snum=Integer.parseInt(num);
		float sprice=0;
		if(price!=null&&(!price.equals(""))){
			sprice=Float.parseFloat(price);
		}
		
	try{	Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){}
	String url="jdbc:mysql://127.0.0.1:3306/train?"+"user=root&password=root&characterEncoding=gb2312";
	Connection con;
	Statement sql;
	int rs;
	try{
		con=DriverManager.getConnection(url);
		sql=con.createStatement();
		rs=sql.executeUpdate("INSERT INTO site VALUES("+snum+",'"+sname+"','"+strain+"','"+stime+"','"+sdao+"','"+schufa+"',"+sprice+")");
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