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
let view=function(noticeTitle,memberName,noticeContent,noticeRegDate ){
	$('#noticeTitle').val(noticeTitle);
	$('#memberName').val(memberName);
	$('#noticeContent').val(noticeContent);
	$('#noticeRegDate').val(noticeRegDate);
	$('#notice').attr('action','notice_view.uk').submit();
}




