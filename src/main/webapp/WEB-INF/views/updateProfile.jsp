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
      <title>Update Profile</title>
   </head>
   <body>
      <section id="updateUser" class="banner" >
         <%@ include file="navbar.jsp" %>
         <div class="form-box" >
            <form action="updateProfile" method = "POST"  id="signin" autocomplete="off" class="input-group" style="top:-5px" >
               <b>Customer Type </b>
               <input
                  type="text"
                  id="firstName"
                  class="input-field"
                  placeholder="First Name"
                  name="user_Type"
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
                  required
                  />
               <b>Last Name </b>
               <input
                  type="text"
                  id="lastName"
                  class="input-field"
                  placeholder="Last Name"
                  name="lastName"
                  value="${user.lastName}"
                  />
               <b>Email Address </b>
               <input
                  id="email"
                  type="email"
                  class="input-field"
                  placeholder="Email Address"
                  name="emailAddress"
                  value="${user.emailAddress}"
                  required
                  />
               <b>Password </b>
               <input
                  id="password_0"
                  type="password"
                  class="input-field"
                  placeholder="Password(Minimum 8 Characters)"
                  name="password"
                  minlength="8"
                  value="${user.password}"
                  required
                  />
               <input type="hidden"  name="User_Type" value="${user.user_Type}">
               <input type="hidden"  name="User_ID" value="${user.user_Id}">
               <button type="submit"  class="submit-btn" >
               Update Profile
               </button>
            </form>
         </div>
      </section>
      <!-------------------------------------------Footer------------------------------------------------>
      <section id="footer"   style="top:-110px">
         <%@ include file="footer.jsp" %>
      </section>
      <script
         src="js/script.js" ></script>
   </body>
</html>