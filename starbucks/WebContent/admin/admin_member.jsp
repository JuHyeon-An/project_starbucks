<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style>
.here{
	background-color:#00ff00;
}
.ho{
	backgroud-color:#0000ff;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="/starbucks/lib/jquery-3.4.1.js"></script>
    <script src="/starbucks/admin/admin_member.js"></script>

   
</head>
<body>

<form name='frm' id='frmm' method='post'>
<input type='text' name='findStr' value= '${param.findStr }' id='findStr'/>
<input type='button' value='검색' name='btnSelect' id='btnSelect'/>
<input type='text' name='nowPage' id='nowPage' value='${empty param.nowPage? 1 : param.nowPage}' />

<div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
	                <h2 class="tm-block-title">Member List</h2>
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
	            </div>

	<div id='page'>
		<c:if test="${page.nowPage >1}">
			<input type='button' value='이전' onclick='goPage(${page.nowPage -1})'/>
		</c:if>
		
		<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			<input type='button' value='${i }'
			${ (i== page.nowPage)? "class='here'" : "class = 'ho'" }
			 onclick='goPage(${i })'/>
			
		</c:forEach>	
		
		<c:if test="${page.nowPage<page.totPage }">
			<input type='button' value='다음' onclick='goPage(${page.nowPage +1})'/>
		</c:if>
	</div>
</form>
	

<script>
func();
$('#accNav').addClass('active');

</script>
</body>
</html>
