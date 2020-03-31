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
	$('#frmm').attr('action', 'order.order').submit();
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

function loadsw(){
	 let findStr = $('#findStr').val().toUpperCase();
	 let orderstatus = $('#categorySelect').val();
<<<<<<< HEAD
	 let nowPage =  $('#nowPage').val();
       	
       	
       	$('#tableContainer').load('order.order?findStr='+findStr+
=======
	 let nowPage = $('#nowPage').val();
       	
     $('#tableContainer').load('order.order?findStr='+findStr+
>>>>>>> ff08fa61f92e2480aca353b4e1463982dcc514eb
   				'&orderStatus='+orderstatus+'&nowPage='+nowPage+
   				' #ordertable');
       
}

function toList(){
	location.href='select_product.stb';
	loadTable();
}


