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
	if($('#btnRegist')!=null){
		$('#btnRegist').on('click',function(){
			$('#review').attr('action', 'review_insertR.uk').submit();
		});
		
	}
	/*이미지 프리뷰*/
	if($('#file')!=null){
		$('#file').change(function(event){
			$('img').remove();
			$('span').remove();
			let et=event.target;
			for(let i=0; i<et.files.length; i++){
				let src=et.files[i];
				$('#board').append(input);
				console.log(src);
				console.log($('input').files[0]);
				
				let reader=new FileReader();
				reader.readAsDataURL(src);
			
				reader.onload=function(ev){
					let url=ev.target.result;
					$('#gif'+i).attr('src', url);
					let obj2=$('<span class=p-2>'+src.name+'</span>');
					$('#board2').append(obj2);
				}
				let obj=$('<img>');
				obj.attr('id','gif'+i);
				obj.attr('width','120px');
				obj.attr('height','180px')
				$('#board3').append(obj);
			}
		});
	}
}
let goPage=function(nowPage){
	$('#nowPage').val(nowPage);
	$('#notice').attr('action','notice_select.uk').submit();
}
let view=function(noticeTitle,memberName,noticeContent,noticeRegDate ){
	$('#noticeTitle').val(noticeTitle);
	$('#memberName').val(memberName);
	$('#noticeContent').val(noticeContent);
	$('#noticeRegDate').val(noticeRegDate);
	$('#notice').attr('action','notice_view.uk').submit();
}




