<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%   request.setCharacterEncoding("UTF-8");  %>
	<!-- left side menu -->
	<%@include file="./left.jsp" %>
                    
	<div class="col-md-9 order-2">
	    <div class="row mb-3">
	        <div class="col-md-12">
	            <h2 class="h3 mb-3 text-black">회원정보 수정</h2>
	        </div>
	    </div>
	    <form class="row" method="post" name="userInfoFrm" id="userInfoFrm">
	    	<input type="hidden" name="mId2" id="mId2" value="${mId }" />
	        <div class="col-12">
	            <h2 class="h5 mb-3 text-black">기본 정보</h2>
	        </div>
	        <div class="col-md-6 mb-5 mb-md-0">
	        	<div class="form-group row">
	                <div class="col-md-12">
	                    <label for="userId" class="text-black">아이디 <span class="text-danger">*</span></label>
	                    <input type="text" class="form-control" value="${vo.mId }" id="userId" name="userId" readonly="readonly">
	                </div>
	            </div>
	            <div class="form-group row">
	                <div class="col-md-12">
	                    <label for="userNm" class="text-black">이름 <span class="text-danger">*</span></label>
	                    <input type="text" class="form-control" value="${vo.mName }" required="required" id="userNm" name="userNm">
	                </div>
	            </div>
	            <div class="form-group row">
	                <div class="col-md-12">
	                    <label for="userPwd" class="text-black">비밀번호 <span class="text-danger">*</span></label>
	                    <input type="password" class="form-control" value="${vo.pwd }" required="required" id="userPwd" name="userPwd">
	                </div>
	            </div>
	            <div class="form-group row">
	                <div class="col-md-12">
	                    <label for="userPhone" class="text-black">연락처 <span class="text-danger">*</span></label>
	                    <input type="tel" class="form-control" value="${vo.phone }" required="required" id="userPhone" name="userPhone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{3}">
	                </div>
	            </div>
	        </div>
	
	        <div class="col-md-6 mb-5 mb-md-0">
	        	<div class="form-group row">
	                <div class="col-md-12">
	                    <label for="memberEmail" class="text-black">이메일 <span class="text-danger">*</span></label>
	                    <input type="text" class="form-control" value="${vo.email }" required="required" id="memberEmail" name="memberEmail">
	                </div>
	
	            </div>
	            <div class="form-group row">
	                <div class="col-md-12">
	                    <label for="zonecode" class="text-black">우편번호 <span class="text-danger">*</span></label>
	                    <div class="input-group">
	                        <input type="text" class="form-control" value="${vo.zip }" required="required" id="zonecode" name="zonecode" readonly>
	                        <div class="input-group-append">
	                            <button class="btn btn-primary btn-sm" type="button" onclick="openDaumZipAddress();">우편번호 찾기</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <div class="col-md-12">
	                    <label for="address" class="text-black">주소 <span class="text-danger">*</span></label>
	                    <input type="text" class="form-control" value="${vo.addr1 }" required="required" id="address" name="address" readonly>
	                </div>
	            </div>
	            <div class="form-group row mb-5">
	                <div class="col-md-12">
	                    <label for="address_etc" class="text-black">상세주소 <span class="text-danger">*</span></label>
	                    <input type="text" class="form-control" value="${vo.addr2 }" required="required" id="address2" name="address2">
	                </div>
	            </div>
	
	
	
	        </div>
	        <div class="col-12 text-right">
	            <button type="button" class="btn btn-primary min-width-125" id="btnSave">
	                저장
	            </button>
	        </div>
	    </form>
	</div>

    
    