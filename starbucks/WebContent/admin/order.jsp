<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../layout/header_admin.jsp" %>
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

<form name='frm' id='frmm' method='post'>
<input type='text' name='findStr' value= '${param.findStr }' />
<input type='button' value='검색' name='btnSelect' id='btnSelect'/>
<input type='text' name='nowPage' id='nowPage' value='${param.nowPage }'/>
</form>
<div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
	                <h2 class="tm-block-title">Orders List</h2>
	                <table class="table">
	                
	                    <thead>
	                        <tr>
	                            <th scope="col">주문번호</th>
	                            <th scope="col">아이디</th>
	                            <th scope="col">상품코드</th>
	                            <th scope="col">상품갯수</th>
	                            <th scope="col">총가격</th>
	                            <th scope="col">주문날짜</th>
	                            <th scope="col">주문상태</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    <div id='list'>
								<c:forEach var="vo" items="${list }">	
	                        <tr>
	                          
	                           <td><b>${vo.orderNumber}</b></td>
	                            <td><b>${vo.memberId}</b></td>
	                            <td><b>${vo.itemCode}</b></td>
	                            <td>${vo.orderNum}</td>
	                            <td>${vo.orderPrice}</td>
	                            <td>${vo.orderregDate}</td>
	                            <td>${vo.orderStatus}</td>
	                         <tr/>
	                   	 </c:forEach>	
						</div>
	                   
	                    
	                    </tbody>
	                </table>
	            </div>

<<<<<<< HEAD
	
		<div id='page'>
		<c:if test="${page.nowPage >1}">
			<input type='button' value='이전' onclick='goPage(${page.nowPage -1})'/>
		</c:if>
=======
<div id='member_main'>
	<h3>주문 목록 조회</h3>
	<form name='frm' id='frm' method='post'>
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
		</div>
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
			<c:if test="${page.nowPage >1}">
					<input type='button' value='이전' onclick='goPage(${page.nowPage -1})'/>
				</c:if>
				
				<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
					<input type='button' value='${i }' onclick='goPage(${i })'/>
				</c:forEach>	
				
				<c:if test="${page.nowPage<page.totPage }">
				<input type='button' value='다음' onclick='goPage(${page.nowPage +1})'/>
				</c:if>	
		</div>
>>>>>>> 68992bd81564c6cf25eea9af48286e0ac56009fe
		
	</form> 
		
	</div>

<script>
func();
</script>
</body>
</div>
</html>
<%@include file="../layout/footer_admin.jsp" %>