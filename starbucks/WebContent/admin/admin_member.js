/**
 * 
 */

let func = function() {
	if ($('#btnSelect') != null) {
		$('#btnSelect').click(function() {
			$('#frmm').attr('action', 'admin.adminmember').submit();
		})
	}

	if ($('#btnModify_Member') != null) {
		$('#btnModify_Member').click(function() {
			$('#frmm').attr('action', 'modify.adminmember').submit();
		})
	}
	
	
}

let goPage = function(nowPage) {
	$('#nowPage').val(nowPage);
	$('#frmm').attr('action', 'admin.adminmember').submit();
}


 let
 view=function(mId){
 $('#mId').val(mId);

 $('#frmm').attr('action', 'member_view.adminmember').submit();
 }

