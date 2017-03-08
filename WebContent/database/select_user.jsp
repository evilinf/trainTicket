<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/page_right.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="mainBg">
	<div id="menu">欢迎登陆&gt;查询</div>
	<div id="content">
	<form action="" method="post" name="">
		<label>起始站</label><input name="start" type="text" size="30"/><br>
		<label>终点站</label><input name="end" type="text" size="30"/><br>
		<input type="submit" value="查询" style="width:200px;margin-top:10px;height:30px;"/>
	</form>
	<table border=2>
	<!-- <tr><th>站点编号</th><th>站点名</th><th>车次</th><th>停留时间</th><th>到站时间</th><th>离站时间</th>
	<th>该站价格</th></tr> -->
	<tr><th>车次</th><th>出发时间</th><th>到达时间</th><th>价格</th></tr>
	<%	request.setCharacterEncoding("gb2312");
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		if(start!=null&end!=null){
			try{	Class.forName("com.mysql.jdbc.Driver");
			}catch(Exception e){}
			String url="jdbc:mysql://127.0.0.1:3306/train?"+"user=root&password=root&characterEncoding=gb2312";
			Connection con,connection;
			Statement sql,statement;
			ResultSet rs,rt;
			try{
				con=DriverManager.getConnection(url);
				sql=con.createStatement();
				rs=sql.executeQuery("SELECT * FROM site where site_name='"+start+"'");
				while(rs.next()){
					//int num=rs.getInt(1);
					//String name=rs.getString(2);
					String train=rs.getString(3);
					//String stay=rs.getString(4);
					//String dao=rs.getString(5);
					String chufa=rs.getString(6);
					float price1=rs.getFloat(7);
					connection=DriverManager.getConnection(url);
					statement=connection.createStatement();
					rt=statement.executeQuery("SELECT * FROM site where site_name='"+end+"'and site_train='"+train+"'");
					while(rt.next()){
						String dao=rt.getString(5);
						float price2=rt.getFloat(7);
						float price=price2-price1;
						out.print("<tr><td>"+train+"</td><td>"+chufa+"</td><td>"+dao+"</td>"+"<td>"+price+"</td></tr>");
					}
					//out.print("<tr><td>"+num+"</td><td>"+name+"</td><td>"+train+"</td>"+
					//"<td>"+stay+"</td><td>"+dao+"</td><td>"+chufa+"</td><td>"+price+"</td></tr>");
				}
			}catch(SQLException e){
				out.print(e);
			}
		}
	%>
	</table>
	</div>
</div>
</body>
</html>