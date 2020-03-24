<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<% String group = (String)request.getAttribute("group"); 
   String test = (String)request.getAttribute("msg");

%>
</head>
<body>
<li><%=group %></li>
<li><%=test %></li>
</body>
</html>