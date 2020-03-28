/**
 * http://usejsdoc.org/
 */
let cnt=0;	
let func=function(){
	
	if($('#btnSelect')!=null){
		$('#btnSelect').on('click', function(){
			$('#notice').attr('action', 'notice_select.uk').submit();
		});
	}
	if($('#btnSelect2')!=null){
		$('#btnSelect2').on('click', function(){
			$('#review').attr('action', 'review_select.uk').submit();
		});
	}
	if($('#btnRegist')!=null){
		$('#btnRegist').on('click',function(){
			$('#review').attr('action', 'review_insertR.uk').submit();
		});
		
	}
	if($('#msg').val()){	
		alert($('#msg').val());
	}
}
let goPage=function(nowPage){
	$('#nowPage').val(nowPage);
	$('#notice').attr('action','notice_select.uk').submit();
}
let goPage2=function(nowPage){
	$('#nowPage').val(nowPage);
	$('#review').attr('action','review_select.uk').submit();
}
let notice_view=function(noticeTitle,noticeContent,noticeRegDate ){
	$('#noticeTitle').val(noticeTitle);
	$('#noticeContent').val(noticeContent);
	$('#noticeRegDate').val(noticeRegDate);
	$('#notice').attr('action','notice_view.uk').submit();
}
let review_view=function(){
	$('#review_postnum').val(review_postnum);
	$('#member_id').val(member_id);
	$('#item_code').val(item_code);
	$('#review_title').val(review_title);
	$('#review_content').val(review_content);
	$('#review_like').val(review_like);
	$('#review_regdate').val(review_regdate);
	$('#reivew_view').val(reivew_view);
	$('#review').attr('action','review_view.uk').submit();
}




