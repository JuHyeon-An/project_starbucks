<%@page import="bean.Shopping_MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
				
					<input type="text" class='form-control col-sm-12' placeholder='아이디' name='mId' id='mId' maxlength='20'/>
<!-- 					<input type="button" class='btn btn-primary col-sm-4 offset-1' value='중복체크' id='idck' /> -->
				<div id='id_check' class='col-sm-12'></div>
				</div>
		
				<div class="form-group">
					<input type="password" class='form-control' placeholder='비밀번호' name='pwd' maxlength='20'/>
				</div>
				<div class="form-group ">
					<input type="text" class='form-control' placeholder='이름' name='mName' maxlength='20'/>
					
<!-- 					<div class="form-group offset-sm-1 " style='text-align:center;'> -->
<!-- 						<div class='btn-group' data-toggle='buttons'> -->
<!-- 						<label class='btn btn-primary active '> -->
<!-- 							<input type="radio" name="userGender" autocomplete="off" value="남자" checked />남자 -->
<!-- 						</label> -->
<!-- 						<label class='btn btn-primary'> -->
<!-- 							<input type="radio" name="userGender" autocomplete="off" value="여자" />여자 -->
<!-- 						</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
				</div>

				<div class="form-group">
					<input type="text" class='form-control' placeholder='전화번호' name='phone' maxlength='20'/>
				</div>
				<div class="form-group form-inline">
					<input type="text" class='form-control col-sm-6' placeholder='우편번호' name='zip' id='zip' maxlength='50'/>
					<input type="button" class='btn btn-primary col-sm-4 offset-1' value='검색' onclick='execDaumPostcode()' />
					<input type="text" class='form-control col-12' placeholder='기본주소' name='addr1' id='addr1' maxlength='50'/>
					<input type="text" class='form-control col-12' placeholder='상세주소' name='addr2' id='addr2' maxlength='50'/>
					
				</div>

				
				<div class="form-group">
					<input type="email" class='form-control' placeholder='이메일' name='email' maxlength='50'/>
				</div>
				<input type="submit" class='btn btn-primary form-control' value="회원가입" />
			</form>

		</div>
	</div>

</div>




<script>

    $("#mId").blur(function() {
        //사용자가 입력한 아이디
        var mId = $("#mId").val();
        var param = "mId=" + mId;
        if (mId.length >= 2) { 
        
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