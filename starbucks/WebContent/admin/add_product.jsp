<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <body>
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-10 col-lg-11 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Add Product</h2>
              </div>
            </div>
                <form id="frm" name="frm" method="post" action="add_productR.stb" class="tm-edit-product-row">
              <div class="col-xl-12 col-lg-12 col-md-12">
                  <div class="form-group mb-3">
                    <label
                      for="item_title"
                      >상품명
                    </label>
                    <input
                      id="item_title"
                      name="item_title"
                      type="text"
                      class="form-control validate"
                      required
                    />
                  </div>
                                    <div class="row">
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="item_price"
                            >판매가
                          </label>
                          <input
                            id="item_price"
                            name="item_price"
                            type="text"
                            class="form-control validate"
                            data-large-mode="true"
                          />
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="item_num"
                            >재고
                          </label>
                          <input
                            id="item_num"
                            name="item_num"
                            type="text"
                            class="form-control validate"
                            required
                          />
                        </div>
                  </div>
                  <div class="row">
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="item_size"
                            >사이즈/크기
                          </label>
                          <input
                            id="item_size"
                            name="item_size"
                            type="text"
                            class="form-control validate"
                            required
                          />
                        </div>
                        </div>
                  <div class="form-group mb-3">
                    <label
                      for="item_content"
                      >상품설명</label
                    >
                    <textarea
                      id = "item_content"
                      name = "item_content"
                      class="form-control validate"
                      rows="3"
                      required
                    ></textarea>
                  </div>
                  
                  <hr/>
                  <div class="row">
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label
                      for="item_group"
                      >분류</label
                    >
                    <select
                      class="custom-select tm-select-accounts"
                      id="item_group"
                      name="item_group"
                    >
                      <option selected>분류선택</option>
                      <option value="1">머그</option>
                      <option value="2">글라스</option>
                      <option value="3">텀블러</option>
                      <option value="4">보온병</option>
                      <option value="5">액세서리</option>
                      <option value="6">커피용품/원두</option>
                    </select>
                  </div>
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label
                      for="item_theme"
                      >테마</label
                    >
                    <select
                      class="custom-select tm-select-accounts"
                      id="item_theme"
                      name="item_theme"
                    >
                      <option selected>테마선택</option>
                      <option value="1">20 체리블라썸</option>
                      <option value="2">베라왕 X 스타벅스</option>
                      <option value="3">시티투어 콜렉션</option>
                      <option value="4">스프링 콜렉션</option>
                    </select>
                  </div>
                  </div>
                  
                  <div class="row">
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="item_regdate"
                            >등록일자
                          </label>
                          <input
                            id="item_regdate"
                            name="item_regdate"
                            type="text"
                            class="form-control validate"
                            data-large-mode="true"
                          />
                        </div>
                        
                  </div>
              
              <div class="row">
               <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="item_regdate"
                            >파일업로드
                          </label>
                         <div class="tm-product-img-dummy mx-auto">
                  <i
                    class="fas fa-cloud-upload-alt tm-upload-icon"
                    onclick="document.getElementById('fileInput').click();"
                  ></i>
                </div>
                
                
                
                
                        </div>
                   <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="item_regdate"
                            >파일업로드
                          </label>
                         <div class="tm-product-img-dummy mx-auto" onclick="document.getElementById('fileInput').click();">
                  <img
                  	id="photo"
                  />
                </div>
                
                
                
                
                        </div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4 mt-5">
                <div class="tm-product-img-dummy mx-auto">
                  <i
                    class="fas fa-cloud-upload-alt tm-upload-icon"
                    onclick="document.getElementById('fileInput').click();"
                  ></i>
                </div>
                
              </div>
              </div>
                              <div class="custom-file mt-3 mb-3">
                  <input id="fileInput" type="file" style="display:none;" />
                  <button
                    class="btn btn-primary btn-block mx-auto"
                    onclick="document.getElementById('fileInput').click();"
                    style="display:none;"
                  >UPLOAD PRODUCT IMAGE</button>
                </div>
               
               </div>
              <div class="col-12">
                <button type="submit" id="btnInsert" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
              </div>
                </form>
            </div>
          </div>
      </div> <!-- row -->
    </div> <!-- container -->

    <script>
      $(function() {
        $("#item_regdate").datepicker();
      });
      
    </script>
  </body>
</html>