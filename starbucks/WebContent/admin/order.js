/**
 * 
 */


//let func=function(){
//	if($('#btnSelect')!=null){
//		$('#btnSelect').on('click', function(){
//			$('#frm').attr('action','order.order').submit();
//		});
//	}
//}


let func=function(){
	if($('#btnSelect')!=null){
		$('#btnSelect').click(function(){
			alert("zzzzzzzz");
			$('#frmm').attr('action' , 'order.order').submit();
		})
	}
}

let goPage = function(nowPage){
	$('#nowPage').val(nowPage);
	$('#frmm').attr('action','order.order').submit();
	
}
//let init = function(){
//	$('#frm').attr('action','order.order').submit();
//	func();
//}