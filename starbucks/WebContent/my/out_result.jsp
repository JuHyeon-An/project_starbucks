<%@page import="bean.Shopping_MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${deleteData == 1}">

    <div class="col-md-12 order-2">
        <div class="col-md-12 text-center">
            <span class="icon-check_circle display-3 text-success"></span>
            <h2 class="display-3 text-black">Good bye!</h2>
            <p class="lead mb-5">그동안 스탁벅스를 이용해주셔서 감사합니다.</p>
            <p><a href="/starbucks/" class="btn btn-primary">Back to shop</a></p>
        </div>
    </div>
    <%
   		session.invalidate();
    %>
</c:if>
<c:if test="${deleteData == -1 }">
	<script>
		$(function(){
			
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: '비밀번호가 틀렸습니다.' 
			}).then((result) => {
			  	if (result.value) {
			  		history.back();
			  	}
			});
			
		})
		
	</script>


</c:if>
	