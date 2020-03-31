<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<select id="categorySelect" class="select-custom" onchange="loadTable();">
		<option value="">전체</option>
		<option value=“1” <c:if test="${vo.orderStatus eq 1}">selected</c:if>>주문취소</option>
		<option value=“2” <c:if test="${vo.orderStatus eq 2}">selected</c:if>>승인대기</option>
		<option value=“3” <c:if test="${vo.orderStatus eq 3 }">selected</c:if>>주문완료</option>

	</select>
</body>
</html>