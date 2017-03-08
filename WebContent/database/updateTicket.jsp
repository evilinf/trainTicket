<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title> update|Train Ticket</title>
<link href="../style/page_right.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="mainBg">
	<%!	String train,num,date;%>
	<%	request.setCharacterEncoding("gb2312");
		train=request.getParameter("train");
		num=request.getParameter("num");
		date=request.getParameter("date");
	%>
	<div id="menu">铁路局管理 &gt;修改票务信息</div>
	<div id="content">
	<form action="" method="post" name="">
		
		<label>车次</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong ><%= train %></strong><br>
		<label>出发日期</label>&nbsp;<strong ><%= date %></strong><br>
		<label>座位数量</label>&nbsp;<input name="unum" type="text" size="30" value="<%= num %>"/><br>
		<input type="submit" value="修改" style="width:200px;margin-top:50px;height:30px;"/>
		</form>
	</div>
	<%	request.setCharacterEncoding("gb2312");
		String unum=request.getParameter("unum");
		if(unum!=null&&!unum.equals(num)){
			int numbe=Integer.parseInt(unum);
			try{	Class.forName("com.mysql.jdbc.Driver");
			}catch(Exception e){}
			String url="jdbc:mysql://127.0.0.1:3306/train?"+"user=root&password=root&characterEncoding=gb2312";
			Connection con;
			Statement sql;
			int rs;
			try{
				con=DriverManager.getConnection(url);
				sql=con.createStatement();
				rs=sql.executeUpdate("UPDATE announce SET Announce_seat="+numbe+" WHERE Announce_train='"+train+"' AND Announce_date='"+date+"'");
				if(rs>0){
					out.print("更新成功");
					num=unum;
				}else{
					out.print("更新失败");
			}
			}catch(SQLException e){
				out.print(e);
			}
		}else{
			//out.print("没有修改，不需要更新数据库");
		}
	%>
</div>
</body>
</html>