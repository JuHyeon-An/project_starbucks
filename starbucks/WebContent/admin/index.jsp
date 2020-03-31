<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String cont = "dashboard.jsp";
	if (request.getParameter("cont") != null) {
		cont = request.getParameter("cont");
	}
%>
<%@include file="../layout/header_admin.jsp"%>

<div id='main_content'>
	<jsp:include page="<%=cont%>" />
</div>
<%@include file="../layout/footer_admin.jsp"%>

<script>
	btnFunc();

</script>
