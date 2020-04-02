

let func=function(){
	if($('#btnSave')!=null){
		$('#btnSave').on('click', function(){
			$('#formmm').attr('action', 'notice_insertR.nn').submit();
		});
	}
	
	
	
	if($('#btnUpate')!=null){
		$('#btnUpate').on('click', function(){
			$('#formmm').attr('action', 'notice_upadate.nn').submit();
		});
	}


	if($('#btnSelect')!=null){
		$('#btnSelect').on('click', function(){
			$('#formmm').attr('action', 'notice_select.nn').submit();
		});
	}






	
	

}