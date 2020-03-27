<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="/starbucks/lib/jquery-3.4.1.js"></script>
    <script src="/starbucks/admin/order.js"></script>
</head>
<body>
${msg }

	<div id='member_main'>
	<form name='frmm' id='frmm' method='post'>
	<input type='button' value='목록'	 id='btnSelect'>
	<input type='text' name='findStr' value='${findStr }'>
	<input type='text' name='nowPage' value='${param.nowPage }'>
	</form>
	</div>
	<script>
		func();
	</script>
</body>
</html>