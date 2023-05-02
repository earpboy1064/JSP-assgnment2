<!--
*
*  JSP Assignment 2
*  Wyatt LeMaster
*  5/2/2023
*  JSP to display the launch page for users to start looking at the books
*  this is needed because the fetchBookServlet would not call and fill the list with books otherwise unless you
*  submitted the form
*
*
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <link href="<c:url value="sign-in.css" />" rel="stylesheet">
    <link href="<c:url value="headers.css" />" rel="stylesheet">
    <link href="<c:url value="dropdowns.css" />" rel="stylesheet">

    <link href="headers.css" rel="stylesheet">
    <link href="<c:url value="bootstrap.min.css" />" rel="stylesheet">

    <link href="<c:url value="Style.css" />" rel="stylesheet">
    <title>Sessions and Cookies</title>


</head>
<body>

 <main>

     <style>
         th, td {
             padding: 15px;
         }

         tr:nth-child(even) {
             background-color: #D6EEEE;
         }

         .dropdown:hover .dropdown-content {display: block;}
     </style>

     <%

         session.setAttribute("file", "index.jsp");

     %>


     <div class = "fixed-top">
         <div class="container">
             <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                 <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                     <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                     <span class="fs-4">Library Welcome</span>
                 </a>

             </header>
         </div>
     </div>
 </main>

 <div class="px-4 pt-5 my-5 text-center border-bottom justify-content-center  flex-fill">
     <h1 class="display-4 fw-bold text-body-emphasis"></h1>
     <div class="col-lg-6 mx-auto">
         <p class="h3 mb-3 fw-normal">Welcome to the library Website!</p>
         <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">


         <form action="/FetchBookServlet" method="post" onsubmit="return validate()">
         <h1 class="h3 mb-3 fw-normal">Browse our collection</h1>

           <div style = "padding: 5px";> </div>

              <a href="FetchBookServlet" action="FetchBookServlet" method="post" onclick="return validate()" aria-current="page">
             <input class="w-100 btn btn-lg btn-primary"  type="button" name="Browse" value="Browse" >  </input></a>

     </form>
         </div>
     </div>
 </div>





</body>

</html>

<!-- Sources:
https://mkyong.com/spring-mvc/spring-mvc-how-to-include-js-or-css-files-in-a-jsp-page/
https://www.w3schools.com/howto/howto_css_dropdown.asp
-->