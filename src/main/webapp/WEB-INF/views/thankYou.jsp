<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
   <head>
      <link href="styles/thankYou.css" rel="stylesheet" type="text/css">
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
      <title>Registration Completed</title>
   </head>
   <body>
      <h1>
         <center>Registration Successful!</center>
      </h1>
      <section id="thankyou">
         <div class="form-box2">
            <h3><i> Hi ${createdUser.user_Type} ${createdUser.firstName} </i></h3>
            <br>
            <div class="title-text">
               <h4>
                  <center>Thank you for Registering with Boutiqa under <br> ${createdUser.emailAddress} <br>
                     You now have access to the personalized view of our Web site.
                  </center>
               </h4>
            </div>
            <br>
            <form method="GET" action="login">  
               <button type="submit" class="submit-btn">
               Log In Now
               </button>
            </form>
         </div>
      </section>
   </body>
</html>