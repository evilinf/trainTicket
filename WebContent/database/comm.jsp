<%@ include file="../enter.jsp" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*,java.lang.Double.*" %>

<%
//加载驱动程序
	Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
	String url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=train";
	//数据源
	String id="root";
	String password="root";
	//建立数据库连接
	Connection conn=DriverManager.getConnection(url,id,password);
	CallableStatement callableStatement=null;
	ResultSet rs=null;
	String strSql;
	String user;//保存登录客户的ID
	String name;//登录系统的姓名
	String type;//登录系统用户类型
	
%>
