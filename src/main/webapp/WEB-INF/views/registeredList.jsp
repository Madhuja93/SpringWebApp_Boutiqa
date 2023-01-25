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
            <form method="get" action="searchUser" style="margin :40px;">
               <div class="input-group mb-3"  >
                  <input type="text" name="keyword" class="form-control" placeholder="Search Users"/>
                  <br>
                  <div class="input-group-append">
                     <input type="submit" value="Search" class="btn btn-dark" style="height: 100%; width: 200px"/>
                  </div>
               </div>
            <form method="get" action="search" style="margin : 40px;">
            </form>
    
            <table class="table table-striped">
               <tr>
                  <th>User ID</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>E-mail</th>
                  <th>User Type</th>
                  <th>Password</th>
                  <th>Action</th>
               </tr>
               <c:forEach items="${allUsers}" var="user">
                  <tr>
                     <td>${user.user_Id}</td>
                     <td>${user.firstName}</td>
                     <td>${user.lastName}</td>
                     <td>${user.emailAddress}</td>
                     <td>${user.user_Type}</td>
                     <td>${user.password}</td>
                     <td>
                        <a class="btn btn-success" href="updateProfile?id=${user.user_Id}">Edit</a>
                        <a class="btn btn-primary" href="viewProfile?id=${user.user_Id}">View</a>
                        <a class="btn btn-danger" href="deleteProfile?id=${user.user_Id}">Delete</a>
                     </td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </section>
   </body>
</html>