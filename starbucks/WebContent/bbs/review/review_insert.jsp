<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <script src="/starbucks/lib/jquery-3.4.1.js"></script>
    <script src="/starbucks/js/uk2.js"></script> 


<form action="#" id='review' name='review' method="post" enctype="multipart/form-data">
  <div class="p-3 p-lg-5 border">
    <div class="form-group row">
      <div class="col-md-6">
        <label for="c_fname" class="text-black">상품명 </label>
        <input type="text" class="form-control" id="c_fname" name="c_fname">
      </div>
      <div class="col-md-6">
        <label for="c_lname" class="text-black">별점 <span class="text-danger">*</span></label>
        <input type="text" class="form-control" id="c_lname" name="c_lname">
      </div>
    </div>
    <div class="form-group row">
      <div class="col-md-12">
        <label for="review_title" class="text-black">제목 <span class="text-danger">*</span></label>
        <input type="text" class="form-control" id="review_title" name="review_title" placeholder="">
      </div>
    </div>
    <div class="form-group row">
      <div class="col-md-12">
        <label for="review_content" class="text-black">본문 내용<span class="text-danger">*</span> </label>
        <textarea name="review_content" id="review_content" cols="30" rows="7" class="form-control"></textarea>
      </div>
    </div>

    <div class="form-group row">
      <div class="col-md-12">
        <label for="c_message" class="text-black">사진 업로드 </label>
        <div class="border p-3 " id='att_file' ></div>
      </div>
    </div>
    <div class="form-group row">
      <div class="col-lg-12">
        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Send Message">
      </div>
    </div>
  </div>
</form>


<script>
let main=document.getElementById('att_file');
makeDiv(main);
</script>
