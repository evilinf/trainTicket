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
	<div id="title"><font color="white">��ӭע���Ʊ����ϵͳ</font></div>
	<div id="register">
				<form action="" method="post" id="register_form" name="register">
					<div id="register_content">
						<label>*ע���ɫ��</label>
						<font>�˿�</font> <br>
						<label>*��&nbsp;&nbsp;&nbsp;&nbsp;����</label>
						<input type="text" name="register_name" size="20">
						<br/>
						<label>*��&nbsp;&nbsp;&nbsp;&nbsp;�룺</label>
						<input type="password" name="register_pw" size="20">
						<br/>
						<label>*�˿����ͣ�</label>
						<select name="register_type">  
  							<option value ="����">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>  
    						<option value ="ѧ��">ѧ��</option>
    						<option value ="�˲�">�˲�</option>
    						<option value ="����">����</option>
    						<option value ="��ͯ">��ͯ</option>
    						<option value ="��·">��·</option> 
    						<option value ="����">����</option>   
  						</select> <br>
  						<label>&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</label>
						<select name="register_sex">  
  							<option value ="Ů">Ů&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>  
    						<option value ="��">��</option>  
  						</select>
						<br/>
						<label>*֤�����ͣ�</label>
						<select name="register_idty">  
  							<option value ="�������֤">�������֤&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>  
    						<option value ="�۰�ͨ��֤">�۰�ͨ��֤</option>
    						<option value ="̨��ͨ��֤">̨��ͨ��֤</option>
    						<option value ="����">����</option>
  						</select> <br>
  						<label>*֤&nbsp;��&nbsp;�ţ�</label>
						<input type="text" name="register_id" size="20">
						<br/>
						<label>*��&nbsp;&nbsp;&nbsp;&nbsp;����</label>
						<input type="text" name="register_tel" size="20">
						<br/>
						<label>&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�䣺</label>
						<input type="text" name="register_mail" size="20">
						<br/>
					</div>
					<div id="right">
						<input id="register_sure" type="submit" value="ע��" name="submit">
						<!-- onClick="inputCheck()" -->
					</div>
					<div id="another"><a href="page/aregister.jsp">����Աע��</a></div>
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
		rs=sql.executeUpdate("INSERT INTO passager VALUES(null,'"+rtype+"','"+rname+"','"+idty+"','"+id+"','"+tel+"','"+mail+"','"+sex+"','"+psw+"')");
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