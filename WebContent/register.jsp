<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style/register.css" rel="stylesheet" type="text/css">
<title>register|Train Ticket</title>
<script type="text/javascript">
function transfer(){
	self.location.href='database/success.jsp';
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
						<font>乘客</font> <br>
						<label>*姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						<input type="text" name="register_name" size="20">
						<br/>
						<label>*密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
						<input type="password" name="register_pw" size="20">
						<br/>
						<label>*乘客类型：</label>
						<select name="register_type">  
  							<option value ="成人">成人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>  
    						<option value ="学生">学生</option>
    						<option value ="伤残">伤残</option>
    						<option value ="军人">军人</option>
    						<option value ="儿童">儿童</option>
    						<option value ="铁路">铁路</option> 
    						<option value ="特种">特种</option>   
  						</select> <br>
  						<label>&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<select name="register_sex">  
  							<option value ="女">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>  
    						<option value ="男">男</option>  
  						</select>
						<br/>
						<label>*证件类型：</label>
						<select name="register_idty">  
  							<option value ="二代身份证">二代身份证&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>  
    						<option value ="港澳通行证">港澳通行证</option>
    						<option value ="台湾通行证">台湾通行证</option>
    						<option value ="护照">护照</option>
  						</select> <br>
  						<label>*证&nbsp;件&nbsp;号：</label>
						<input type="text" name="register_id" size="20">
						<br/>
						<label>*电&nbsp;&nbsp;&nbsp;&nbsp;话：</label>
						<input type="text" name="register_tel" size="20">
						<br/>
						<label>&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
						<input type="text" name="register_mail" size="20">
						<br/>
					</div>
					<div id="right">
						<input id="register_sure" type="submit" value="注册" name="submit">
						<!-- onClick="inputCheck()" -->
					</div>
					<div id="another"><a href="page/aregister.jsp">管理员注册</a></div>
				</form>
			</div>		
</div>
<%	request.setCharacterEncoding("gb2312");
	String rname=request.getParameter("register_name");
	String psw=request.getParameter("register_pw");
	String rtype=request.getParameter("register_type");
	String sex=request.getParameter("register_sex");
	String idty=request.getParameter("register_idty");
	String id=request.getParameter("register_id");
	String tel=request.getParameter("register_tel");
	String mail=request.getParameter("register_mail");
	if(rname==null||rname.equals("")||psw==null||psw.equals("")||id==null||id.equals("")||tel==null||tel.equals("")||mail==null||mail.equals("")){
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
		rs=sql.executeUpdate("INSERT INTO passager VALUES(null,'"+rtype+"','"+rname+"','"+idty+"','"+id+"','"+tel+"','"+mail+"','"+sex+"','"+psw+"')");
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