<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.input-group {
    margin-top: 1em;
    margin-bottom: 1em;
}



.login-box {
    line-height: 2.3em;
    font-size: 1em;
    color: #aaa;
    margin-top: 1em;
    margin-bottom: 1em
    padding-top: 0.5em;
    padding-bottom: 0.5em;
}

</style>
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

	<div class="offset-lg-4 col-lg-4 ">
		<div class="jumbotron center-block" >
			<form action="" method='post'>
				<h3 style='text-align:center;'> 회원가입화면</h3>
				<div class="form-group">
					<input type="text" class='form-control' placeholder='아이디' name='userID' maxlength='20'/>
				</div>
				<div class="form-group">
					<input type="password" class='form-control' placeholder='비밀번호' name='userPassword' maxlength='20'/>
				</div>
				<div class="form-group">
					<input type="text" class='form-control' placeholder='이름' name='userName' maxlength='20'/>
				</div>
				<div class="form-group" style='text-align:center;'>
					<div class='btn-group' data-toggle='buttons'>
					<label class='btn btn-primary active'>
						<input type="radio" name="userGender" autocomplete="off" value="남자" checked />남자
					</label>
					<label class='btn btn-primary'>
						<input type="radio" name="userGender" autocomplete="off" value="여자" />여자
					</label>
					</div>
				</div>
				<div class="form-group">
					<input type="text" class='form-control' placeholder='전화번호' name='userPhone' maxlength='20'/>
				</div>
				<div class="form-group">
					<input type="text" class='form-control' placeholder='주소' name='userAddress' maxlength='50'/>
				</div>

				
				<div class="form-group">
					<input type="email" class='form-control' placeholder='이메일' name='userEmail' maxlength='50'/>
				</div>
				<input type="submit" class='btn btn-primary form-control' value="회원가입" />
			</form>
		</div>
	</div>

</div>

<script></script>


    
    
<%@include file="../layout/footer.jsp" %>

</body>
</html>