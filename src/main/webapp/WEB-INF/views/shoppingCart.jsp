<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Registered Users</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   </head>
   <body>
      <!-- Header -->
      <%@ include file="navbar2.jsp" %>
      <section id="banner" class="banner">
         <br><br><br><br><br><br>
         <div align="center">
           <!--  <form method="get" action="searchUser" style="margin :40px;">
               <div class="input-group mb-3"  >
                  <input type="text" name="keyword" class="form-control" placeholder="Search Products"/>
                  <br>
                  <div class="input-group-append">
                     <input type="submit" value="Search" class="btn btn-dark" style="height: 100%; width: 200px"/>
                  </div>
               </div>
            <form method="get" action="search" style="margin : 40px;">
            </form>  -->
            
             <c:choose>
               <c:when test="${shoppingCartStatus == 'Draft'}">
                  
            <h2 th:unless="true" >Your Cart is in ${shoppingCartStatus} status<br>Please Click Checkout to Complete the Transaction </h2>
         
               </c:when>
                <c:otherwise>
                  <div th:if="true" >
                  
            <h2 th:unless="true" >Your Cart is in ${shoppingCartStatus} status<br>Your Order will Deliver to your Doorstep soon..! </h2>
               </c:otherwise>
            </c:choose>
            
            
            <br>
            <table class="table table-striped">
               <tr>
                  <th>Product ID</th>
                  <th>Product Name</th>
                  <th>Product Description</th>
                   <th>Product Price</th>
                  <th>Quantity</th>
                 
                  <th>List Price</th>
                  <th>Remove Item</th>
               </tr>
               <c:forEach items="${allUsers1}" var="cartItem">
                  <tr>
                     <td>${cartItem.product.productID}</td>
                     <td>${cartItem.product.p_Name}</td>
                      <td>${cartItem.product.productDetail}</td>
                      <td>${cartItem.product.p_Price}</td>
                     <td>
                     <a class="btn btn-primary" href="descreaseQunatity?id=${cartItem.productShoppingCart_ID}">-</a>
                       ${cartItem.quantity}
                            <a class="btn btn-success" href="increateQunatity?id=${cartItem.productShoppingCart_ID}">+</a> 
                   
                      
                     </td>
                     
                     <td>${cartItem.itemTotalPrice}</td>
                     <td>
                     <a class="btn btn-danger" href="deleteCartItem?id=${cartItem.productShoppingCart_ID}">Delete</a>
                   
                      
                     </td>
                  </tr>
               </c:forEach>
            </table>
            <div>Total Price : ${totalPrice}</div>
            <br><br>
            <div>
            
             <c:choose>
               <c:when test="${shoppingCartStatus == 'Draft'}">
                  
            	<a th:unless="true" class="btn btn-primary" href="checkout?id=${shoppingVartId}">Checkout</a>
               </c:when>
                <c:otherwise>
                  <div th:if="true" >
                  <h3> You have Successfully Completed the Transaction.. <br>Thank You for Shopping with Us..! </h3>
                     <a th:unless="true" class="btn btn-info" href="products">Shop More</a>
                  </div>
               </c:otherwise>
            </c:choose>
            
                   
            </div>
            
         </div>
      </section>
   </body>
</html>