<!--
*
*  JSP Assignment 2
*  Wyatt LeMaster
*  5/2/2023
*  JSP to display Login page.
*
*
-->

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value="sign-in.css" />" rel="stylesheet">
    <link href="<c:url value="headers.css" />" rel="stylesheet">

    <link href="headers.css" rel="stylesheet">
    <link href="<c:url value="bootstrap.min.css" />" rel="stylesheet">

    <title>Sessions and Cookies</title>



</head>



<body class = "text-center">




<main class ="form-signin w-100 m-auto">


<div class = "fixed-top">
    <div class="container">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                <span class="fs-4">Library Login</span>
            </a>

            <ul class="nav nav-pills">
                <li class="nav-item"><a href="home.jsp" class="nav-link " aria-current="page">Home</a></li>
                <li class="nav-item"><a href="register.jsp" class="nav-link" aria-current="page">register</a></li>
                <li class="nav-item"><a href="Login.jsp" class="nav-link active" aria-current="page">Login</a></li>
                <li class="nav-item"><a href="LogoutServlet" action="LogoutServlet" method="post" onclick="return validate()" class="nav-link" aria-current="page">Logout</a></li>
                <li class="nav-item"><a href="ReserveNavServlet" action="ReserveNavServlet" method="post" onclick="return validate()" class="nav-link" aria-current="page">Reservations</a></li>

            </ul>
        </header>
    </div>
</div>


<form action="LoginServlet" method="post" onsubmit="return validate()">
    <h1 class="h3 mb-3 fw-normal">Sign-In</h1>

    <div class="form-floating">
    <input id="username" name="username" type="text" class = "form-control" placeholder="username"/>
        <label for="username">Username</label>
    </div>

    <div class="form-floating">

    <input id="password" name="password" type="password" class = "form-control" placeholder="password"/>
    <label for="password">Password</label>
    </div>

    <input class="w-100 btn btn-lg btn-primary"  type="submit" name="Login" value="Login" /> <br/> </br>
    <span id="error_msg"></span>
</form>

    </br>
    <p>${loginError}</p>




</main>

</body>

</html>