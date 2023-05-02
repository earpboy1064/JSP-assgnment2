<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.UserModel" %>
<%@ page import="models.MusicModel" %>
<%@ page import="models.TopicModel" %>

<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

    <style>
        th, td {
            padding: 15px;
        }

        tr:nth-child(even) {
            background-color: #D6EEEE;
        }
    </style>
<%
        boolean isLoggedIn = false;

        session.setAttribute("file", "reserve.jsp");
        %>

    <link href="<c:url value="sign-in.css" />" rel="stylesheet">
    <link href="<c:url value="headers.css" />" rel="stylesheet">
    <link href="<c:url value="dropdowns.css" />" rel="stylesheet">

    <link href="headers.css" rel="stylesheet">
    <link href="<c:url value="bootstrap.min.css" />" rel="stylesheet">

    <link href="<c:url value="Style.css" />" rel="stylesheet">
    <title>Sessions and Cookies</title>

    <p></p>
</head>
<body>
<main>


    <div class = "fixed-top">
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                    <span class="fs-4">Library Reserve</span>
                </a>

                <ul class="nav nav-pills">
                    <li class="nav-item"><a href="index.jsp" class="nav-link active" aria-current="page">Home</a></li>
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




<div class="px-4 pt-5 my-5 text-center border-bottom justify-content-center  flex-fill">
    <h1 class="display-4 fw-bold text-body-emphasis"> Reserve a book</h1>
    <div class="col-lg-6 mx-auto">
        <p class="lead mb-4">Browse library</p>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">

           <!-- <form action="FetchBookServlet" method="post" onsubmit="return validate()">
                <h1 class="h3 mb-3 fw-normal">Search</h1>

                <div class="form-floating">
                    topic_id: <input id="topic_id" name="topic_id" type="text" /> <br/>
                </div>

                <input type="submit" value="submit" />
            </form>
            -->
        </div>
    </div>


    <div class="overflow-hidden" style="max-height: 30vh;">
        <div class="container px-5">

             <form action="FetchBookServlet">

            <select name="topic_id">
            <option value="999">All</option>
            <c:forEach var="each_topic" items="${list_of_Topics}">

                    <option value="${each_topic.getTopic_id()}">${each_topic.getTopic_name()}</option>

            </c:forEach>
            </select>
            <input type="submit" value="Filter" />
             </form>

            <form action ="ReserveServlet">
            <div class="form-floating">
                <input id="Res_Book_ID" name="Res_Book_ID" type="text" placeholder="Res_Book_ID"/> <br/>
                <input type="submit" value="Reserve" />
            </div>
            </form>
        </div>
    </div>


    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
    <div class="overflow-hidden" style="max-height: 30vh;">
        <div class="container px-5">
    <table>
        <tr>
            <th>Book ID </th>
            <th>Book Name </th>
            <th>Author Name </th>
            <th>Book availability </th>

        </tr>
        <c:forEach var="each_book" items="${list_of_books}">
            <tr>
                <td>${each_book.getBook_id()}</td>
                <td>${each_book.getBook_name()}</td>
                <td>${each_book.getAuthor_name()}</td>
                <td>${each_book.getIs_available()}</td>
            </tr>
        </c:forEach>
    </table>

</div>
    </div>
        <p>${error}</p>
    </div>
</div>
</body>

</html>

<!-- Sources:
https://mkyong.com/spring-mvc/spring-mvc-how-to-include-js-or-css-files-in-a-jsp-page/
https://www.w3schools.com/howto/howto_css_dropdown.asp
-->