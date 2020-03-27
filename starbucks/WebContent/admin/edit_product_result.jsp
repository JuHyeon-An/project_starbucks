<%@page import="bean.ProductDao"%>
<%@page import="bean.ProductVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%
String item_code = request.getParameter("item_code");
String a = (String)request.getAttribute("item_title");
ProductDao dao = new ProductDao();
// ajax에서 json타입으로 받아서.........아ㅏㅏㅏ
out.print(item_code+"/"+a);
%>