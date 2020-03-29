<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import='bean.Shopping_MemberDao'%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id='vo' class='bean.Shopping_MemberVo' scope='page' />
<jsp:setProperty name='vo' property="mId" />
<jsp:setProperty name='vo' property="mName" />
<jsp:setProperty name='vo' property="pwd" />
<jsp:setProperty name='vo' property="phone" />
<jsp:setProperty name='vo' property="email" />
<jsp:setProperty name='vo' property="zip" />
<jsp:setProperty name='vo' property="addr1" />
<jsp:setProperty name='vo' property="addr2" />

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>
<style>
#layer{width:300px;height:200px;position:absolute;left:50%;top:50%; border:1px solid #cc0000;}

</style>
<body>
	<%@include file="../layout/header.jsp"%>
	<!-- Breadcrumb -->
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<a href="/starbucks/">Home</a> <span class="mx-2 mb-0">/</span> <strong
						class="text-black">Join</strong>
				</div>
			</div>
		</div>
	</div>
	<div class="container center-block offset-4 col-4">
		<div aria-labelledby="swal2-title" aria-describedby="swal2-content"
			class="swal2-popup swal2-modal swal2-icon-success swal2-show "
			tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true"
			style="display: flex;">
			<div class="swal2-header">
				<ul class="swal2-progress-steps" style="display: none;"></ul>
				<div class="swal2-icon swal2-error" style="display: none;"></div>
				<div class="swal2-icon swal2-question" style="display: none;"></div>
				<div class="swal2-icon swal2-warning" style="display: none;"></div>
				<div class="swal2-icon swal2-info" style="display: none;"></div>
				<div class="swal2-icon swal2-success swal2-icon-show"
					style="display: flex;">
					<div class="swal2-success-circular-line-left"
						style="background-color: rgb(255, 255, 255);"></div>
					<span class="swal2-success-line-tip"></span> <span
						class="swal2-success-line-long"></span>
					<div class="swal2-success-ring"></div>
					<div class="swal2-success-fix"
						style="background-color: rgb(255, 255, 255);"></div>
					<div class="swal2-success-circular-line-right"
						style="background-color: rgb(255, 255, 255);"></div>
				</div>
				<img class="swal2-image" style="display: none;">
				<h2 class="swal2-title" id="swal2-title" style="display: flex;"> 회원님의 비밀번호가 이메일로 전송되었습니다.</h2>
				<button type="button" class="swal2-close"
					aria-label="Close this dialog" style="display: none;">×</button>
			</div>
			<div class="swal2-content">
				<div id="swal2-content" class="swal2-html-container"
					style="display: none;"></div>
				<input class="swal2-input" style="display: none;"><input
					type="file" class="swal2-file" style="display: none;">
				<div class="swal2-range" style="display: none;">
					<input type="range">
					<output></output>
				</div>
				<select class="swal2-select" style="display: none;"></select>
				<div class="swal2-radio" style="display: none;"></div>
				<label for="swal2-checkbox" class="swal2-checkbox"
					style="display: none;"><input type="checkbox"><span
					class="swal2-label"></span></label>
				<textarea class="swal2-textarea" style="display: none;"></textarea>
				<div class="swal2-validation-message" id="swal2-validation-message"></div>
			</div>
			<div class="swal2-actions">
				<button type="button" class="swal2-confirm swal2-styled"
					aria-label=""
					style="display: inline-block; background-color: rgb(48, 133, 214); border-left-color: rgb(48, 133, 214); border-right-color: rgb(48, 133, 214);">
					<a href="/starbucks/index.jsp" style="color: #fff;">홈</a>
				</button>
				<button type="button" class="swal2-cancel swal2-styled"
					aria-label=""
					style="display: inline-block; background-color: rgb(0, 102, 51);">
					<a href="/starbucks/member/login.jsp" style="color: #fff;">로그인</a>
				</button>
			</div>
			<div class="swal2-footer" style="display: none;"></div>
			<div class="swal2-timer-progress-bar-container">
				<div class="swal2-timer-progress-bar" style="display: none;"></div>
			</div>
		</div>

	</div>



	<%@include file="../layout/footer.jsp"%>

</body>
</html>