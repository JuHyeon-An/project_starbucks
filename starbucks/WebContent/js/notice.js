/**
 * http://usejsdoc.org/
 */
let func=function(){
	if($('#btnSelect')!=null){
		$('#btnSelect').on('click', function(){
			$('#notice').attr('action','notice_select.uk').submit();
		});
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




