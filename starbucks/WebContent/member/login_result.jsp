<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import='bean.Shopping_MemberDao' %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id='vo' class='bean.Shopping_MemberVo' scope='page'/>
<jsp:setProperty name='vo' property="mId"/>
<jsp:setProperty name='vo' property="pwd"/>

<html>
<head>
<meta charset="UTF-8">
<title>login_result</title>
<%

	String mId = null;
	if(session.getAttribute("mId") != null){
		mId = (String) session.getAttribute("mId");
	}
	if(mId != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다..')");
		script.println("location.href = '/starbucks/index.jsp'");
		script.println("</script>");
	}
	
	
	
	
	Shopping_MemberDao dao = new Shopping_MemberDao();
	int result = dao.login(vo.getmId(), vo.getPwd());
	out.print(result);
	if (result == 1) {
		session.setAttribute("mId", vo.getmId()); // 로그인에 성공하면 해당아이디에 세션을 부여해준다.
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '/starbucks/index.jsp'");
		script.println("</script>");
	}
	
	else if(result == 2){
		session.setAttribute("mId", vo.getmId()); // 로그인에 성공하면 해당아이디에 세션을 부여해준다.
		session.setAttribute("admin", 1);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '/starbucks/index.jsp'");
		script.println("</script>");
	}
	
	else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
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

<h3>로그인 되었습니다.</h3>


    
<%@include file="../layout/footer.jsp" %>

</body>
</html>