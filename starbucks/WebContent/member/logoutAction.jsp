

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html" charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		alert("로그아웃 되었습니다.");
		location.href = '/starbucks/index.jsp';
// 				Swal.fire({
// 					  icon: 'error',
// 					  title: 'logout...',
// 					  text: '로그아웃 되었습니다..',
// 					  confirmButtonText: "<a href='/starbucks/index.jsp' style='text-decoration:none; color:#fff;'>확인</a>",
// 					  allowOutsideClick :  false 
// 					})
	</script>

</body>
</html>