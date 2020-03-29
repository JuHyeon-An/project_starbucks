/**
 * http://usejsdoc.org/
 */
let cnt=0;	
function makeDiv(main){
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
/*	file.setAttribute('style', 'display:none');
*/	file.setAttribute('modify','no');
	div.appendChild(file);
	
	//이미지를 클릭하면
	img.onclick=function(){
		file.click();
		/*console.log(img);
		console.log(file);*/
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
}
