<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%
   String test = (String)request.getAttribute("msg");

%>
</head>
<body>
<li><%=test %></li>
</body>
</html>