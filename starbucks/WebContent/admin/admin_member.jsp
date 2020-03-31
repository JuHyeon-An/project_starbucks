<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="/starbucks/lib/jquery-3.4.1.js"></script>
    <script src="/starbucks/admin/admin_member.js"></script>

   
</head>
<body>

<form name='frm' id='frmm' method='post' style='margin:130px'>
<div id="mainDiv" class="tm-bg-primary-dark tm-block tm-block-products">
	               <h2 class="tm-block-title text-center" >Member List</h2>
<div class='row'>
<div class='col-lg-8'> </div>
<div class='btn-xs  input-group col-lg-4 mb-2'  >

<input type='text' name='findStr' value= '${param.findStr }' id='findStr'class="form-control validate 2" placeholder='아이디 또는 이름을 검색해주세요' />
<input type='button' value='검색' name='btnSelect' id='btnSelect' class='input-group-text search-span'/>
<input type='hidden' name='nowPage' id='nowPage' value='${empty param.nowPage? 1 : param.nowPage}' />
</div>
</div>
	                <table class="table">
	                
	                    <thead>
	                        <tr>
	                            <th scope="col">아이디</th>
	                            <th scope="col">이름</th>
	                            <th scope="col">연락처</th>
	                            <th scope="col">이메일</th>
	                            <th scope="col">가입날짜</th>
	                            <th scope="col">적립금</th>
	                        
	                        </tr>
	                    </thead>
	                    <tbody>
	               
								<c:forEach var="vo" items="${list }">	
								
	                        <tr id='list'onclick="view('${vo.mId}')">
	                          
	                           <td><b>${vo.mId}</b></td>
	                            <td><b>${vo.mName}</b></td>
	                            <td><b>${vo.phone}</b></td>
	                            
	                         	<td>${vo.email}</td>
								<td>${vo.rDate}</td>
	                         	<td>${vo.savedMoney}</td>
	                         
								
	                         
	                            <input type='hidden' name='mId' id='mId' />
								<input type='hidden' name='mName' id='mName'/>
								<input type='hidden' name='phone' id='phone'/>	
								
								<input type='hidden' name='email' id='email'/>
	                            <input type='hidden' name='rDate' id='rDate'/>
	                            <input type='hidden' name='savedMoney' id='savedMoney'/>
	                            
	                            
	                         
	                            </tr>
	                         
	                            </c:forEach>
	                    </tbody>
	            	    </table>
	<div id='page' class='text-center mt-1'>
		<c:if test="${page.nowPage >1}">
			<input type='button' value='이전' onclick='goPage(${page.nowPage -1})' class='btn-sm btn-ok'/>
		</c:if>
		
		<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			<input type='button' value='${i }' class= 
			'${ (i== page.nowPage)? "btn-sm btn-sw" : "btn-sm btn-ok" }'
			 onclick='goPage(${i })'/>
			
		</c:forEach>	
		
		<c:if test="${page.nowPage<page.totPage }">
			<input type='button' value='다음' onclick='goPage(${page.nowPage +1})'class='btn-sm btn-ok'/>
		</c:if>
	</div>
	            </div>
</div>
</form>
	

<script>
func();
$('#accNav').addClass('active');

</script>
</body>
</html>
