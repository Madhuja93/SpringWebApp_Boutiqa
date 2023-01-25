<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Boutiqa</title>
      <script src="js\script.js"></script>
   </head>
   <body onload="slider();">
      <section id="banner" class="banner banner-img" style="margin-top: 100px;">
         <%@ include file="navbar.jsp" %>
         <div class="banner-text">
            <h1>BOUTIQA</h1>
            <p>Simply Better Shopping</p>
            <div class="banner-btn">
               <a href="products"
                  ><span></span>Search Products Here</a
                  >
            </div>
         </div>
      </section>
      <!-------------------------------------------Footer------------------------------------------------>
      <section id="footer">
         <%@ include file="footer.jsp" %>
      </section>
   </body>
</html>