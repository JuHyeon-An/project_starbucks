<%@page import="bean.OrderVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<input type='hidden' name='findStr' value= '${param.findStr }' id='findStr'/>
<input type= 'hidden'  name='findStr'  value='${param.findStr }'/>
<input type= 'hidden'  name='nowPage'  value='${param.nowPage }'/>

<div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
	                <h2 class="tm-block-title">Orders List</h2>
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
	               
								
								
	                        <tr  id='order' name='orderl method='post' >
	                          
	                        
	                         	
	                         	 <td>
	                            <input type='text' name='orderNumber' id='orderNumber' value='${param.orderNumber}' readonly/>
								</td>
								<td>
								<input type='text' name='memberId' id='memberId' value='${param.memberId   }'readonly />
								</td>
								<td>
								<input type='text' name='itemCode' id='itemCode' value='${param.itemCode  }' readonly/>	
								</td>
								<td>
								<input type='text' name='orderNum' id='orderNum' value='${param.orderNum   }'readonly/>
	                            </td>
	                            <td>
	                            <input type='text' name='orderPrice' id='orderPrice'  value='${param.orderPrice  }'readonly />
	                            </td>
	                            <td>
	                            <input type='text' name='orderregDate' id='orderregDate' value='${param.orderregDate  }' readonly/>
	                            </td>
	                            <td>
	                            
	                            <select name='orderStatus' id='orderStatus'>
	                            <option value='1'<c:if test="${param.orderStatus eq 1}">selected</c:if> >주문취소</option>
	                            <option value='2'<c:if test="${param.orderStatus eq 2}">selected</c:if>>승인대기 </option>
	                            <option value='3'<c:if test="${param.orderStatus eq 3}">selected</c:if>  >주문완료</option>
	                            <!-- 1 주문취소 2 승인대기 3 주문완료 -->
	                            
	                            </select>
	                          	</td>
	                            
	                            </tr>
	                         	
	                      
	                    </tbody>
	                </table>
	            </div>
	
	<%
		OrderVo vo = (OrderVo)request.getAttribute("vo");  
		
		%>
	
		
			
<input type= 'button'  id='btnSelect' name='btnSelect' value='목록'/>
<input type= 'button'  id='btnModify' name='btnModify' value='수정'/>

</form>

${msg };
	
</body>
<script>
func();
</script>
</html>
