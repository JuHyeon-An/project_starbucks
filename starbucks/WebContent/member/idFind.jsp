<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
						class="text-black">아이디 찾기</strong>
				</div>
			</div>
		</div>
	</div>
	<div class="container form-inline col-12">

		<div class="row text-center col-12">
			<div class="offset-5 col-sm-2">

				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="post" action="idFindR.email">
						<legend>아이디 찾기</legend>
						<div class="input-group">
							<input type="text" name="mName" value='' placeholder="이름을 입력하세요"
								class="form-control" required />
						</div>
						<div class="input-group">
							<input type="text" name="email" value='' placeholder="이메일을 입력하세요" class="form-control"  required/>
						</div>
						<button type="submit" id="login-submit"
							class="btn btn-default btn-block" />
						아이디 찾기
						</button>

					</form>
				</div>

			</div>
		</div>
	

</div>

<script>

</script>

	<!-- Breadcrumb END -->

	<!-- Content -->

	<!-- Content END-->

	<%@include file="../layout/footer.jsp"%>

</body>
</html>