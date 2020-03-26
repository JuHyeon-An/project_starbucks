<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <body>
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-10 col-lg-11 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">아이템 편집</h2>
						</div>
					</div>
					<form id="productFrm" name="productFrm" method="post" action="add_productR.stb" enctype="multipart/form-data"
						class="tm-edit-product-row">
						<div class="col-xl-12 col-lg-12 col-md-12">
							
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_code">상품코드
									</label> <input id="item_code" name="item_code" value="${vo.item_code }" type="text"
										class="form-control validate" data-large-mode="true"
										style="color:black; font-weight:bold;"
										readonly/>
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
								</div>
								
							</div>
							<div class="form-group mb-3">
								<label for="item_title">상품명 </label> <input
									id="item_title" name="item_title" type="text" value = "${vo.item_title }"
									class="form-control validate" required />
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_price">판매가
									</label> <input id="item_price" name="item_price" type="text" value="${vo.item_price }"
										class="form-control validate" data-large-mode="true" />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_num">재고
									</label> <input id="item_num" name="item_num" type="text" value="${vo.item_num }"
										class="form-control validate" required />
								</div>
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_size">사이즈/크기
									</label> <input id="item_size" name="item_size" type="text" value="${vo.item_size }"
										class="form-control validate" required />
								</div>
							</div>
							<div class="form-group mb-3">
								<label for="item_content">상품설명</label>
								<textarea id="item_content" name="item_content"
									class="form-control validate" rows="3" required>${vo.item_content }</textarea>
							</div>

							<hr />
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_group">분류</label> <select
										class="custom-select tm-select-accounts" id="item_group"
										name="item_group">
										<option value= "MG" 
												<c:if test="${vo.item_group eq 'MG' }"> selected </c:if>
												>머그</option>
										<option value="GL"
												<c:if test="${vo.item_group eq 'GL' }"> selected </c:if>
												>글라스</option>
										<option value="TB"
												<c:if test="${vo.item_group eq 'TB' }"> selected </c:if>
												>텀블러</option>
										<option value="TM"
												<c:if test="${vo.item_group eq 'TM' }"> selected </c:if>
												>보온병</option>
										<option value="AC"
												<c:if test="${vo.item_group eq 'AC' }"> selected </c:if>
												>액세서리</option>
										<option value="CO"
												<c:if test="${vo.item_group eq 'CO' }"> selected </c:if>
												>커피용품/원두</option>
									</select>
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_theme">테마</label> <select
										class="custom-select tm-select-accounts" id="item_theme"
										name="item_theme">
										<option value="20 체리블라썸"
											<c:if test="${vo.item_theme eq '20 체리블라썸' }"> selected </c:if>
											>20 체리블라썸</option>
										<option value="베라왕 X 스타벅스"
											<c:if test="${vo.item_theme eq '베라왕 X 스타벅스' }"> selected </c:if>
											>베라왕 X 스타벅스</option>
										<option value="시티투어 콜렉션"
											<c:if test="${vo.item_theme eq '시티투어 콜렉션' }"> selected </c:if>
											>시티투어 콜렉션</option>
										<option value="스프링 콜렉션"
											<c:if test="${vo.item_theme eq '스프링 콜렉션' }"> selected </c:if>
										>	스프링 콜렉션</option>
									</select>
								</div>
							</div>
							
							<fmt:parseDate value="${vo.item_regDate}" pattern="yyyy-MM-dd HH:mm:ss" var="temp" />
							<fmt:formatDate value="${temp }" pattern="yyyy-MM-dd" var="regDate"/>
							
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_regdate">등록일자
									</label> <input id="item_regdate" name="item_regdate" type="text" value="${regDate }"
										class="form-control validate" data-large-mode="true" />
								</div>

							</div>
							<br />
						<div class="form group">
								<label style="color:#fff;">파일업로드</label>
							</div>
				<div class="row" id="photoRow" style="height:250px;">
								<div class="form-group mb-3 col-xs-12 col-sm-4">
									<div class="tm-product-img-dummy mx-auto">
										<img name="photo1" width="100%" height="100%"
											src="../fileFolder/${vo.item_mainimg }">
									</div>
									<input type="file" name="fileInput1" style="display: none">
								</div>
								
								<div class="form-group mb-3 col-xs-12 col-sm-4">
									<div class="tm-product-img-dummy mx-auto">
										<img name="photo2" width="100%" height="100%"
											src="../fileFolder/${vo.item_thumbnailimg }">
									</div>
									<input type="file" name="fileInput2" style="display: none">
								</div>
								
								<div class="form-group mb-3 col-xs-12 col-sm-4">
									<div class="tm-product-img-dummy mx-auto">
										<img name="photo3" width="100%" height="100%"
											src="../fileFolder/${vo.item_contentimg }">
									</div>
									<input type="file" name="fileInput3" style="display: none">
								</div>

							</div>
					<input id="fileBtn" name="fileBtn" type="file" style="display: none;" />
					<button class="btn btn-primary btn-block mx-auto"
						onclick="document.getElementById('fileInput1').click();"
						style="display: none;">UPLOAD PRODUCT IMAGE</button>
				<br/>
				<div class="row">
				<div class="col-6">
					<button type="submit" id="btnInsert"
						class="btn btn-primary btn-block text-uppercase">저장하기</button>
				</div>
				
				<div class="col-6">
					<button type="submit" id="btnInsert"
						class="btn btn-primary btn-block text-uppercase">삭제하기</button>
				</div>
				</div>
				</form>
			</div>
		</div>
	</div>
		<!-- row -->
</div>
	<!-- container -->

	<script>
	
	$('#proNav').addClass('active');

    $(function() {
        $("#item_regdate").datepicker({
          defaultDate: "2020-03-26"
        });
      });
      
      
    /*
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
		*/
      
	//TODO : 사진에 마우스 올리면 삭제할 수 있는 버튼? 등장하게!!!
      
    </script>
  </body>
</html>