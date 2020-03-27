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
					<form id="editFrm" name="editFrm" method="post" 
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
									<div class="tm-product-img-dummy mx-auto"
										  >
										<img id = "photoEdit1" name="photo1" width="100%" height="100%"
											src="../fileFolder/${vo.item_mainimg }" onclick="preview(1);">
									<input type="file" id = "fileEdit1" name="fileInput1" style="display: none"
									>
									</div>
								</div>
								
								<div class="form-group mb-3 col-xs-12 col-sm-4">
									<div class="tm-product-img-dummy mx-auto">
										<img id = "photoEdit2" name="photo2" width="100%" height="100%"
											src="../fileFolder/${vo.item_thumbnailimg }" onclick="preview(2);">
									<input type="file" id = "fileEdit2" name="fileInput2" style="display: none">
									</div>
								</div>
								
								<div class="form-group mb-3 col-xs-12 col-sm-4">
									<div class="tm-product-img-dummy mx-auto">
										<img id = "photoEdit3" name="photo3" width="100%" height="100%"
											src="../fileFolder/${vo.item_contentimg }"
											 onclick="preview(3);">
									<input type="file" id = "fileEdit3" name="fileInput3" style="display: none">
									</div>
								</div>

							</div>
				<br/>
				<div class="row">
				
				<div class="col-6">
					<input type="button" id="btnUpdate"
						class="btn btn-primary btn-block text-uppercase" value="저장하기">
				</div>
				
				<div class="col-6">
					<input type="button" id="btnDelete" onclick="deleteItem('${vo.item_code}')"
						class="btn btn-primary btn-block text-uppercase" value="삭제하기">
				</div>
				
				
				</div>
				</form>
			</div>
		</div>
	</div>
		<!-- row -->
</div>
	<!-- container -->
<div id = result>
</div>
	<script>
	
	$('#proNav').addClass('active');

    $(function() {
        $("#item_regdate").datepicker({
          defaultDate: "2020-03-26"
        });
      });

    </script>
  </body>
</html>