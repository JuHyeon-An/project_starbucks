

let func=function(){
	if($('#btnSave')!=null){
		$('#btnSave').on('click', function(){
			alert("asdsa");
			$('#formmm').attr('action', 'notice_insert.nn').submit();
		});
	}
}