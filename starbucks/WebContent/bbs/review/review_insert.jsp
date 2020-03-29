<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="/starbucks/lib/jquery-3.4.1.js"></script>
    <script src="/starbucks/js/uk2.js"></script> 
</head>
<body>

<div>
<h3>구매 후기 작성</h3>
<form id='review' name='review' method='post' enctype="multipart/form-data">
	<label>제목</label>
	<input type='text' name='review_title'>
	<label>내용</label>
	<input type='text' name='review_content'>
	<label>별점</label><p/>
	<select name='review_like'>
		<option value=1>별</option>
		<option value=2>별별</option>
		<option value=3>별별별</option>
		<option value=4>별별별별</option>
		<option value=5>별별별별별</option>
	</select>
	<label>이미지</label>
	<div id='att_file'></div>
	
	
	<input type='button' id='btnRegist' value='등록'/>
	
</form>
</div>
<script>
let main=document.getElementById('att_file');
makeDiv(main);
</script>
</body>
</html>