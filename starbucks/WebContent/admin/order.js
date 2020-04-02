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
	// $('#frmm').attr('action', 'order.order').submit();
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
	$('#orderStatus2').val(orderStatus);
	$('#frmm').attr('action', 'order_view.order').submit();
}

function LoadSelect() { // 다른페이지에서 페이지 초기화
	$('#nowPage').val('');
	loadsw();
}

function loadsw() {

	let findStr = $('#findStr').val().toUpperCase();
	let orderstatus = $('#categorySelect').val();
	let nowPage = $('#nowPage').val();
	let form_data = $('#frmm').serializeArray();
	$('#tableContainer').load('order.order #tableContainer', form_data);
}

function toList() {
	location.href = 'select_product.stb';
	loadTable();
}

var test = document.getElementsByClassName("selectTest");
// test 변수에 selectTest란 클래스명을 가진 요소를 저장

var indexNo = test[0].selectedIndex;
// test 변수의 선택된 값을 indexNo에 저장

console.log(indexNo);
