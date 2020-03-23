<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<input type='text' name='findStr'/>
			<input type='button' name='btnSelect' id='btnSelect' value='검색'/>
			<p/>
			<label>no</label>
			<label>작성자</label>
			<label>제목</label>
			<label>등록일</label>
			<label>조회수</label>
			<p/>
			<div id='list'>
				<span>${vo.noticePostNum }</span>
				<span>${vo.memberName }</span>
				<span>${vo.noticeTitle }</span>
				<span>${vo.noticeRegDate }</span>
				<span>${vo.noticeView }</span>
				<input type='text' name='memberId' value='${vo.memberId }'/>
				<input type='text' name='noticeContent' value='${vo.noticeContent }'/>		
			</div>
		</form>
	</div>
</div>
<script>
init();
</script>
</body>
</html>