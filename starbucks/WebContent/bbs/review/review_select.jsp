<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
                <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
<h3>리뷰 조회</h3><h3>리뷰 조회</h3><h3>리뷰 조회</h3><h3>리뷰 조회</h3><h3>리뷰 조회</h3>
</div>

<c:forEach var="vo" items="${list }">
	<span>${vo.review_postnum }</span>
	<span>${vo.member_id }</span>
	<span>${vo.item_code }</span>
	<span>${vo.review_title }</span>
	<span>${vo.review_content }</span>
	<span>${vo.review_like }</span>
	<c:set var="imgs" value="${vo.review_img }"/>
	<c:forEach var="img" items="${imgs.sys_imgs}">
		<span>${img }</span>
	</c:forEach>	


</c:forEach>

</body>
</html>