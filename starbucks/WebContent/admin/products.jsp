<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Product Page - Admin HTML Template</title>
   
  </head>

 <div class="container mt-5">
      <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-products">
            <div class="tm-product-table-container">
              <table class="table table-hover tm-table-small tm-product-table">
                <thead>
                  <tr>
                    <th scope="col">&nbsp;</th>
                    <th scope="col">PRODUCT NAME</th>
                    <th scope="col">UNIT SOLD</th>
                    <th scope="col">IN STOCK</th>
                    <th scope="col">EXPIRE DATE</th>
                    <th scope="col">&nbsp;</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td scope="row">
								<img
									data-original="//starbucks.seoulsistas.net/img/cdn/[9300000002189]_20200219103350388.jpg"
									width="50px" class="round z-index-top lazy" id="img14367"
									alt="Starbucks Starbucks Korea 2020 Spring "
									onclick="image_viewer('img14367')"
									src="//starbucks.seoulsistas.net/img/cdn/[9300000002189]_20200219103350388.jpg"
									style="display: block;"></td>
								<td class="tm-product-name">Lorem Ipsum Product 1</td>
                    <td>1,450</td>
                    <td>550</td>
                    <td>28 March 2019</td>
                    <td>
                      <a href="#" class="tm-product-delete-link">
                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                      </a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- table container -->
            <a
              href="#"
              onclick='goUrl("/admin", "/add_product.jsp")'
              class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
            <button class="btn btn-primary btn-block text-uppercase">
              Delete selected products
            </button>
          </div>
        </div>
        
      </div>
    </div>

    <script>
      $(function() {
        $(".tm-product-name").on("click", function() {
          goUrl("/admin", "/edit-product.jsp");
        });
      });
    </script>
  </body>
</html>