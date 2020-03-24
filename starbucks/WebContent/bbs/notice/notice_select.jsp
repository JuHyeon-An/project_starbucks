<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <!-- 내가 추가 -->
	<script src="/starbucks/lib/jquery-3.4.1.js"></script>
    <script src="/starbucks/js/notice.js"></script>
    
</head>
<body>
<div id='main'>
	<div id='nav'>
		<form name='frm' id='frm' method='post'>
			<input type='text' name='findStr' value='${param.findStr }'/>
			<input type='button' name='btnSelect' id='btnSelect' value='검색'/>
			<input type='text' name='nowPage' id='nowPage' value='${param.nowPage }'/>	
			<p/>
			<label>no</label>
			<label>작성자</label>
			<label>제목</label>
			<label>등록일</label>
			<label>조회수</label>
			<p/>
			<div id='list'>
				<c:forEach var="vo" items="${list }">
				<span>${vo.noticePostNum }</span>
				<span>${vo.memberName }</span>
				<span>${vo.noticeTitle }</span>
				<span>${vo.noticeRegDate }</span>
				<span>${vo.noticeView }</span><br/>
				<input type='hidden' name='memberId' value='${vo.memberId }'/>
				<input type='hidden' name='noticeContent' value='${vo.noticeContent }'/>	
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
		</form>
	</div>
</div>
<script>
func();
</script>
</body>
</html>