/**
 * 
 */

let func = function() {
	if ($('#btnSelect') != null) {
		$('#btnSelect').click(function() {
			$('#frmm').attr('action', 'order.order').submit();
		})
	}

	if ($('#btnModify') != null) {
		$('#btnModify').click(function() {
			$('#frmm').attr('action', 'modify.order').submit();
		})
	}
}

let goPage = function(nowPage) {
	$('#nowPage').val(nowPage);
	//$('#frmm').attr('action', 'order.order').submit();
	loadsw();
}

let view = function(orderNumber, memberId, itemCode, orderNum, orderPrice,
		orderregDate, orderStatus) {
	$('#orderNumber').val(orderNumber);
	$('#memberId').val(memberId);
	$('#itemCode').val(itemCode);
	$('#orderNum').val(orderNum);
	$('#orderPrice').val(orderPrice);
	$('#orderregDate').val(orderregDate);
	$('#orderStatus').val(orderStatus);
	$('#frmm').attr('action', 'order_view.order').submit();
}

function LoadSelect(){ //다른페이지에서 페이지 초기화
	$('#nowPage').val('');
	loadsw();
}

function loadsw(){
//	if($('#categorySelect').selectedIndex == 0){
//		$('#nowPage').val(1);
//	
//	}
//	if($('categorySelect').isChanged){
//		$('#nowPage').val();
//	}	
//	$('#nowPage').val('');
	 
	
	 let findStr = $('#findStr').val().toUpperCase();
	 let orderstatus = $('#categorySelect').val();
	 let nowPage =  $('#nowPage').val();
     
	 /*
     $('#tableContainer').load('order.order?findStr='+findStr+
   				'&orderStatus='+orderstatus+'&nowPage='+nowPage+
   				' #ordertable');
       */
     
     let form_data = $('#frmm').serializeArray();
     $('#tableContainer').load('order.order #tableContainer', form_data);
}

function toList(){
	location.href='select_product.stb';
	loadTable();
}


