<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../layout/header_admin.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style>
.here{
	background-color:#00ff00;
}
.ho{
	backgroud-color:#0000ff;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="/starbucks/lib/jquery-3.4.1.js"></script>
    <script src="/starbucks/admin/order.js"></script>

   
</head>
<body>


<div id='member_main'>
	<h3>주문 목록 조회</h3>
	<form name='frm' id='frmm' method='post'>
		<input type='text' name='findStr' value= '${param.findStr }' />
		<input type='button' value='검색' name='btnSelect' id='btnSelect'/>
		<input type='text' name='nowPage' id='nowPage' value='${param.nowPage }'/>
		<div id='title'>
			<span >주문번호</span>
			<span >아이디</span>
			<span >상품코드</span>
			<span >상품갯수</span>
			<span >총가격</span>
			<span >주문날짜</span>
			<span >주문상태</span>
		
		<p/>
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
			
	</form> 
	
		<div id='page'>
		<c:if test="${page.nowPage >1}">
			<input type='button' value='이전' onclick='goPage(${page.nowPage -1})'/>
		</c:if>
		
		<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			<input type='button' value='${i }'
			${ (i== page.nowPage)? "class='here'" : "class = 'ho'" }
			 onclick='goPage(${i })'/>
			
		</c:forEach>	
		
		<c:if test="${page.nowPage<page.totPage }">
			<input type='button' value='다음' onclick='goPage(${page.nowPage +1})'/>
		</c:if>
	</div>
	
	</div> 
	


<script>
func();
</script>
</body>
</html>
<%@include file="../layout/footer_admin.jsp" %>












    