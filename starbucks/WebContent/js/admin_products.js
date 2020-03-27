/**
 * http://usejsdoc.org/
 */

 let cnt = 1;

function btnFunc(){
	
	$('a.nav-link').click(function(){
		$('a.nav-link').removeClass('active');
		$(this).addClass('active');
	})
	
	
	if($('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
			$('#editFrm').submit();
		})
	}
	
	
	/*
	if($('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
			alert("눌린거지..?");

				let form = $("#editFrm").serialize;
		        console.log(form);
		        formData.append("message", "ajax로 파일 전송하기");
		        formData.append("file", $("#fileEdit1")[0].files[0]);
		        formData.append("file", $("#fileEdit2")[0].files[0]);
		        formData.append("file", $("#fileEdit3")[0].files[0]);
		        $.ajax({
		            url : 'edit_product_result.jsp',
		            type : 'post',
		            data : form,
		            dataType : 'html',
		            error: function(xhr, status, error){
		                alert(error);
		            },
		            success : function(data){
		                alert(data);
		            },
		        });
		});
	}
	 */
}
//let table = $('#selectTable').DataTable();

let deleteItem = function(item_code){
	
	Swal.fire({
		  title: '정말 삭제하시겠습니까?',
		  text: "",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제해주세요!',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
			  // 확인을 눌렀으면
				$.post('delete_productR.stb', {"item_code" : item_code}, function(data) {
					// data가 1이면 삭제된것, 1보다 작으면 오류
					Swal.fire(
							'Deleted!',
							'성공적으로 삭제되었습니다.',
							'success'
					).then((result2) => {
						if(result2.value){
							location.href="/starbucks/admin/select_product.stb"
							// $('#reportsPage').load('select_product.stb');
						}
					})
				if(data<1){
					// 삭제될 때 오류가 발생한 경우
						  Swal.fire(
							'삭제 중 오류발생',
							'관리자에게 문의해주세요.',
							'warning'
						  )
				}		
				})
		  }
		  //취소 누르면 아무일도 안 생김
	});
}

function goEdit(item_code){
	$('#hidden_code').val(item_code);
	$('#codeForm').attr('action', 'edit_product.stb').submit();
}


function makeDiv(main){
	  
	  let div = document.createElement('div');
	  div.setAttribute('class', 
			  'form-group mb-3 col-xs-12 col-sm-4');
	  
	  
	  let divChild = document.createElement('div');
	  divChild.setAttribute('class', 'tm-product-img-dummy mx-auto');
	  
	  // image tag를 추가
	  let img = document.createElement('img');
	  img.setAttribute('name', 'photo'+cnt);
	  // <img name='img0'>, <img name='img1'> ... 누를때마다 증가

	  img.setAttribute('width', '100%');
	  img.setAttribute('height', '100%');
	  img.src = '../img/upload.png';
	  //src는 다이렉트로 집어넣을 수 있다
	  divChild.appendChild(img);
	  div.appendChild(divChild);
	  
	  // 삭제버튼 추가
	  
	  /*
	  let btnDel = document.createElement('input');
	  btnDel.setAttribute('name', 'delBtn'+cnt);
	  btnDel.setAttribute('type', 'button');
	  btnDel.setAttribute('value', 'X');
	  btnDel.setAttribute('class', 'btnDel');
	  
	  btnDel.onclick = function(ev){
		  let obj = ev.srcElement;
		  let parent = obj.parentNode;
		  // parentNode : 부모태그 div
		  let tag = parent.getElementsByTagName('input')[1];
		  // input태그들 중에서 두번째 태그를 가져와라
		  
		  if(tag.getAttribute('modify')=='yes'){
			  main.removeChild(parent);
		  }
	  }
	  
	  divChild.appendChild(btnDel);
	  */
	  
	  // 이미지당 file tag
	  let file = document.createElement('input');
	  file.setAttribute('type', 'file');
	  file.setAttribute('name', 'fileInput'+cnt);
	  file.setAttribute('style', 'display:none');
	  file.setAttribute('modify', 'no');
	  
	  div.appendChild(file);
	  
	  // 이미지를 클릭하면
	  img.onclick = function(){
		  file.click();
	  }
	  
	  file.onclick =  function imagePreView(event){
		  	let btn = event.srcElement;
		  	
		  	console.log(btn);
		  	console.log(btn.value);
		  	
		  	btn.onchange = function(){
		  	let url = btn.files[0];
		  	let reader = new FileReader();
		  	reader.readAsDataURL(url);
		  	
		  	reader.onload = function(ev){
		  		let target = event.srcElement;
		  		let temp = new Image();
		  		temp.src = ev.target.result;
		  		img.src = temp.src;
		  		}
		  	if(file.getAttribute('modify')=='no'){
		  	makeDiv(main);
		  	// 이미지 불러오고 나면 div를 하나 더 추가해라
		  	}
		  	file.setAttribute('modify', 'yes');
		  	}
		  }
	  
		  	if(cnt<4){
	  		main.appendChild(div);
	  		cnt++;
	  }
}
//TODO : 사진에 마우스 올리면 삭제할 수 있는 버튼? 등장하게!!!


	function preview(index){
		$('#fileEdit'+index).trigger('click');
		$('#fileEdit'+index).change(function(e){
			
			let ele = e.target; //event.srcElement : 순수 자바스크립트 코드로 처리했을 때.
			let url = ele.files[0];
			// 이벤트가 발생한 파일의 경로
			let fileName = url.name;
			let reader = new FileReader();
			reader.readAsDataURL(url);
			
			  reader.onload = function(ev){
				  // 읽기가 다 끝나면, 파일을 다 읽으면.
				    let img = new Image();
				    img.src = ev.target.result;
					// 실제로 읽혀진 파일
					$('#photoEdit'+index).attr('src', img.src);

					if($('#hiddenFile'+index)!=null){
						$('#hiddenFile'+index).val(fileName);
					}
				  
			  }
		});
	}
