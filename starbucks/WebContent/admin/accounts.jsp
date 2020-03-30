<%@page import="bean.Shopping_MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<script src="/starbucks/lib/jquery-3.4.1.js"></script>
<script src="/starbucks/admin/admin_member.js"></script>
</head>

<form name='frm' id='frmm' method='post'>
	<input type='hidden' name='findStr' value='${param.findStr }'
		id='findStr' /> <input type='hidden' name='findStr'
		value='${param.findStr }' /> <input type='hidden' name='nowPage'
		value='${param.nowPage }' />


	<div class="container mt-5">
		<div class="row tm-content-row">
			<div class="col-12 tm-block-col"></div>
		</div>
		<!-- row -->
		<div class="row">

			<div class="col-12">
				<div class="tm-bg-primary-dark tm-block tm-block-settings">
					<h2 class="tm-block-title text-center">회원 상세보기</h2>
					<form action="" class="tm-signup-form">
						<div class="row">
							<div class="form-group col-lg-4">
								<label for="mId">아이디</label> <input id="mId" name="mId"
									type="text" value="${vo.mId }" class="form-control validate" />
							</div>
							<div class="form-group col-lg-4	">
								<label for="mName">이름</label> <input id="mName" name="mName"
									value="${vo.mName }" type="text" class="form-control validate" />
							</div>
							<div class="form-group col-lg-4">
								<label for="savedMoney">적립금</label> <input id="savedMoney"
									name="savedMoney" type="text" value="${vo.savedMoney }"
									class="form-control validate" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-lg-4">
								<label for="email">이메일</label> <input id="email" name="email"
									type="text" value="${vo.email }" class="form-control validate" />
							</div>
							<div class="form-group col-lg-4">
								<label for="phone">연락처</label> <input id="phone" name="phone"
									type="text" value="${vo.phone }" class="form-control validate" />
							</div>

							<div class="form-group col-lg-4">
								<label for="rDate">가입날짜</label> <input id="rDate" name="rDate"
									type="text" value="${vo.rDate }" class="form-control validate" />
							</div>

						</div>

						<div class="row">
							<div class="form-group col-lg-2">
								<label for="zip">우편번호</label> <input id="zip" name="zip"
									value="${vo.zip }" type="text" class="form-control validate" />
							</div>
							<div class="form-group col-lg-5">
								<label for="addr1">주소</label> <input id="addr1" name="addr1"
									value="${vo.addr1 }" type="text" class="form-control validate" />
							</div>
							<div class="form-group col-lg-5">
								<label for="addr2">상세주소</label> <input id="addr2" name="addr2"
									value="${vo.addr2 }" type="text" class="form-control validate" />
							</div>
						</div>

						<div class="row">
									<div class="col-4      ">

								
									
									</div>
							<div class="  col-lg-2	     ">

								<button type="submit"
									class="btn btn-primary btn-block text-uppercase"
									id="btnModify_Member">프로필 수정</button>
							</div>
							<div class="col-2      ">

								<button type="submit"
									class="btn btn-primary btn-block text-uppercase" id="btnSelect">
									목록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</form>

${msg }
<script>
	func();
</script>

</body>
</html>
