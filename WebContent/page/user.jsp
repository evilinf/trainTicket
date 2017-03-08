<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>User|Train Ticket</title>
</head>
<frameset rows="75,*" cols="*" frameborder="no" border="0" framespacing="0">
	<frame src="top.jsp" name="togFrame" scrolling="No" noresize="noresize" id="topFrame" 
	title="topFrame"/>
	<frameset rows="*" cols="230,*" framespacing="0" frameborder="no" border="0">
		<frame src="title.jsp" name="leftFrame" scrolling="no" noresize="noresize" 
		id="leftFrame" title="leftFrame" />
		<frame src="../database/select_user.jsp" title="mainFrame" name="mainFrame" id="mainFrame" />
	</frameset>
</frameset>
<noframes>
</noframes>
<body>

</body>
</html>