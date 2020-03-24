<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%

request.setCharacterEncoding("utf-8");

  
  String cont = "dashboard.jsp";
  if(request.getParameter("cont")!=null){
	  cont = request.getParameter("cont");
  }
  
%>
<%@include file="../layout/header_admin.jsp" %>
	
	<div id='main_content'>
		<jsp:include page="<%=cont %>"/>
	</div>
<%@include file="../layout/footer_admin.jsp" %>
	
	<script> 

let path='';
let cont='';
let inc='';

function goUrl(path, cont){
	localStorage.setItem("path", path);
	let url = "index.jsp?cont="+path+cont;
	location.href = url;
}

function goSub(cont){
	path=localStorage.getItem('path');
	inc=localStorage.getItem('inc');
	let url = "index.jsp?inc="+path+inc+'&cont='+path+cont;
	location.href = url;
}

function goSubmit(frm, cont){
	path = localStorage.getItem('path');
	inc = localStorage.getItem('inc');
	let url = 'index.jsp?inc='+path+inc+'&cont='+path+cont;
	frm.action = url;
	// get 타입으로도 넘기고
	frm.submit();
	// post 타입으로도 넘김
	
	
	
}

btnFunc();
</script>
	