<%@page import="bean.OrderVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/starbucks/lib/jquery-3.4.1.js"></script>
<script src="/starbucks/admin/order.js"></script>


</head>
<body>

	<form name='frm' id='frmm' method='post'>

		<input type='hidden' name='findStr' value='${param.findStr }'id='findStr' /> 
		<input type='hidden' name='findStr' value='${param.findStr }' /> 
		<input type='hidden' name='nowPage'	value='${param.nowPage }' />
		<input type="hidden" id="editMsg" value="${msg }"/>
	
		<div
			class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
			<h2 class="tm-block-title text-center">주문      내역</h2>
			<table class="table">

				<thead>
					<tr>
						<th scope="col">주문번호</th>
						<th scope="col">아이디</th>
						<th scope="col">상품코드</th>
						<th scope="col">상품갯수</th>
						<th scope="col">총가격</th>
						<th scope="col">주문날짜</th>
						<th scope="col">주문상태</th>
					</tr>
				</thead>
				<tbody>



					<tr id='order' name='order'>

						<td><input type='text' name='orderNumber' id='orderNumber'
							value='${param.orderNumber}'style='background-color: transparent; border: none; color: aliceblue;'   readonly /></td>
						<td><input type='text' name='memberId' id='memberId'
							value='${param.memberId   }'style='background-color: transparent; border: none; color: aliceblue;' readonly /></td>
						<td><input type='text' name='itemCode' id='itemCode'
							value='${param.itemCode  }' style='background-color: transparent; border: none; color: aliceblue;'readonly /></td>
						<td><input type='text' name='orderNum' id='orderNum'
							value='${param.orderNum   }'style='background-color: transparent; border: none; color: aliceblue;' readonly /></td>
						<td><input type='text' name='orderPrice' id='orderPrice'
							value='${param.orderPrice  }'style='background-color: transparent; border: none; color: aliceblue;' readonly /></td>
						<td><input type='text' name='orderregDate' id='orderregDate'
							value='${param.orderregDate  }'style='background-color: transparent; border: none; color: aliceblue;' readonly /></td>
						
					
						<td><select name='orderStatus' id='orderStatus'>
							<option value='1'
									 <c:if test="${param.orderStatus eq '1'}">selected</c:if>>주문취소</option> 
							<option value='2'
									<c:if test="${param.orderStatus eq '2'}">selected</c:if>>승인대기</option>
								<option value='3'
									<c:if test="${param.orderStatus eq '3'}">selected</c:if>>주문완료</option>
								<!-- 1 주문취소 2 승인대기 3 주문완료 -->

						</select></td>

					</tr>


				</tbody>
			</table>
		<div class="row mt-4">
			<div class="col-4      "></div>
			<div class="  col-lg-2	     ">

				<button type="submit"
					class="btn btn-primary btn-block text-uppercase" id="btnModify">수정</button>
			</div>
			<div class="col-2      ">

				<button type="submit"
					class="btn btn-primary btn-block text-uppercase" id="btnSelect">목록</button>
			</div>
		</div>
	
		</div>

	</form>
</div>
</body>
<script>
func();
/*  $(function(){
    var responseMessage = "<c:out value="${msg}" />";
    
    if(responseMessage != ""){
        alert(responseMessage)
    }
})  */ 

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
		location.href="order.order"
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
			location.href="order.order"
		}
	})
	}
}



</script>
</html>
