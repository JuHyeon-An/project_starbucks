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
			$('#frmm').attr('action' , 'order.order').submit();
		})
	}


	if($('#btnModify') !=null){
		$('#btnModify').click(function(){
			alert("우씨씨씨");
			//console.log($('#orderStatus').val());
			$('#frmm').attr('action' ,'modify.order').submit();
		})
	}		
}

let goPage=function(nowPage){
	$('#nowPage').val(nowPage);
	$('#frmm').attr('action','order.order').submit();
}


let  view=function(orderNumber,memberId,itemCode,orderNum,orderPrice,orderregDate,orderStatus){
	$('#orderNumber').val(orderNumber);
	$('#memberId').val(memberId);
	$('#itemCode').val(itemCode);
	$('#orderNum').val(orderNum);
	$('#orderPrice').val(orderPrice);
	$('#orderregDate').val(orderregDate);
	$('#orderStatus').val(orderStatus);
	$('#frmm').attr('action', 'order_view.order').submit();	
}

   
//let init = function(){
//	$('#frm').attr('action','order.order').submit();
//	func();
//}