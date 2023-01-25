<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
   <head>
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
      <link href="styles/style.css" rel="stylesheet" type="text/css">
      <script
         src="https://code.jquery.com/jquery-3.6.1.min.js"
         integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
         crossorigin="anonymous"
         ></script>
   </head>
   <nav>
      <a href="home"> <img src="images\logo.PNG" class="logo" /></a>
      <div class="nav-links" id="navLinks">
         <i class="fa fa-times" onclick="hideMenu()"></i>
         <ul>
            <li class="links">
               <a id="viewProfile" href="${loggedUserId}" > <b>${loggedUserText} </b> </a>
            </li>
            <li class="links">
               <a id="bannderId" href="home">HOME</a>
            </li>
            <li class="links">
               <a id="aboutId" href="products">PRODUCTS</a>
            </li>
            <li  class="links">
               <a id="standardsId" href="register">REGISTER</a>
            </li>
            <c:choose>
               <c:when test="${loggedUserText != 'Hi Guest User'}">
                  <li th:unless="true" class="links">
                     <a id="aboutId" href="logout">LOGOUT</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li th:if="true" class="links">
                     <a id="exploreId" href="login">LOGIN</a>
                  </li>
               </c:otherwise>
            </c:choose>
           
           
            
            <c:choose>
               <c:when test="${loggedUser == null}">
                  <li th:unless="true" >
                  </li>
               </c:when>
               <c:otherwise>
                  <li th:if="true" class="links">
                   <c:choose>
               <c:when test="${loggedUser.user_Type == 'Buyer'}">
                  <li th:unless="true">
                  
                      <c:choose>
               <c:when test="${cartCount == 0}">
              
                  
                       <a th:unless="true" href="shoppingCart">
	<img style="height: 38px;width: 50px; margin-right: 12px;" src="images/cartEmpty.png" alt="${cartCount}"/> <button type="button" class="btn btn-danger">${cartCount}</button> 
</a>
                  
               </c:when>
               <c:otherwise>
                  <li th:if="true" >
                  
                       
                       <a th:unless="true" href="shoppingCart">
	<img style="height: 38px;width: 50px; margin-right: 12px;" src="images/cartFull.png" alt="${cartCount} "/><button type="button" class="btn btn-danger">${cartCount}</button>  
	
	<span style="margin: 20px;"><button type="button" class="btn btn-warning">${cartSum}</button>
	
            	   </span>
</a>

                  </li>
               
               </c:otherwise>
            </c:choose>
                  
             
                		      
                	</li>
               </c:when>
            </c:choose>
            
                  </li>
               </c:otherwise>
            </c:choose>
          
         </ul>
      </div>
   </nav>      
            
</html>