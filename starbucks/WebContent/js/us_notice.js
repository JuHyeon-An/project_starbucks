

let func=function(){
	if($('#btnSave')!=null){
		$('#btnSave').on('click', function(){
			$('#formmm').attr('action', 'notice_insertR.nn').submit();
		});
	}
	
	
	
	if($('#btnUpdate')!=null){
		$('#btnUpdate').on('click', function(){
			$('#formmm').attr('action', 'notice_update.nn').submit();
		});
	}


	if($('#btnSelect')!=null){
		$('#btnSelect').on('click', function(){
			$('#formmm').attr('action', 'notice_select.uk').submit();
		});
	}


}

