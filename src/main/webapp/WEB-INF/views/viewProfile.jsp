<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
   <head>
      <link href="styles/viewProfile.css" rel="stylesheet" type="text/css">
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
      <link href="styles/login.css" rel="stylesheet" type="text/css">
      <script
         src="https://code.jquery.com/jquery-3.6.1.min.js"
         integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
         crossorigin="anonymous"
         ></script>
      <meta charset="ISO-8859-1">
      <title>Boutiqa Profile</title>
   </head>
   <body>
      <br>
      <section id="viewUser" class="banner" >
         <%@ include file="navbar.jsp" %>
         <div class="form-box">
            <b>Customer Type </b>
            <input
               type="text"
               id="firstName"
               class="input-field"
               placeholder="First Name"
               name="firstName"
               value="${user.user_Type}"
               readonly
               />
            <b>First Name </b>
            <input
               type="text"
               id="firstName"
               class="input-field"
               placeholder="First Name"
               name="firstName"
               value="${user.firstName}"
               readonly
               />
            <b>Last Name </b>
            <input
               type="text"
               id="lastName"
               class="input-field"
               placeholder="Last Name"
               name="lastName"
               value="${user.lastName}"
               readonly
               />
            <b>Email Address </b>
            <input
               id="email"
               type="email"
               class="input-field"
               placeholder="Email Address"
               name="email"
               value="${user.emailAddress}"
               readonly
               />
            <form action="updateProfile" method = "GET"  autocomplete="off" style="top:-5px">
               <input type="hidden" name="id" value="${user.user_Id}" />
               <button type="submit"  class="submit-btn">
               Update Profile
               </button>
            </form>
            <br>
            <form action="deleteProfile" method = "GET"  autocomplete="off" >
               <input type="hidden" name="id" value="${user.user_Id}" />
               <button type="submit"  class="submit-btn">
               Delete Profile
               </button>
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