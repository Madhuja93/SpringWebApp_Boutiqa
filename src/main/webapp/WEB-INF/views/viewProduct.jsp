<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
   <head>
      <link href="styles/registration.css" rel="stylesheet" type="text/css">
      <link
         rel="stylesheet"
         href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.0/css/fontawesome.min.css"
         />
      <meta name="viewport" content="width =device-width, initial-scale=1.0" />
      <link
         href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Poppins:wght@100;200;300;400&display=swap"
         rel="stylesheet"
         />
      <link
         rel="stylesheet"
         href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
         />
      <link rel="shortcut icon" href="#" />
      <script
         src="https://code.jquery.com/jquery-3.6.1.min.js"
         integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
         crossorigin="anonymous"
         ></script>
      <meta charset="ISO-8859-1">
      <title>Update Product</title>
   </head>
   <body>
      <section id="updateUser" class="banner" >
         <%@ include file="navbar.jsp" %>
         <div class="form-box" style="top:-10px">
            <form action="viewProduct" method = "POST"  id="signin" autocomplete="off" class="input-group">
               <b>Product Name </b>
               <input
                  type="text"
                  id="product-Name"
                  class="input-field"
                  placeholder="Product Name"
                  name="p_Name"
                  value="${product.p_Name}"
                  required
                  readonly
                  />
               <b>Product Price </b>
               <input
                  type="number"
                  id="product-price"
                  class="input-field"
                  placeholder="Product Price"
                  name="p_Price"
                  value="${product.p_Price}"
                  required
                  readonly
                  />
               <b>Product Detail </b>
               <input
                  id="product-detail"
                  type="text"
                  class="input-field"
                  placeholder="Product Detail"
                  name="productDetail"
                  value="${product.productDetail}"
                  required
                  readonly
                  />
               <b>Product Category </b>
               <input
                  id="product-category"
                  type="text"
                  class="input-field"
                  placeholder="Product Category"
                  name="p_Category"
                  value="${product.p_Category}"
                  required
                  readonly
                  />
               <input type="hidden"  name="productID" value="${product.productID}">
              
            </form>
         </div>
      </section>
      <!-------------------------------------------Footer------------------------------------------------>
      <section id="footer"  style="top:-110px">
         <%@ include file="footer.jsp" %>
      </section>
      <script
         src="js/script.js" ></script>
   </body>
</html>