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
let init=function(){
	func();
	$('#btnSelect').click();
}



