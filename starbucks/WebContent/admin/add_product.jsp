<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <body>
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-10 col-lg-11 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Add Product</h2>
						</div>
					</div>
					<form id="productFrm" name="productFrm" method="post" action="add_productR.stb" enctype="multipart/form-data"
						class="tm-edit-product-row">
						<div class="col-xl-12 col-lg-12 col-md-12">
							<div class="form-group mb-3">
								<label for="item_title">상품명 </label> <input
									id="item_title" name="item_title" type="text"
									class="form-control validate" required />
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_price">판매가
									</label> <input id="item_price" name="item_price" type="text"
										class="form-control validate" data-large-mode="true" />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_num">재고
									</label> <input id="item_num" name="item_num" type="text"
										class="form-control validate" required />
								</div>
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_size">사이즈/크기
									</label> <input id="item_size" name="item_size" type="text"
										class="form-control validate" required />
								</div>
							</div>
							<div class="form-group mb-3">
								<label for="item_content">상품설명</label>
								<textarea id="item_content" name="item_content"
									class="form-control validate" rows="3" required></textarea>
							</div>

							<hr />
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_group">분류</label> <select
										class="custom-select tm-select-accounts" id="item_group"
										name="item_group">
										<option selected>분류선택</option>
										<option value="MG">머그</option>
										<option value="GL">글라스</option>
										<option value="TB">텀블러</option>
										<option value="TM">보온병</option>
										<option value="AC">액세서리</option>
										<option value="CO">커피용품/원두</option>
									</select>
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_theme">테마</label> <select
										class="custom-select tm-select-accounts" id="item_theme"
										name="item_theme">
										<option selected>테마선택</option>
										<option value="1">20 체리블라썸</option>
										<option value="2">베라왕 X 스타벅스</option>
										<option value="3">시티투어 콜렉션</option>
										<option value="4">스프링 콜렉션</option>
									</select>
								</div>
							</div>

							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_regdate">등록일자
									</label> <input id="item_regdate" name="item_regdate" type="text"
										class="form-control validate" data-large-mode="true" />
								</div>

							</div>
							<br />
						<div class="form group">
								<label style="color:#fff;">파일업로드</label>
							</div>
				<div class="row" id="photoRow" style="height:250px;">
					

				</div>
					<input id="fileBtn" name="fileBtn" type="file" style="display: none;" />
					<button class="btn btn-primary btn-block mx-auto"
						onclick="document.getElementById('fileInput1').click();"
						style="display: none;">UPLOAD PRODUCT IMAGE</button>

				<div class="col-12">
					<button type="submit" id="btnInsert"
						class="btn btn-primary btn-block text-uppercase">Add
						Product Now</button>
				</div></form>
			</div>
		</div>
	</div>
		<!-- row -->
</div>
	<!-- container -->

	<script>
    $(function() {
        $("#item_regdate").datepicker({
          defaultDate: new Date()
        });
      });
      
      
      let main = document.querySelector('#photoRow');
      let cnt = 1;
      
      makeDiv(main);
      
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
    	  // name을 같게하면 배열처리 되는데, 그렇게 되면 버거워짐
    	  img.setAttribute('width', '100%');
    	  img.setAttribute('height', '10%');
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
      
    </script>
  </body>
</html>