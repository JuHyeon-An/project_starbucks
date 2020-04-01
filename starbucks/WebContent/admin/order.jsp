<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/starbucks/lib/jquery-3.4.1.js"></script>
<script src="/starbucks/admin/order.js"></script>


</head>
<body>
	<form name='frm' id='frmm' method='post'  style='margin:130px'>
	 	
		 
<div id="mainDiv" class="tm-bg-primary-dark tm-block tm-block-products">


		<h2 class="tm-block-title text-center">Orders List</h2>
		<div class='row'>

			<div class='col-lg-7'></div>

			<div class='btn-xs mb-2 input-group col-lg-5'>
	
	 	
	 	<select name="orderStatus" id="categorySelect" class="select-custom " onchange="LoadSelect();" >
			<option value="">전체</option>
		  <option value= "1" >주문취소</option>
		  <option value= "2" >승인대기</option>
		  <option value= "3" >주문완료</option>
		</select>

				<input type='text' name='findStr' value='${param.findStr }'
					id='findStr' class="form-control validate 2"
					placeholder='주문번호 또는 아이디를 검색해주세요' />
				<input type='button'
					value='검색' name='btnSelect' id='btnSelect'
					class='input-group-text search-span' /> 
				<input type='hidden'
					name='nowPage' id='nowPage'
					value='${empty param.nowPage? 1 : param.nowPage}' />
					
			</div>
		</div>
<div id = "tableContainer" class="tm-product-table-containersw">
		<table id='ordertable' class="table">
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
				
				<c:forEach var="vo" items="${list }">

					<tr id='list'
						onclick="view('${vo.orderNumber}','${vo.memberId }','${vo.itemCode }','${vo.orderNum } ', '${vo.orderPrice}', '${vo.orderregDate}', '${vo.orderStatus}'  )">

						<td><b>${vo.orderNumber}</b></td>
						<td><b>${vo.memberId}</b></td>
						<td><b>${vo.itemCode}</b></td>
						<td>${vo.orderNum}</td>
						<td>${vo.orderPrice}</td>
						<td>${vo.orderregDate}</td>
						<td><c:if test="${vo.orderStatus eq 1}">주문취소</c:if> <c:if
								test="${vo.orderStatus eq 2}">승인대기</c:if> <c:if
								test="${vo.orderStatus eq 3 }">주문완료</c:if></td>

					</tr>

				</c:forEach>
			</tbody>

</table>


		

		<div id='page' class='text-center mt-1'>
			<c:if test="${page.nowPage >1}">
				<input type='button' value='이전' onclick='goPage(${page.nowPage -1})'
					class='btn-sm btn-ok' />
			</c:if>

			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
				<input type='button' value='${i }' 
					class='${ (i== page.nowPage)? "btn-sm btn-sw" : "btn-sm btn-ok" }' 
					onclick='goPage(${i })' />

			</c:forEach>

			<c:if test="${page.nowPage<page.totPage }">
				<input type='button' value='다음' onclick='goPage(${page.nowPage +1})'
					class='btn-sm btn-ok' />
			</c:if>
		</div>
		</div>
		<input type='hidden' name='orderNumber' id='orderNumber' />
		<input type='hidden' name='memberId' id='memberId' />
		<input type='hidden' name='itemCode' id='itemCode' />
		<input type='hidden' name='orderNum' id='orderNum' />
		<input type='hidden' name='orderPrice' id='orderPrice' />
		<input type='hidden' name='orderregDate' id='orderregDate' />
		<input type='hidden' name='orderStatus' id='orderStatus' />
		
		</form>
</div>
	<script>
func();
$('#orderNav').addClass('active');

</script>
</body>
</html>
