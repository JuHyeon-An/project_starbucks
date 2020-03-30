<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- (주문)결제 성공  --> 
<c:if test="${result == 1}">
	<div class="col-md-12 order-2">
	    <div class="col-md-12 text-center">
	        <span class="icon-check_circle display-3 text-success"></span>
	        <h2 class="display-3 text-black">Thank you!</h2>
	        <p class="lead mb-5">You order was successfuly completed.</p>
	        <p><a href="../product/list.jsp" class="btn btn-sm btn-primary">Back to shop</a></p>
	    </div>
	</div>
</c:if>

<!-- (주문)결제 실패  --> 
<c:if test="${result == 0}">
	<script>
		$(function(){
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: '주문처리중 오류가 발생하였습니다.' 
			}).then((result) => {
			  	if (result.value) {
			  		history.back();
			  	}
			});
		})
	</script>
</c:if>