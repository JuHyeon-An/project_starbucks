/**
 * http://usejsdoc.org/
 */
let cnt=1;	
let func=function(){
	if($('#btnSelect')!=null){
		$('#btnSelect').on('click', function(){
			$('#notice').attr('action', 'notice_select.uk').submit();
		});
	}
	if($('#review_btnRegist')!=null){
		$('#review_btnRegist').on('click',function(){
			for(i=0; i<$("input[type='file']").length; i++){
				let src=$("input[type='file']")[i].files[0];
				if(src!=null){
					let j=i+1
					$('#'+j).attr('value',src.name);
				}
				
			}
			$('#review').attr('action', 'review_insertR.uk').submit();
		});
	}
	if($('#review_btnUpdate')!=null){
		$('#review_btnUpdate').on('click',function(){
			for(i=0; i<$("input[type='file']").length; i++){
				let src=$("input[type='file']")[i].files[0];
				if(src!=null){
					let j=i+1
					$('#'+j).attr('name',j);
					$('#'+j).attr('value',src.name);
				}
			}
			$('#review').attr('action','review_modifyR.uk').submit();
		});
	}
	
	if($('#review_btnSelect')!=null){
		$('#review_btnSelect').on('click', function(){
			if($('#review').attr('enctype')!=null){
				$('#review').attr('enctype','');
			}	
			$('#review').attr('action', 'review_select.uk').submit();
		});
	}
	if($('#btnModify')!=null){
		$('#btnModify').on('click',function(){
			$('#review').attr('action','review_modify.uk').submit();
		});
	}
	if($('#review_view_btnDelete')!=null){
		$('#review_view_btnDelete').on('click',function(){
			$('#review').attr('action','review_delete.uk').submit();
		});
	}
	/*수정에 별 뿌려주기*/
	var ccnt = $('#review_like').val();
	for(var i=1; i<=ccnt; i++){
		if($('#stars li').data('value')<=i){
			$("#stars li:nth-child("+i+")").addClass("selected");
		}
	}
	/*select에 별 뿌려주기*/
	/*j는 태그 갯수*/
	/*sc는 별 개수*/
	for(let j=0; j<$("input[name='sc']").length; j++){
		var sc=$("input[name='sc']").eq(j).val();
		for(var i=0; i<sc; i++){
				$("ul[id='starss']").eq(j).find('li').eq(i).addClass("selected");
		}
	}
/*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*/	
	$(document).ready(function(){
		  
		  /* 1. Visualizing things on Hover - See next part for action on click */
		  $('#stars li').on('mouseover', function(){
		    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
		   
		    // Now highlight all the stars that's not after the current hovered star
		    $(this).parent().children('li.star').each(function(e){
		      if (e < onStar) {
		        $(this).addClass('hover');
		      }
		      else {
		        $(this).removeClass('hover');
		      }
		    });
		    
		  }).on('mouseout', function(){
		    $(this).parent().children('li.star').each(function(e){
		      $(this).removeClass('hover');
		    });
		  });
		  
		  
		  /* 2. Action to perform on click */
		  $('#stars li').on('click', function(){
		    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
		    var stars = $(this).parent().children('li.star');
		    
		    for (i = 0; i < stars.length; i++) {
		      $(stars[i]).removeClass('selected');
		    }
		    
		    for (i = 0; i < onStar; i++) {
		      $(stars[i]).addClass('selected');
		    }
		    
		    // JUST RESPONSE (Not needed)
		    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
		    var msg = "";
		    if (ratingValue > 0) {
		        msg = " 귀하의 소중한 의견 감사합니다. 별점 "  + ratingValue + " 개를 주셨습니다.";
		        $('#review_like').val(ratingValue);
		    }
		    else {
		        msg = "We will improve ourselves. You rated this " + ratingValue + " stars.";
		    }
		    responseMessage(msg);
		    
		  });
		  
		  
		});


		function responseMessage(msg) {
		  $('.success-box').fadeIn(200);  
		  $('.success-box div.text-message').html("<span>" + msg + "</span>");
		}
	/*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*//*여기*/	
/*메세지 뿌려주기*/
	if($('#msg').val()){
		let msg=$('#msg').val();
		Swal.fire({
			icon: 'success',
			title: msg,
			showConfirmButton: false,
			timer: 1500
		});
	}
	if($("#member_id")!=null && $("#mId")!=null){
		if($("#member_id").val()==$("#mId").val()){
			$('#btnModify').removeClass('noLogin');
			$('#review_view_btnDelete').removeClass('noLogin');
		}
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
let notice_view=function(noticePostNum,noticeTitle,noticeContent,memberId ){
	$('#noticePostNum').val(noticePostNum);
	$('#noticeTitle').val(noticeTitle);
	$('#noticeContent').val(noticeContent);
	$('#memberId').val(memberId);
	$('#noticeFrm').attr('action','notice_view.uk').submit();
}
let review_view=function(review_postnum, item_code){
	$('#review_postnum').val(review_postnum);
	$('#item_code').val(item_code);
	$('#review').attr('action','review_view.uk').submit();
}
let kategorie=function(item_code){
	$('#item_code').val(item_code);
	$('#review').attr('action','review_select.uk').submit();
}
let sort=function(order){
	$('#sort').val(order);
	$('#review').attr('action','review_select.uk').submit();
}

/*이미지, 파일, 미리보기 제공*/ 
let addImg=function(){
	func();
	let $div = $('<div></div>');
	$div.attr('style','width:180px; height:180px;');
	$div.attr('class','ukfolder d-inline-block mr-1 ');
	$('#board').append($div);
	
	let $img=$('<img>');
	$img.attr('name','img'+cnt);
	$img.attr('width', '180px');
	$img.attr('height','180px');
	$div.append($img);
	
	let $file=$('<input>');
	$file.attr('type','file');
	$file.attr('name','file'+cnt);
	$file.attr('modify','no');
	$file.attr('style', 'display:none');
	$div.append($file);
	
	$delete=$('<input>');
	$delete.attr('type','button');
	$delete.attr('name','delete'+cnt);
	$delete.attr('value','삭제');
	$delete.attr('class','btn btn-primary btn-lg btn-block');
	$div.append($delete);
	
	$delete.on('click',function(){
		if($('#board').find('.check').length==5){
			$parent=$(this).parent();
			let f=$parent.children()[1]
			if(f.getAttribute('modify')=='yes'){
				$parent.remove()
				addImg();
			}
		}else{
			$parent=$(this).parent();
			let f=$parent.children()[1]
			if(f.getAttribute('modify')=='yes'){
				$parent.remove()
			}
		}	
	});
	
	$img.on('click',function(){
		$file.trigger('click');
		$img.attr('class','check');
	});
	$file.on('click',function(event){
		$target=$(event.target);
		$target.on('change',function(){
			let src=$target.get(0).files[0];
			let reader=new FileReader();
			reader.readAsDataURL(src);
			
			reader.onload=function(ev){
				$img.attr('src',ev.target.result);
			}
			
			$("input[type='file']").length;
			if($file.attr('modify')=='no' && $("input[type='file']").length<5 ){
				addImg();
			}	
			$file.attr('modify','yes');
		});
	});
	cnt++
}
/*수정할때 이미지, 파일, 미리보기 뿌려주기*/ 
let modify_addImg=function(sysImage){
	func();
	let $div = $('<div></div>');
	$div.attr('style','width:180px; height:180px;');
	$div.attr('class','d-inline-block mr-1');
	$('#board').append($div);
	
	let $img=$('<img>');
	$img.attr('name','img'+cnt)
	$img.attr('width', '180px');
	$img.attr('height','180px');
	$img.attr('class','check');
	$img.attr('src','/starbucks/review_img/'+sysImage);
	$div.append($img);
	
	let $file=$('<input>');
	$file.attr('type','file');
	$file.attr('name','file'+cnt);
	$file.attr('modify','no')
	$file.attr('style', 'display:none');
	$div.append($file);
	
	$delete=$('<input>');
	$delete.attr('type','button');
	$delete.attr('name','delete'+cnt);
	$delete.attr('value','삭제');
	$delete.attr('class','btn btn-primary btn-lg btn-block');
	$div.append($delete);
	
	$delete.on('click',function(){
		if($('#board').find('.check').length==5){
			$parent=$(this).parent();
			$parent.remove()
			addImg();
		}else{
			$parent=$(this).parent();
			$parent.remove()
		}	
	});
	
	$img.on('click',function(){
		$file.trigger('click');
	});
	
	$file.on('click',function(event){
		$target=$(event.target);
		$target.on('change',function(){
			let src=$target.get(0).files[0];
			let reader=new FileReader();
			reader.readAsDataURL(src);
			
			reader.onload=function(ev){
				$img.attr('src',ev.target.result);
			}
			$file.attr('modify','yes');
		});
	});
	cnt++
}
/*수정에 이미지 뿌려주고, 이미지 추가 수정 가능하게*/
let modify_addImgs=function(){
	let length=$("input[name='target']").length;
	for(let i=0; i<length; i++){
			let sysImage=$("input[name='target']").eq(i).attr("value");
			modify_addImg(sysImage);
	}
	if(length<5){
		addImg();
	}
}
/*메세지 뿌려주기*/
let alam=function(){
	Swal.fire({
		  position: 'top-end',
		  icon: 'success',
		  title: 'Your work has been saved',
		  showConfirmButton: false,
		  timer: 1500
		});
}
