/**
 * http://usejsdoc.org/
 */

function btnFunc(){
	/*
	if($('#btnInsert')!=null){
		$('#btnInsert').click(function(){
			$('#frm').attr('action', 'add_productR.stb').submit();
		})
	}
	*/
	
	if($('#fileInput')!=null){
		$('#fileInput').change(function(e){
			
			let ele = e.target; //event.srcElement : 순수 자바스크립트 코드로 처리했을 때.
			let url = ele.files[0];
			// 이벤트가 발생한 파일의 경로
			
			let reader = new FileReader();
			reader.readAsDataURL(url);
			
			  reader.onload = function(ev){
				  // 읽기가 다 끝나면, 파일을 다 읽으면.
				    let img = new Image();
				    img.src = ev.target.result;
					// 실제로 읽혀진 파일
				    if($('#photo').attr('src')==null){
				    	$('#photo').attr('src', img.src);
				    }else if($('#photo2').attr('src')==null){
				    	$('#photo2').attr('src', img.src);
				    }else{
				    	$('#photo3').attr('src', img.src);
				    }
				  }
		})
		}
	
}