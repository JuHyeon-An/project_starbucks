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
<div id='main'>
<form name='notice' id='notice' method='post'>
	<div id='info'>
			<input type='text' name='findStr' value='${param.findStr }'/>
			<input type='button' name='btnSelect' id='btnSelect' value='검색'/>
			<input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'/>
	</div>
	<p/>
	<div id='contents'>
		<label>no</label>
		<label>작성자</label>
		<label>제목</label>
		<label>등록일</label>
		<label>조회수</label>
	<p/>
		<c:forEach var="vo" items="${list }">
			<div id='list' onclick="view('${vo.noticeTitle}','${vo.memberName }','${vo.noticeContent }','${vo.noticeRegDate } ')">
				<span>${vo.noticePostNum }</span>
				<span>${vo.memberName }</span>
				<span>${vo.noticeTitle }</span>
				<span>${vo.noticeRegDate }</span>
				<span>${vo.noticeView }</span>
				<input type='hidden' name='noticeTitle' id='noticeTitle' />
				<input type='hidden' name='memberName' id='memberName'/>
				<input type='hidden' name='noticeContent' id='noticeContent'/>	
				<input type='hidden' name='noticeRegDate' id='noticeRegDate'/>	
			</div>
		</c:forEach>
	</div>
</form>
	<div id='page'>
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
</div>
<script>
</script>
</body>
</html>