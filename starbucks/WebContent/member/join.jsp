<%@page import="bean.Shopping_MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
</head>
<body>

<%@include file="../layout/header.jsp" %>
    <!-- Breadcrumb -->
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="/starbucks/">Home</a> <span class="mx-2 mb-0">/</span> 
                    <strong class="text-black">Join</strong>
                </div>
            </div>
        </div>
    </div>

<div class='row'></div>    
<div class="container center-block">

	<div class="offset-sm-3 col-sm-6 ">
		<div class="jumbotron center-block" >
			<form action="/starbucks/member/join_result.jsp" method='post'>
				<h3 style='text-align:center;'> 회원가입</h3> <br />
				<div class="form-group form-inline">
				
					<input type="text" class='form-control col-sm-12' placeholder='아이디' name='mId' id='mId' maxlength='20' required/>
<!-- 					<input type="button" class='btn btn-primary col-sm-4 offset-1' value='중복체크' id='idck' /> -->
				<div id='id_check' class='col-sm-12'></div>
				</div>
		
				<div class="form-group">
					<input type="password" class='form-control' placeholder='비밀번호' name='pwd' id='pwd' maxlength='20'required/>
				</div>
				<div class="form-group">
					<input type="password" class='form-control' placeholder='비밀번호 확인' name='pwd2' id='pwd2'  maxlength='20'required/>
				</div>
				<div class="form-group ">
					<input type="text" class='form-control' placeholder='이름' name='mName' maxlength='20' required />
					


					
				</div>

				<div class="form-group">
					<input type="text" class='form-control' placeholder='전화번호' name='phone' maxlength='20' required/>
				</div>
				<div class="form-group form-inline">
					<input type="text" class='form-control col-sm-6' placeholder='우편번호' name='zip' id='zip' maxlength='50' required/>
					<input type="button" class='btn btn-primary col-sm-4 offset-1' value='검색' onclick='execDaumPostcode()' />
					<input type="text" class='form-control col-12' placeholder='기본주소' name='addr1' id='addr1' maxlength='50' required/>
					<input type="text" class='form-control col-12' placeholder='상세주소' name='addr2' id='addr2' maxlength='50' required/>
					
				</div>

				
				<div class="form-group">
					<input type="email" class='form-control' placeholder='이메일' name='email' maxlength='50' required/>
				</div>
				<input type="submit" class='btn btn-primary form-control' value="회원가입" />
			</form>

		</div>
	</div>

</div>

<script>
var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
var nameCheck = RegExp(/^[가-힣]{2,6}$/);
var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
var birthdayCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);
var enCheck = RegExp(/[^a-zA-Z]$/);

var enCheck = RegExp(/[^a-zA-Z]$/);

var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
$('#email').keyup(function(){
	if(emailCheck.test($('#email').val())){
		$('#email').val($('#email').val().replace(/[^a-z]/gi,''));
	}
});

</script>


<script>

	$('#pwd2').blur(function(){
		if($('#pwd').val() != $('#pwd2').val()){
			if($('#pwd2').val()!=''){
				Swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: '비밀번호가 일치하지 않습니다.',
					
					})
					  $('#pwd2').val('');
					$('#pwd2').focus();
				
			}
		}
	})


$("#mId").blur(function() {
    //사용자가 입력한 아이디
    var mId = $("#mId").val();
    //입력한 아이디를 파라미터로 담아주기위한 변수
    var param = "mId=" + mId;
    if (mId.length >= 2) { 
    //ajax를 이용하여 아이디 중복체크 서블릿을 호출하여 실행된 결과값을 #id_check에 표시해줌
        $.ajax({
            type : "post",
            url : "idck.sm",
            data : param,
            success : function(result) {
                $("#id_check").html(result);
            }
        })
    }
});
//버튼클릭 이벤트
/*
$("#idck").click(function() {
    //사용자가 입력한 아이디
    var mId = $("#mId").val();
    var param = "mId=" + mId;
   
        $.ajax({
            type : "post",
            url : "idck.sm",
            data : param,
            success : function(result) {
                $("#id_check").html(result);
            }
        })});
*/











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
</script>





    
    
<%@include file="../layout/footer.jsp" %>

</body>
</html>