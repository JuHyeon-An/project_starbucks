<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script src="/starbucks/lib/jquery-3.4.1.js"></script>
    <script src="/starbucks/admin/order.js"></script>
    
    

</head>
<body>

<div id='member_main'>
	<h3>주문 목록 조회</h3>
	<form name='frm' id='frm' method='post'>
		<input type='text' name='findStr' value= '${param.findStr }' />
		<input type='button' value='검색' name='btnSelect' id='btnSelect'/>
		<div id='title'>
			<span >주문번호</span>
			<span >아이디</span>
			<span >상품코드</span>
			<span >상품갯수</span>
			<span >총가격</span>
			<span >주문날짜</span>
			<span >주문상태</span>
		</div>
	</form> 
	 	<div id='lsit'>
			<c:forEach var="vo" items="${list }"><br/>	
				<span>${vo.orderNumber}</span>
				<span>${vo.memberId}</span>
				<span>${vo.itemCode}</span>
				<span>${vo.orderNum}</span>
				<span>${vo.orderPrice}</span>
				<span>${vo.orderregDate}</span>
				<span>${vo.orderStatus}</span>	
			</c:forEach> 	
		</div>
		
		
	</div>
	
	
	

	
<script>
func();
</script>

</body>
</html>