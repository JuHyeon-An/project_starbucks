<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import='bean.Shopping_MemberDao' %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id='vo' class='bean.Shopping_MemberVo' scope='page'/>
<jsp:setProperty name='vo' property="mId"/>
<jsp:setProperty name='vo' property="mName"/>
<jsp:setProperty name='vo' property="pwd"/>
<jsp:setProperty name='vo' property="phone"/>
<jsp:setProperty name='vo' property="email"/>
<jsp:setProperty name='vo' property="zip"/>
<jsp:setProperty name='vo' property="addr1"/>
<jsp:setProperty name='vo' property="addr2"/>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
Shopping_MemberDao dao = new Shopping_MemberDao();
String msg = dao.insert(vo);

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
<div class="container center-block">
<h3><%=msg %></h3>

<a class='btn btn-primary' href='/starbucks/' >홈</a>
</div>


    
<%@include file="../layout/footer.jsp" %>

</body>
</html>