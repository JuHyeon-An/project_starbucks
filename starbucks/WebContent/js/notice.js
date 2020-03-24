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
let view=function(noticePostNum){
	$('#notice').attr('action','notice_view.uk').submit();
}




