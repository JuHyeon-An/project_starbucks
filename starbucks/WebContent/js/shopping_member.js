/**
 * http://usejsdoc.org/
 */

let btnFunc = function(){
	
		
	if($('#btnFind') != null){
			$('#btnFind').click(function(){
				$('#frm').attr('action', 'select.mm').submit();
			})
		}
	
}