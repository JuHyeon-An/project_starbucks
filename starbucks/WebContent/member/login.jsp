<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../layout/header.jsp" %>
    <!-- Breadcrumb -->
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="/starbucks/">Home</a> <span class="mx-2 mb-0">/</span> 
                    <strong class="text-black">Login</strong>
                </div>
            </div>
        </div>
    </div>
    

        <div class="container">
            <div class="row text-center">
            <div class='col-sm-4'></div>
                <div class="col-sm-4">

                    <div class="login-box well">
                        <form accept-charset="UTF-8" role="form" method="post" action="/starbucks/member/login_result.jsp">
<!--                         <form accept-charset="UTF-8" role="form" method="post" action="loginR.sm"> -->
                            <legend>로그인</legend>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" name="mId" value='' placeholder="아이디를 입력하세요" class="form-control" />
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="password" name="pwd" value='' placeholder="비밀번호를 입력하세요" class="form-control" />
                            </div>
                            <button type="submit" id="login-submit" class="btn btn-default btn-block"/>로그인</button>
                             <span class='text-center'><a href="" class="btn btn-default btn-block">비밀번호 찾기</a></span>
                              <span class='text-center'><a href="/starbucks/member/join.jsp" class="btn btn-default btn-block"> 회원가입</a></span>
<!--                               <span class='text-center'><a href="join.sm" class="btn btn-default btn-block"> 회원가입</a></span> -->
                            <div class="form-group">
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>


    
    
    
    <!-- Breadcrumb END -->
    
	<!-- Content -->    
	
	<!-- Content END-->    
    
<%@include file="../layout/footer.jsp" %>

</body>
</html>