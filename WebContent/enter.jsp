<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>enter|Train Ticket</title>
<link href="style/enter.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function prompt(){
		alter("密码有误，或者角色不对，没有注册的请注册！！！");
	}
	function transfer(){
		self.location.href='page/index.jsp';
	}
	function userTransfer(){
		self.location.href='page/user.jsp';
	}
</script>
</head>
<body>
	<div id="enter">
		<div id="enter_t">
			<div id="title">
				<div id="tp"><img src="img/logo.jpg" width="65" height="65"/></div>
				<div id="tw">Ticket</div>
				<div id="text">登录</div>
			</div>
			<div id="line"></div>
			<div id="lg">
				<form action="" method="post" id="form" name="form">
					<div id="left">
						<label>用&nbsp;户&nbsp;名：</label>
						<input type="text" name="enter_name" size="20">
						<br/>
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
						<input type="password" name="enter_psw" size="20">
						<br/>
						<label>登录角色：</label>
						<select style="width:150px;height:23px;" name="enter_actor">  
  							<option value ="乘客">乘客</option>  
    						<option value ="管理员">管理员</option>    
  						</select>  
					</div>
					<div id="right">
						<a href="register.jsp">注册</a>
						<input id="an" type="submit" value="登录">
					</div>
				</form>
			</div>			
		</div>
	</div>
</body>
<%	request.setCharacterEncoding("gb2312");
	String ename=request.getParameter("enter_name");
	String epsw=request.getParameter("enter_psw");
	String actor=request.getParameter("enter_actor");
	if(ename==null||ename.equals("")||epsw==null||epsw.equals("")){
		out.print("请填写完整!!!");
	}else{
	try{Class.forName("com.mysql.jdbc.Driver");}
	catch(Exception e){}
	String uri="jdbc:mysql://127.0.0.1/train?"+"user=root&password=root&characterEncoding=gb2312";
	Connection con;
	Statement sql;
	ResultSet set;
	String rs;
	try{
		con=DriverManager.getConnection(uri);
		sql=con.createStatement();
		out.print("测试");
		if(actor.equals("乘客")){
			set=sql.executeQuery("SELECT passagerPsw FROM passager WHERE PassagerName= '"+ ename+"'" );
		}else{
			set=sql.executeQuery("SELECT ManagerPsw FROM manager WHERE ManagerName= '"+ ename+"'" );
		}
		rs=null;
		while(set.next()){
			rs=set.getString(1);
		}
		if(rs==null){%>
			<script type="text/javascript">prompt();</script>
<%		}else{
		if(rs.equals(epsw)){ 
			session.setAttribute("name", ename); 
			if(actor.equals("乘客")){ %>
			<script type="text/javascript">userTransfer();</script>
		<%	
			}else{%>
			<script type="text/javascript">transfer();</script>
<%		}}else{ %>
			<script type="text/javascript">prompt();</script>
<%		}}
	}catch(SQLException e){
		out.println(e);
	}
}
%>
</html>