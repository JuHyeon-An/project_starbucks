<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	    <input type="hidden" id="nc" name="nc" value="${msg }"/>
	        <div class="col-md-12">
	        	<div class="form-group row">
	                <div class="col-md-3">
	                    <label for="memberId" class="text-black">글쓴이</label>
	                    <input type="text" class="form-control" id="memberId" value="<%out.println(session.getAttribute("mId"));%>" name="memberId" readonly="readonly">
	                </div>
	            </div>
	            <div class="form-group row">
	                <div class="col-md-12">
	                    <label for="noticeTitle" class="text-black">제목</label>
	                    <input type="text" class="form-control" id="noticeTitle" name="noticeTitle">
	                </div>
	            </div>
	            <div class="form-group row">
	                <div class="col-md-12">
	                    <label for="noticeContent" class="text-black">내용</label>
	                    <textarea class="form-control" id="noticeContent" name="noticeContent" rows="15"></textarea>
	                </div>
	            </div>
	        </div>
	        <div class="col-10 text-right">
	            <button type="button" class="btn btn-primary min-width-125" id="btnSave">
	                저장
	            </button>
	        </div>
	        
	        <div class="col-1 text-right">
	            <button type="button" class="btn btn-primary min-width-125" id="btnSelect">
	                목록
	            </button>
	        </div>
	    </form>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.10.5/dist/sweetalert2.all.min.js"></script>
<script>

if($('#nc')!=null){
	if($('#nc').val()=='성공'){
		Swal.fire({
			  title: 'SUCCESS! :D',
			  text: "게시물이 성공적으로 등록되었습니다..",
			  icon: 'success',
			  showCancelButton: false,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: '목록으로'
			}).then((result) => {
			  if (result.value) {
		location.href="notice_select.uk";
	}
})
	}else if($('#nc').val()=='실패'){
		Swal.fire({
			  title: '오류 발생',
			  text: "입력 중 오류가 발생했습니다. 관리자에게 문의하세요.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '다시 시도',
			  cancelButtonText: '목록으로'
			}).then((confirm) => {
				  if (confirm.value) {
					  // 확인을 눌렀으면
					  $('#nc').val('');
		}else{
			location.href="notice_select.uk"
		}
	})
	}
}
</script>
</body>
</html>