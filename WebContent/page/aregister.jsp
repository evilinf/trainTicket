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
	<div id="title"><font color="white">��ӭע���Ʊ����ϵͳ</font></div>
	<div id="register">
				<form action="" method="post" id="register_form" name="register">
					<div id="register_content">
						<label>*ע���ɫ��</label>
						<font>��·�ֹ���Ա</font> <br>
						<label>*��&nbsp;&nbsp;&nbsp;&nbsp;����</label>
						<input type="text" name="aregister_name" size="20">
						<br/>
						<label>*��&nbsp;&nbsp;&nbsp;&nbsp;�룺</label>
						<input type="password" name="aregister_pw" size="20">
						<br/>
  						<label>&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</label>
						<select name="aregister_sex">  
  							<option value ="Ů">Ů&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>  
    						<option value ="��">��</option>  
  						</select>
						<br/>
						<label>*������λ��</label>
						<input type="text" name="aregister_addr" size="20">
						<br/>
						<label>*��&nbsp;&nbsp;&nbsp;&nbsp;����</label>
						<input type="text" name="aregister_tel" size="20">
						<br/>
						<label>&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�䣺</label>
						<input type="text" name="register_mail" size="20">
						<br/>
					</div>
					<div id="right">
						<input id="aregister_sure" type="submit" value="ע��">
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
		out.print("����д����!!!");
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
		out.print("�����д�");
	}
	}catch(SQLException e){
		out.print(e);
	}
}
%>
</body>
</html>
