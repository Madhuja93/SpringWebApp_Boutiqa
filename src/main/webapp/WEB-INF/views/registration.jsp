<!DOCTYPE html>
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
      <title>Register Boutiqa</title>
   </head>
   <body>
      <section id="register" class="banner">
         <%@ include file="navbar.jsp" %>
         <div class="form-box">
            <div class="button-box">
               <div id="btn"></div>
               <button type="button" class="toggle-btn" onclick="signup()">
               Buyer
               </button>
               <button type="button" class="toggle-btn" onclick="signin()">
               Seller
               </button>
            </div>
            <form action="save" method = "POST"  id="signin" autocomplete="off" class="input-group">
               <input
                  type="text"
                  id="firstName"
                  class="input-field"
                  placeholder="First Name"
                  name="firstName"
                  required
                  />
               <input
                  type="text"
                  id="lastName"
                  class="input-field"
                  placeholder="Last Name"
                  name="lastName"
                  required
                  />
               <input
                  id="email"
                  type="email"
                  class="input-field"
                  placeholder="Email Address"
                  name="emailAddress"
                  required
                  />
               <input
                  id="password_0"
                  type="password"
                  class="input-field"
                  placeholder="Password(Minimum 8 Characters)"
                  name="password"
                  minlength="8"
                  required
                  />
               <input type="hidden"  name="user_Type" value="Buyer">
               <input type="checkbox" id="termsId" class="check-box-buyer" required/><span
                  >Accept All the Terms and Conditions</span
                  >
               <button type="submit"  class="submit-btn">
               Register
               </button>
            </form>
            <form action="save" method = "POST"  id="signup" autocomplete="off" class="input-group">
               <input
                  type="text"
                  id="shopName"
                  class="input-field"
                  placeholder="Shop Name"
                  name="firstName"
                  required
                  />
               <input
                  id="email"
                  type="email"
                  class="input-field"
                  placeholder="Email Address"
                  name="emailAddress"
                  required
                  />
               <input
                  id="password_0"
                  type="password"
                  class="input-field"
                  placeholder="Password(Minimum 8 Characters)"
                  name="password"
                  minlength="8"
                  required
                  />
               <input type="hidden"  name="user_Type" value="Seller">
               <br>
               <i>What kind of Products You Sell?</i><br>
               <input type="checkbox" id="termsId" class="check-box-seller" />Electric Items
               <input type="checkbox" id="termsId" class="check-box-seller" />Clothings<br>
               <input type="checkbox" id="termsId" class="check-box-seller" />Kitchen Items
               <input type="checkbox" id="termsId" class="check-box-seller" />Home Items
               <input type="checkbox" id="termsId" class="check-box-buyer" required/><span
                  >Accept All the Terms and Conditions</span
                  >
               <button type="submit" class="submit-btn">Register
               </button>
            </form>
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