<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.UserModel" %>
<%@ page import="models.MusicModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<!--
Remaining Work to do:
create register page for new user.
modify login page so it checks against user data in database.
create a view reserved book page.
1. -->
<head>
    <link href="<c:url value="sign-in.css" />" rel="stylesheet">
    <link href="<c:url value="headers.css" />" rel="stylesheet">
    <link href="<c:url value="dropdowns.css" />" rel="stylesheet">

    <link href="headers.css" rel="stylesheet">
    <link href="<c:url value="bootstrap.min.css" />" rel="stylesheet">

    <link href="<c:url value="Style.css" />" rel="stylesheet">
    <title>Sessions and Cookies</title>

    <p>${login}</p>
</head>
<body>
 <main>


     <div class = "fixed-top">
         <div class="container">
             <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                 <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                     <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                     <span class="fs-4">Library Login</span>
                 </a>

                 <ul class="nav nav-pills">
                     <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li>
                     <li class="nav-item"><a href="register.jsp" class="nav-link" aria-current="page">register</a></li>
                     <li class="nav-item"><a href="Login.jsp" class="nav-link" aria-current="page">Login</a></li>
                 </ul>
             </header>
         </div>
     </div>
 </main>
<style>

    .dropdown:hover .dropdown-content {display: block;}
</style>




     <!--<div class = "container-fluid"> -->
         <div class = "d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom flex-fill">
             <div class = "d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">


     <div class="dropdown">
<button> drop </button>
         <div class = "dropdown-content">
     <div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
         <ul class="dropdown-menu d-block position-static mx-0 shadow w-220px" data-bs-theme="light">
             <li>
                 <a class="dropdown-item d-flex gap-2 align-items-center" href="#">
                     <svg class="bi" width="16" height="16"><use xlink:href="#files"/></svg>
                     Documents
                 </a>
             </li>
             <li>
                 <a class="dropdown-item d-flex gap-2 align-items-center" href="#">
                     <svg class="bi" width="16" height="16"><use xlink:href="#image-fill"/></svg>
                     Photos
                 </a>
             </li>
             <li>
                 <a class="dropdown-item d-flex gap-2 align-items-center" href="#">
                     <svg class="bi" width="16" height="16"><use xlink:href="#film"/></svg>
                     Movies
                 </a>
             </li>
             <li>
                 <a class="dropdown-item d-flex gap-2 align-items-center" href="#">
                     <svg class="bi" width="16" height="16"><use xlink:href="#music-note-beamed"/></svg>
                     Music
                 </a>
             </li>
             <li>
                 <a class="dropdown-item d-flex gap-2 align-items-center" href="#">
                     <svg class="bi" width="16" height="16"><use xlink:href="#joystick"/></svg>
                     Games
                 </a>
             </li>
             <li><hr class="dropdown-divider"></li>
             <li>
                 <a class="dropdown-item dropdown-item-danger d-flex gap-2 align-items-center" href="#">
                     <svg class="bi" width="16" height="16"><use xlink:href="#trash"/></svg>
                     Trash
                 </a>
             </li>
         </ul>
     </div>
         </div>
     </div>




         <form action="FetchBookServlet" method="post" onsubmit="return validate()">
             <h1 class="h3 mb-3 fw-normal">Register</h1>

             <div class="form-floating">
                 topic_id: <input id="topic_id" name="topic_id" type="text" /> <br/>
             </div>

             <input type="submit" value="submit" />


         </form>

             </div>
             <div class = "flex-"></div>
             <div class = "d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">

             <c:forEach var="each_book" items="${list_of_books}">
                 <ul>
                     <li>${each_book.getBook_name() } <a href="reserve.jsp">reserve</a></li>
                 </ul>
             </c:forEach>
             </div>
             </div>
         </div>
<!--
     <form action="FetchBookServlet" method = "post" onsubmit="return validate()">
    Filter Books:
    <select name="book">
        <option value="999">All</option>
    topic_id: <input id="topic_id" name="topic_id" type="text" /> <br/>


    <div class="dropdown">
        <button class="dropbtn">Dropdown</button>

        <div class="dropdown-content">
            <input type="submit" name="1" value="1" />
            <input type="submit" name="2" value="2" />
            <input type="submit" name="3" value="3" />
        </div>
    </div>
-->


    <!-- </select>-->




 <!--<input type="text" id="book" name="book" placeholder = "Search books..">-->

<p>${error}</p>

</body>
<!--
<script>
    function validate() {
        var email = document.getElementById("email").value
        var password = document.getElementById("password").value
        const re_email = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(email === "") {
            document.getElementById("error_msg").innerHTML = "Please enter email."
            result = false;
        } else if(password === "") {
            document.getElementById("error_msg").innerHTML = "Please enter password."
            result = false
        } else {
            result = re_email.test(email)
            document.getElementById("error_msg").innerHTML = "Email is not valid."
        }
        return result
    }
</script>
-->
</html>

<!-- Sources:
https://mkyong.com/spring-mvc/spring-mvc-how-to-include-js-or-css-files-in-a-jsp-page/
https://www.w3schools.com/howto/howto_css_dropdown.asp
-->