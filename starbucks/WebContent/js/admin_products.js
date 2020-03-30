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
	
	if($('.category-input')!=null){
		$('.category-input').on({
			click:function(){ $(this).removeAttr('readonly'); }
		});
	}
	
		/*
		  $("#findStr").on("keyup", function() {
		    let value = $(this).val().toLowerCase();
		    $("#selectTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
	*/
	
	if($('#btnSearch-item')!=null){
		$('#btnSearch-item').click(function(){
			loadTable();
		})
	}
	
	$('#frmSearch').submit(function(){
		$('#btnSearch-item').click();
		return false;
	});
	
	if($('#btnTheme')!=null && $('#btnCategory')!=null){
		 $('#btnTheme').click(function(){
			 $(this).addClass('active');
			 $('#btnCategory').removeClass('active');
		 }),$('#btnCategory').click(function(){
			 $(this).addClass('active');
			 $('#btnTheme').removeClass('active');
		 })
		 
	}
	
	if($('#resultMsg')!=null){
		if($('#resultMsg').val()=='성공'){
			$('#resultMsg').val('');
			Swal.fire({
				  title: '등록 성공!',
				  text: "상품이 성공적으로 등록되었습니다.",
				  icon: 'success',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '추가 등록',
				  cancelButtonText: '목록으로'
				}).then((result) => {
				  if (result.value) {
					  // 확인을 눌렀으면
					  $('#editMsg').val('');
		}else{
			location.href="select_product.stb"
		}
	})
		}else if($('#resultMsg').val()=='DB오류발생'){
			Swal.fire({
				  title: '오류 발생',
				  text: "상품 등록 중 오류가 발생했습니다. 관리자에게 문의하세요.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '다시 시도',
				  cancelButtonText: '목록으로'
				}).then((confirm) => {
					  if (confirm.value) {
						  // 확인을 눌렀으면
						  $('#editMsg').val('');
			}else{
				location.href="select_product.stb"
			}
		})
		}
	}
	
	
	if($('#editMsg')!=null){
		if($('#editMsg').val()=='성공'){
			$('#editMsg').val('');
			Swal.fire({
				  title: '수정 완료!',
				  text: "상품이 성공적으로 수정되었습니다.",
				  icon: 'success',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '추가수정',
				  cancelButtonText: '목록으로'
				}).then((result) => {
				  if (result.value) {
					  // 확인을 눌렀으면
				$('#editMsg').val('');
		}else{
			location.href="select_product.stb"
		}
	})
		}else if($('#editMsg').val()=='실패'){
			Swal.fire({
				  title: '오류 발생',
				  text: "상품 수정 중 오류가 발생했습니다. 관리자에게 문의하세요.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '다시 시도',
				  cancelButtonText: '목록으로'
				}).then((confirm) => {
					  if (confirm.value) {
						  // 확인을 눌렀으면
						  $('#editMsg').val('');
			}else{
				location.href="select_product.stb"
			}
		})
		}
	}
	
}// end of btnFunc

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
	
	function loadTable(){
		 let findStr = $('#findStr').val().toUpperCase();
		 let category = $('#categorySelect').val();
		 
		 if($("#checkSale").is(":checked")){
	        	
	        	$('#tableContainer').load('select_product.stb #selectTable', 
	        			{'findStr' : findStr,
	        			'category' : category,
	        			'check' : 'true'});
	        	
	        }else{
	        	$('#tableContainer').load('select_product.stb?findStr='+findStr+
	    				'&category='+category+
	    				' #selectTable');
	        }
	}
	
	function toList(){
		location.href='select_product.stb';
		loadTable();
	}
	
	/*
	function sortTable(index){
		let table = $('#selectTable');
		let rows = table[0].rows;
		// 테이블 전체 행
		console.log(rows.length)
		
		for (var i = 1; i < (rows.length - 1); i++) { 
			console.log("실행");
			var fCell = rows[i].cells[index];
			console.log(fCell.innerHTML.toLowerCase()); // value
			var sCell = rows[i + 1].cells[index];
			if (fCell.innerHTML.toLowerCase() > sCell.innerHTML.toLowerCase()) {
				console.log("몇번실행되는지");
				rows[i].parentNode.insertBefore(rows[i + 1], rows[i]); } 
			}
			}
*/

		let sortType = 'asc';
		function sortTable(index){
		    sortType = (sortType === 'asc') ? 'desc':'asc';

		    let table = $('#selectTable');
			let rows = table[0].rows;
		    let chkSort = true;
		   
		    while (chkSort){
		        chkSort = false;
		        for (var i = 1; i < (rows.length - 1); i++) {
		            let row = rows[i];
		            
		            let fCell = row.cells[index].innerHTML;
		            let sCell = rows[i + 1].cells[index].innerHTML;
		            
		            if(index==3 || index==4){
		            	fCell = parseInt(fCell);
		            	sCell = parseInt(sCell);
		            }else{
		            	fCell = fCell.toLowerCase();
		            	sCell = sCell.toLowerCase();
		            }
//		            let sCell = row.nextSibling.cells[index].innerHTML.toLowerCase();
		            
		            if ( (sortType === 'asc'  && fCell > sCell) ||
		               (sortType === 'desc' && fCell < sCell) ) {
		                row.parentNode.insertBefore(row.nextSibling, row);
		                chkSort = true;
		            }
		        }   
		    }
		}
