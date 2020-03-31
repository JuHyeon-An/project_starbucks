
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
    <%
        String message = (String) request.getAttribute("msg");
 
        if (message.indexOf("사용가능한") != -1) {
    %>
 
    <span style="color: blue;"><%=message%> </span>
 
    <%
        } else {
    %>
 
    <span style="color: red;"><%=message%></span>
 
    <%
        }
    %>



</body>
</html>