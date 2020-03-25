<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h3>공지사항 작성</h3>
<form>
<label>제목</label>
<input type='text'>
<label>내용</label>
<input type='text'>
<input type='text' value='session.getAttribute("mId")'>
<input type='text' value='session.getAttribute("admin")'>

</form>
</div>
</body>
</html>