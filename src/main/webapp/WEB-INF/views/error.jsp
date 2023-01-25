<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<html>
   <title>Registration Unsuccessful</title>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Product List</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   </head>
   <body>
      <section id="updateUser" class="banner" >
         <%@ include file="navbar.jsp" %>
         <br><br><br><br><br><br>
         <div align="center" style="margin-left: 25%;" >
            <div class="input-group mb-3">
               <h3 style="color : red;"> You don't have the access to this page, Please login with correct access </h3>
            </div>
            <br>
            <h3><a href="login" class="btn btn-dark">Log In</a></h3>
            <br>
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