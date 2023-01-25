<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Product List</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   </head>
   <body>
      <!-- Header -->
      <%@ include file="navbar2.jsp" %>
      <section id="banner" class="banner">
         <br><br><br><br><br><br>
         <div align="center" >
            <form method="get" action="search" style="margin : 40px;">
               <div class="input-group mb-3">
                  <input type="text" name="keyword" class="form-control" placeholder="Search Products"/>
                  <br><br>
                  <div class="input-group-append">
                     <input type="submit" value="Search" class="btn btn-dark" style="height: 100%; width: 200px"/>
                  </div>
               </div>
            </form>
            <br>
            <c:choose>
               <c:when test="${loggedUser.user_Type != 'Buyer'}">
                  <h3 th:unless="true"><a href="createProduct" class="btn btn-dark">Add New Product</a></h3>
                  <br>
               </c:when>
            </c:choose>
            <table class="table table-striped"  style="margin : 20px;">
               <tr>
                  <th>Product ID</th>
                  <th>Product Name</th>
                  <th>Product Price</th>
                  <th>Product Detail</th>
                  <th>Product Category</th>
                  <th>User ID</th>
                  <c:choose>
                     <c:when test="${loggedUser.user_Type == 'Seller' }">
                        <th th:unless="true">Action</th>
                     </c:when>
                  </c:choose>
               </tr>
               
               
               <c:forEach items="${allProducts}" var="product">
                  <tr>
                     <td>${product.productID}</td>
                     <td>${product.p_Name}</td>
                     <td>${product.p_Price}</td>
                     <td>${product.productDetail}</td>
                     <td>${product.p_Category}</td>
                     <td>${product.user.user_Id} </td>
                     <c:choose>
                        <c:when test="${loggedUser.user_Type == null || loggedUser.user_Type == 'Seller' || loggedUser.user_Type == 'Buyer' || loggedUser.user_Type == 'Admin'}">
                           <td th:unless="true">
                           
                     		 <a class="btn btn-info" href="viewProduct?id=${product.productID}">View Product</a>
                             
                        </c:when>
                     </c:choose>
                     <c:choose>
                        <c:when test="${(loggedUser.user_Type == 'Seller' && loggedUser.user_Id == product.user.user_Id) || loggedUser.user_Type == 'Admin'}">
                           <td th:unless="true">
                           
                              <a class="btn btn-secondary" href="editProduct?id=${product.productID}">Edit</a>
                              &nbsp;&nbsp;&nbsp;
                              <a class="btn btn-secondary" href="deleteProduct?id=${product.productID}">Delete</a>
                           </td>
                        </c:when>
                        <c:otherwise>
                           <td th:if="true" >
                              <c:choose>
                                 <c:when test="${loggedUser.user_Type == 'Seller'}">
                                 
                                    Cannot Edit or Delete
                                    
                                 </c:when>
                              </c:choose>
                           </td>
                        </c:otherwise>
                     </c:choose>
                     <c:choose>
                        <c:when test="${loggedUser.user_Type == 'Buyer'}">
                           <td th:unless="true">
                              <a class="btn btn-secondary" href="addToShoppingCart?id=${product.productID}" ><i class="fa fa-shopping-cart"></i> Add To Cart</i></a>
                           </td>
                        </c:when>
                     </c:choose>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </section>
   </body>
</html>