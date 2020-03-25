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
<h3>공지사항</h3>
<form id='notice' name='notice' method='post'>
<label>제목</label>
<input type='text' name='noticeTitle' value='${param.noticeTitle }'/><br/>
<label>작성자</label>
<input type='text' name='memberId' value='${param.memberName }'/><br/>
<label>내용</label>
<input type='text' name='noticeContent' value='${param.noticeContent }'/><br/>
<label>등록일</label>
<input type='text' name='noticeRegDate' value='${param.noticeRegDate }'/><br/>

<input type='button' id='btnSelect' value='목록'/>
<input type='hidden' name='findStr' value='${param.findStr }'/>
<input type='hidden' name='nowPage' value='${param.nowPage }'/>
</form>
</div>
</body>
</html>