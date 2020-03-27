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
	<input type='text' name='member_id' value='${mId }'/>
	<input type='text' name='item_code' value='${item_code }'/>
	<input type='text' id='msg' name='msg' value='${msg }'/>
	<div id='board'>
	<input type='file' id='file' name='file' multiple='multiple' >
	</div>
	<div id='board2'></div>
	<div id='board3'>
	<img src='http://placehold.it/120x180'/>
	</div>
	<input type='button' id='btnRegist' value='등록'/>
	
	
</form>
</div>

</body>
</html>