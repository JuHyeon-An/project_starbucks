/**
 * http://usejsdoc.org/
 */
let func=function(){
	if($('#btnSelect')!=null){
		$('#btnSelect').on('click', function(){
			$('#frm').attr('action','notice_select.star').submit();
		});
	}
}
let goPage=function(nowPage){
	$('#nowPage').val(nowPage);
	$('#frm').attr('action','notice_select.star').submit();
}
let view=function(noticePostNum){
	$('#frm').attr('action','notice_view.star').submit();
}




