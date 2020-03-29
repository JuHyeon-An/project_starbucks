<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>상품조회</title>
  </head>
<body>
	<div class="container mt-5">
		<div class="row tm-content-row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
				<div id="mainDiv"
					class="tm-bg-primary-dark tm-block tm-block-products">
					<div class="row">
					<div class="input-group col-lg-3"></div>
					<form id="frmSearch" method="post" name="frmSearch" class="input-group col-lg-6 mb-3">
						<select class="custom-select tm-select-accounts">
						<option>종류선택</option>
						<option>종류선택</option>
						<option>종류선택</option>
						<option>종류선택</option>
						<option>종류선택</option>
						</select>
						<input type="text" class="form-control" placeholder="상품명 또는 상품코드로 검색"
							id="findStr" name="findStr" value="${ empty param.findStr? findStr : param.findStr }">
						<div class="input-group-append">
							<input type="button" class="input-group-text search-span" id="btnSearch-item" 
							name="btnSearch-item" value="검색"/>
						</div>
						</form>
						<div class="input-group col-lg-3"></div>
					</div>
					<div id = "tableContainer" class="tm-product-table-container">
						<table id="selectTable"
							class="table table-hover tm-table-small tm-product-table">
							<thead>
								<tr>
									<th class="text-center" scope="col">&nbsp;</th>
									<!-- 사진 -->
									<th class="text-center" scope="col">상품코드</th>
									<th class="text-center" scope="col">상품명</th>
									<th class="text-center" scope="col">판매가</th>
									<th class="text-center" scope="col">재고</th>
									<th class="text-center" scope="col">판매상태</th>
									<th class="text-center" scope="col">등록일</th>
									<th class="text-center" scope="col">&nbsp;</th>
								</tr>
							</thead>
							<tbody id="selectTbody">
								<c:forEach var="vo" items="${list }">
									<fmt:parseDate value="${vo.item_regDate}"
										pattern="yyyy-MM-dd HH:mm:ss" var="temp" />
									<fmt:formatDate value="${temp }" pattern="yyyy-MM-dd"
										var="regDate" />
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${vo.item_price}" var="price" />

									<tr>
										<td scope="row"><img width="95%" height="95%"
											class="round text-center" alt="Starbucks Starbucks Korea 2020 Spring "
											onclick="image_viewer('img14367')"
											src="../fileFolder/${vo.item_thumbnailimg }"
											style="display: block;"></td>
										<td class="text-center" onclick='goEdit("${vo.item_code}")'>${vo.item_code }</td>
										<td class="tm-product-name text-center"
											onclick='goEdit("${vo.item_code}")'>${vo.item_title }</td>
										<td class="text-center">${price }</td>
										<td class="text-center">${vo.item_num }</td>
										<td class="text-center">${vo.item_status}</td>
										<td class="text-center">${regDate }</td>
										<td class="text-center"><a href="#" onclick="deleteItem('${vo.item_code}')"
											class="tm-product-delete-link"> <i
												class="far fa-trash-alt tm-product-delete-icon"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- table container -->
					<a href="./add_product.stb"
						class="btn btn-primary btn-block text-uppercase mb-3">Add new
						product</a>
					<button class="btn btn-primary btn-block text-uppercase">
						Delete selected products</button>
				</div>
			</div>

		</div>
	</div>
	<form id="codeForm" name="codeForm" method="post">
	<input type="hidden" id="hidden_code" name="hidden_code"/>
	</form>
    <script>
   $(document).ready(function(){
	    $('#proNav').addClass('active');
    })
    
    
    </script>
  </body>
</html>