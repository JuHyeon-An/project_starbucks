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

<div class="container">
	<div></div>


</div>
<body>
<li><%=test %></li>
<script>
	Swal.fire({
		  icon: 'success',
		  title: 'Your work has been saved',
		  showConfirmButton: false,
		  timer: 1500
		})
		//history.back();
</script>
</body>
</html>