<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
   <head>
      <link href="styles/login.css" rel="stylesheet" type="text/css">
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
      <title>Reset Password </title>
   </head>
   <body>
      <section id="login" class="banner" >
         <%@ include file="navbar.jsp" %>
         <div class="form-box">
            <h3>
               <center>Forgot Password
            </h3>
            </center>
            <form action="forgetPassword" method = "POST"  id="signin" autocomplete="off" class="input-group">
               <input
                  id="email"
                  type="email"
                  class="input-field"
                  placeholder="Email Address"
                  name="emailAddress"
                  required
                  /><br><br>
               <button type="submit"  class="submit-btn">
               Reset Password
               </button><br>
               <div> No account yet? <a href ="register">Register</a></div>
            </form>
            <div style="text-align: center;">
               <span class="span2">${successMessage}</span>
            </div>
            <div style="text-align: center;">
               <span class="span1">${errorMessage} </span>
            </div>
         </div>
      </section>
      <!-------------------------------------------Footer------------------------------------------------>
      <section id="footer"  style="top:700px">
         <%@ include file="footer.jsp" %>
      </section>
      <script
         src="js/script.js" ></script>
   </body>
</html>