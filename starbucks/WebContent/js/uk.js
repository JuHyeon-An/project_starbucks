/**
 * http://usejsdoc.org/
 */
let cnt=0;	
let func=function(){
	if($('#btnSelect')!=null){
		$('#btnSelect').on('click', function(){
			$('#notice').attr('action', 'notice_select.uk').submit();
		});
	}
	if($('#btnSelect2')!=null){
		$('#btnSelect2').on('click', function(){
			$('#review').attr('action', 'review_select.uk').submit();
		});
	}
	if($('#msg').val()){	
		alert($('#msg').val());
	}
}

let goPage=function(nowPage){
	$('#nowPage').val(nowPage);
	$('#notice').attr('action','notice_select.uk').submit();
}
let goPage2=function(nowPage){
	$('#nowPage').val(nowPage);
	$('#review').attr('action','review_select.uk').submit();
}
let notice_view=function(noticeTitle,noticeContent,noticeRegDate ){
	$('#noticeTitle').val(noticeTitle);
	$('#noticeContent').val(noticeContent);
	$('#noticeRegDate').val(noticeRegDate);
	$('#notice').attr('action','notice_view.uk').submit();
}
let review_view=function(review_postnum){
	$('#review_postnum').val(review_postnum);
	$('#review').attr('action','review_view.uk').submit();
}
let btn=function(){
	let div=document.createElement('test');
	let cnt=0;
	let b=$('<button>');
	
	div.appendChild(b);
	b.onclick=function(){
		console.log(cnt);
		btn();
	}
	cnt++;
}




