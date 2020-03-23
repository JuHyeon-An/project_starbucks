<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header_admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
<div id='member_main'>
	<h3>주문 목록 조회</h3>
	<form name='frm' id='frm' method='post'>
		<input type='text' name='findStr' value=''/>
		<input type='submit' value='검색' name='btnFind' id='btnFind'>
		<div>
			
		
		
		</div>		
		
				
	
	</form> 
		<div id='title'>
			<span class='orderNo' >주문번호</span>
			<span class='orderNo' >아이디</span>
			<span class='orderNo' >상품코드</span>
			<span class='orderNo' >상품  갯수</span>
			<span class='orderNo' >총가격</span>
			<span class='orderNo' >주문날짜</span>
			<span class='orderNo' >주문상태</span>
		</div>
	
</div>

</html>
<%@include file="../layout/footer_admin.jsp" %>