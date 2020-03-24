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

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
 String address = request.getParameter("zip") +" " + request.getParameter("addr1") +" "+ request.getParameter("addr2");
Shopping_MemberDao dao = new Shopping_MemberDao();
vo.setAddress(address);
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

<h3><%=msg %></h3>


    
<%@include file="../layout/footer.jsp" %>

</body>
</html>