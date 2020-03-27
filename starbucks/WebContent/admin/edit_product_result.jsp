<%@page import="bean.ProductDao"%>
<%@page import="bean.ProductVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%
String item_code = request.getParameter("item_code");
ProductDao dao = new ProductDao();
// ajax에서 

int r = dao.Update(item_code);
out.print(r);
%>