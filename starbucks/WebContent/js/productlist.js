/**
 * http://usejsdoc.org/
 */
/*
   let pd_goPage = function(nowPage){
		$('#nowPage').val(nowPage);
		$('#pd_frm').attr('method', 'post');
		$('#pd_frm').attr('action', 'listPage.pl').submit();
	}
   let categories = function(findStr){
	   $('#pd_findStr').val(findStr);
	   $('#pd_frm').attr('method', 'post');
	   $('#pd_frm').attr('action', 'listCategories.pl').submit();
   }
   let item_view = function(findStr){
	   $('#pd_findStr').val(findStr);
	   $('#pd_frm').attr('method', 'post');
	   $('#pd_frm').attr('action', 'item_view.pl').submit();
   } 
   
   */


let pd_goPage = function(nowPage, findStr){
	$('#nowPage').val(nowPage);
	$('#pd_findStr').val(findStr);
	$('#pd_frm').attr('method', 'post');
	$('#pd_frm').attr('action', 'listCategories.pl').submit();
}
let categories = function(findStr, sort){
   $('#pd_findStr').val(findStr);
	$('#nowPage').val('1');
	 $('#pd_sort').val(sort);
   $('#pd_frm').attr('method', 'post');
   $('#pd_frm').attr('action', 'listCategories.pl').submit();
}

let item_view = function(findStr){
   $('#pd_findStr').val(findStr);
   $('#pd_frm').attr('method', 'post');
   $('#pd_frm').attr('action', 'item_view.pl').submit();
} 