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
    <title>Product Page - Admin HTML Template</title>
  </head>
<body>
 <div class="container mt-5">
      <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-products">
            <div class="tm-product-table-container">
              <table class="table table-hover tm-table-small tm-product-table">
                <thead>
                  <tr>
                    <th scope="col">&nbsp;</th> <!-- 사진 -->
                    <th scope="col">상품명</th>
                    <th scope="col">판매가</th>
                    <th scope="col">재고</th>
                    <th scope="col">등록일</th>
                    <th scope="col">&nbsp;</th>
                  </tr>
                </thead>
                
                <tbody>
                <c:forEach var="vo" items="${list }">
	                <fmt:parseDate value="${vo.item_regDate}" pattern="yyyy-MM-dd HH:mm:ss" var="temp" />
					<fmt:formatDate value="${temp }" pattern="yyyy-MM-dd" var="regDate"/>
	                <fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.item_price}" var="price"/>

                  <tr>
                    <td scope="row">
								<img
									data-original="../fileFolder/"${vo.item_thumnailimg }
									width="50px" class="round z-index-top lazy" id="img14367"
									alt="Starbucks Starbucks Korea 2020 Spring "
									onclick="image_viewer('img14367')"
									src="../fileFolder/${vo.item_thumnailimg }"
									style="display: block;"></td>
                    <td class="tm-product-name">${vo.item_title }</td>
                    <td>${price }</td>
                    <td>${vo.item_num }</td>
                    <td>${regDate }</td>
                    <td>
                      <a href="#" class="tm-product-delete-link">
                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                      </a>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- table container -->
            <a
              href="#"
              onclick='goUrl("/admin", "/add_product.jsp")'
              class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
            <button class="btn btn-primary btn-block text-uppercase">
              Delete selected products
            </button>
          </div>
        </div>
        
      </div>
    </div>

    <script>
      $(function() {
        $(".tm-product-name").on("click", function() {
          goUrl("/admin", "/edit_product.jsp");
        });
      });
    </script>
  </body>
</html>