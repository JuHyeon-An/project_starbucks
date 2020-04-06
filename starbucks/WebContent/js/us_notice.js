

let func=function(){
	if($('#btnSave')!=null){
		$('#btnSave').on('click', function(){
			$('#formmm').attr('action', 'notice_insertR.nn').submit();
		});
	}
	
	if($('#btnUpdate')!=null){
		$('#btnUpdate').on('click', function(){
			$('#noticeTitle').attr('readonly', false);
			$('#noticeContent').attr('readonly', false);
			$('#btnUpdate').attr('type', 'hidden');
			$('#btnUp').attr('type', 'button');
		});
	}
	
	
	if($('#btnUp')!=null){
		$('#btnUp').on('click', function(){
			$('#formmm').attr('action', 'notice_update.nn').submit();
		});
	}


	if($('#btnSelect')!=null){
		$('#btnSelect').on('click', function(){
			$('#formmm').attr('action', 'notice_select.uk').submit();
		});
	}


	if($('#btnDelete')!=null){
		$('#btnDelete').on('click', function(){
			$('#formmm').attr('action', 'notice_delete.nn').submit();
		});
	}
	
	
	
}
//var notice_delete = function(noticePostNum, event){
//	alert(noticePostNum);
//	$('#noticePostNum').val(noticePostNum);
//	$('#noticeFrm').attr('action','notice_delete.nn').submit();
//    //상위로 이벤트가 전파되지 않도록 중단한다.
//    event.stopPropagation();
//};
//

