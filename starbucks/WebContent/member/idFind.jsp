<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src='<%=request.getContextPath() %>/lib/jquery-3.4.1.js'></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/css/bootstrap.css" />

</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<!-- Breadcrumb -->
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<a href="/starbucks/">Home</a> <span class="mx-2 mb-0">/</span> <strong
						class="text-black">비밀번호 찾기</strong>
				</div>
			</div>
		</div>
	</div>
<c:set var='r' value='1'></c:set>
	<div class="container form-inline col-12">
	<div class='row offset-4 col-sm-3'>
		<input type="button" class='btn btn-default' value="아이디 찾기" onclick='btnCheck(1)' />
		<input type="button" class='btn btn-default' value="비밀번호 찾기"  onclick='btnCheck(2)'/>
	</div>
<c:if test="${r==1}">
		<div class="row text-center col-12">
			<div class="offset-4 col-sm-3">

				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="post"
						action="/starbucks/member/login_result.jsp">
						<legend>아이디 찾기</legend>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" name="mId" value='${r }' placeholder="이름을 입력하세요"
								class="form-control" />
						</div>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" name="pwd" value=''
								placeholder="이메일을 입력하세요" class="form-control" />
						</div>
						<button type="submit" id="login-submit"
							class="btn btn-default btn-block" />
						아이디 찾기
						</button>

					</form>
				</div>

			</div>
		</div>
</c:if>
<c:if test="${r==2}">		
	<div class="row text-center col-12">
			
			<div class="col-sm-4">

				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="post"
						action="/starbucks/member/login_result.jsp">
						<legend>비밀번호 찾기</legend>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" name="mId" value='' placeholder="아이디를 입력하세요"
								class="form-control" />
						</div>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" name="pwd" value=''
								placeholder="이름을 입력하세요" class="form-control" />
						</div>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" name="pwd" value=''
								placeholder="이메일를 입력하세요" class="form-control" />
						</div>
						<button type="submit" id="login-submit"
							class="btn btn-default btn-block" />
						비밀번호 찾기
						</button>
						
						<div class="form-group"></div>
					</form>
				</div>

			</div>
		</div>
</c:if>
</div>

<script>
let btnCheck = function(num){
	${r= num}; 
}

</script>

	<!-- Breadcrumb END -->

	<!-- Content -->

	<!-- Content END-->

	<%@include file="../layout/footer.jsp"%>

</body>
</html>