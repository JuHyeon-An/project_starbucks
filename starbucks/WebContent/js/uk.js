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
let addImg=function(){
	func();
	let $div = $('<div></div>');
	$div.attr('style','width:120px; height:180px;');
	$div.attr('class','d-inline-block mr-2');
	$('#board').append($div);
	
	let $img=$('<img>');
	$img.attr('name','img'+cnt)
	$img.attr('width', '120px');
	$img.attr('height','180px');
	$img.attr('src','http://placehold.it/120x180');
	$div.append($img);
	
	let $file=$('<input>');
	$file.attr('type','file');
	$file.attr('name','file'+cnt);
	console.log($file.attr('name'));
	$file.attr('modify','no')
	$file.attr('style', 'display:none');
	$div.append($file);
	
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
			
			let filename=$file.attr('name');
			console.log(filename);
			if($file.attr('modify')=='no' && filename!='file4'){
				addImg();
			}	
			$file.attr('modify','yes');
		});
	});
	cnt++
}
function makeDiv(main){
	func();
	let div=document.createElement('div');
	div.setAttribute('style','border:1px solid #f00; width:120px; height:180px;');
	
	//img tag
	let img=document.createElement('img');
	img.setAttribute('name', 'img'+cnt);
	img.setAttribute('width', '120px');
	img.setAttribute('height','180px');
	img.src= 'http://placehold.it/120x180';
	div.appendChild(img);
	
	//삭제 버튼
	let btnDel=document.createElement('input');
	btnDel.setAttribute('name','btnDel'+cnt);
	btnDel.setAttribute('type','button');
	btnDel.setAttribute('value','X');
	btnDel.setAttribute('class','btnDel');
	
	btnDel.onclick=function(ev){//삭제 이벤트 처리
		let obj=ev.srcElement;
		let parent=obj.parentNode;
		let tag=parent.getElementsByTagName('input')[1];
		if(tag.getAttribute('modify')=='yes'){
			main.removeChild(parent);
		}
	}
	div.appendChild(btnDel);
	
	//이미지당 file tag
	let file=document.createElement('input');
	file.setAttribute('type','file');
	file.setAttribute('name','attFile'+cnt);
	file.setAttribute('style', 'display:none');
	file.setAttribute('modify','no');
	div.appendChild(file);
	
	//이미지를 클릭하면
	img.onclick=function(){
		file.click();
	}
	
	file.onclick=function imagePreView(event){
		let btn = event.srcElement;	
		btn.onchange=function(){
			let url = btn.files[0];
			let reader = new FileReader();
			reader.readAsDataURL(url);
			
			reader.onload=function(ev){
				let temp=new Image();
				temp.src=ev.target.result;
				img.src=temp.src;
			}
			if(file.getAttribute('modify')=='no'){
				makeDiv(main);
			}
			file.setAttribute('modify','yes');
		}
	}
	main.appendChild(div);
	cnt++;
}



