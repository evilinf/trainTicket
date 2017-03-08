<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/register.css" rel="stylesheet" type="text/css">
<title>register|Train Ticket</title>
<script type="text/javascript">
function transfer(){
	self.location.href='../database/success.jsp';
}
</script>
</head>
<body>
<div id="content">
	<div id="title"><font color="white">欢迎注册火车票管理系统</font></div>
	<div id="register">
				<form action="" method="post" id="register_form" name="register">
					<div id="register_content">
						<label>*注册角色：</label>
						<font>铁路局管理员</font> <br>
						<label>*姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						<input type="text" name="aregister_name" size="20">
						<br/>
						<label>*密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
						<input type="password" name="aregister_pw" size="20">
						<br/>
  						<label>&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<select name="aregister_sex">  
  							<option value ="女">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>  
    						<option value ="男">男</option>  
  						</select>
						<br/>
						<label>*工作单位：</label>
						<input type="text" name="aregister_addr" size="20">
						<br/>
						<label>*电&nbsp;&nbsp;&nbsp;&nbsp;话：</label>
						<input type="text" name="aregister_tel" size="20">
						<br/>
						<label>&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
						<input type="text" name="register_mail" size="20">
						<br/>
					</div>
					<div id="right">
						<input id="aregister_sure" type="submit" value="注册">
					</div>
				</form>
			</div>		
</div>
<%	request.setCharacterEncoding("gb2312");
	String aname=request.getParameter("aregister_name");
	String apsw=request.getParameter("aregister_pw");
	String addr=request.getParameter("aregister_addr");
	String atel=request.getParameter("aregister_tel");
	String asex=request.getParameter("aregister_sex");
	if(aname==null||aname.equals("")||apsw==null||apsw.equals("")||addr==null||addr.equals("")||atel==null||atel.equals("")||asex==null||asex.equals("")){
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
		rs=sql.executeUpdate("INSERT INTO manager VALUES(null,'"+aname+"','"+asex+"','"+atel+"','"+addr+"','"+apsw+"')");
		if(rs>0){ %>
		<script type="text/javascript">transfer();</script>
<% 		}else{
		out.print("输入有错");
	}
	}catch(SQLException e){
		out.print(e);
	}
}
%>
</body>
</html>
