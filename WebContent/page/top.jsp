<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/page_top.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function show(){
		parent.location.href="../enter.jsp";
	}
</script>
</head>
<body>
<div id="top">
	<div id="topRight">
		<div id="exit">
			<ul>
				<li><input type="button"  value="退出" onclick="show()"/></li>
				<li><% 	String name=(String)session.getAttribute("name");
						out.print(name);
				%></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>