<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지사항</h3>
<form id='frm' name='frm' method='post'>
<label>제목</label>
<input type='text' name='noticeTitle' value='${param.noticeTitle }'/><p/>
<label>작성자</label>
<input type='text' name='memberId' value='${param.memberId }'/><p/>
<label>내용</label>
<input type='text' name='noticeContent' value='${param.noticeContent }'/><p/>
<label>등록일</label>
<input type='text' name='noticeRegDate' value='${param.noticeRegDate }'/><p/>

<input type=button id='btnSelect' value='목록'/>
<input type='text' name='findStr' value='${param.findStr }'/><p/>
<input type='text' name='nowPage' value='${param.nowPage }'/><p/>
</form>

</body>
</html>