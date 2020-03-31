<%@page import="bean.Shopping_MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<script src="/starbucks/lib/jquery-3.4.1.js"></script>
<script src="/starbucks/admin/admin_member.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
									type="text" value="${vo.mId }" readonly class="form-control validate" />
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
									type="text" value="${vo.rDate }"readonly class="form-control validate" />
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
							<div class="form-group col-lg-3">
								<label for="addr2">상세주소</label> <input id="addr2" name="addr2"
									value="${vo.addr2 }" type="text" class="form-control validate" />
							</div>
							<div>
							<label>&nbsp;&nbsp;</label><input type="button" class="form-control validate btn btn-info btn-block text-uppercase" value='검색' onclick='execDaumPostcode()' />
							
							</div>
							
							
							
							
							<!-- <div class="form-group col-lg-2" >
						<input id="search" name="search"
						type="button" onclick='search()' value='검색' class="form-control validate btn btn-primary btn-block text-uppercase" />
								
							</div> -->
							
							
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

<script>
	func();
	function execDaumPostcode() {
		new daum.Postcode({
		    oncomplete: function(data) {
		    var fullRoadAddr = data.roadAddress;
		    var extraRoadAddr = "";
		    // 법정동명이 있을 경우 추가 (법정리는 제외)
		    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝남
		    if (data.bname != "" && /[동|로|가]$/g.test(data.bname)) {
		        extraRoadAddr += data.bname;
		    }
		    // 건물명이 있고, 공동주택일 경우 추가
		    if (data.buildingName != "" && data.apartment == "Y") {
		        extraRoadAddr += (extraRoadAddr !== "" ? ", " + data.buildingName : data.buildingName);
		    }
		    // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열 생성
		    if (extraRoadAddr != "") {
		        extraRoadAddr = " (" + extraRoadAddr + ")" ;
		    }
		    // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소 추가
		    if (fullRoadAddr != "") {
		        fullRoadAddr += extraRoadAddr;
		    }
		    // 우편번호, 주소 값 바인딩
		    $("#zip").val(data.zonecode);
		    $("#addr1").val(fullRoadAddr);
		    $("#addr2").focus();
		    
		    }
		}).open();
		}

		$(document).ready(function(){

		$("#addr2").keyup(function(){

			$("#address").text($("#addr2").val());

		});

		});
		
		
		
		
		 $(function(){
		        var responseMessage = "<c:out value="${msg}" />";
		        if(responseMessage != ""){
		            alert(responseMessage)
		        }
		    }) 


	
		
		

</script>

</body>
</html>
