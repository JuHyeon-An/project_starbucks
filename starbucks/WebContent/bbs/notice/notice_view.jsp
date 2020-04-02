
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/starbucks/lib/jquery-3.4.1.js"></script>
<script src="/starbucks/js/us_notice.js"></script>

</head>
<body>
	<div class="col-md-12 order-2">
	    <div class="row mb-3">
	        <div class="col-md-12">
	            <h2 class="h3 mb-3 text-black">공지사항 작성</h2>
	        </div>
	    </div>
	    <form class="row" method="post" name="formmm" id="formmm">
	        <div class="col-md-12">
	        	<div class="form-group row">
	                <div class="col-md-3">
	                    <label for="memberId" class="text-black">글쓴이</label>
	                    <input type="text" class="form-control" id="memberId"  value='관리자' name="memberId" readonly="readonly">
	                </div>
	            </div>
	            <div class="form-group row">
	                <div class="col-md-12">
	                    <label for="noticeTitle" class="text-black">제목</label>
	                    <input type="text" class="form-control" id="noticeTitle" value='${param.noticeTitle }' name="noticeTitle">
	                </div>
	            </div>
	            <div class="form-group row">
	                <div class="col-md-12">
	                    <label for="noticeContent" class="text-black" >내용</label>
	                    <textarea class="form-control" id="noticeContent"   name="noticeContent" rows="15">${param.noticeContent }</textarea>
	                </div>
	            </div>
	        </div>
	        <div class="col-9 text-right">
	            <button type="button" class="btn btn-primary min-width-125" id="btnSelect">
	                목록
	            </button>
	        </div>
	        <div class="col-1 text-right">
	            <button type="button" class="btn btn-primary min-width-125" id="btnUpdate">
	               수정
	          	
	            </button>
	        </div>
	    </form>
	</div>
<script>
func();
</script>
</body>
</html>