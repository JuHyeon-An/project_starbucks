/**
 * 
 */


let func=function(){
	if($('#btnSelect')=!null){
		$('#btnSelect').on('click', function(){
			$('#frm').attr('action','order.star').submit();
		});
	}
}

let init = function(){
	$('#frm').attr('action','order.star').submit();
	func();
}