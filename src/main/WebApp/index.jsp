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
    <link href="<c:url value="Style.css" />" rel="stylesheet">
    <title>Sessions and Cookies</title>
    <a href="Login.jsp">login</a>
    <a href="register.jsp">register</a>
    <a href="reserve.jsp">reserve</a>
    <p>${login}</p>
</head>
<body>

<form action="FetchBookServlet" method = "post" onsubmit="return validate()">
    Filter Books:
    <!--<select name="book">
        <option value="999">All</option>-->
    topic_id: <input id="topic_id" name="topic_id" type="text" /> <br/>

    <!--
    <div class="dropdown">
        <button class="dropbtn">Dropdown</button>

        <div class="dropdown-content">
            <input type="submit" name="1" value="1" />
            <input type="submit" name="2" value="2" />
            <input type="submit" name="3" value="3" />
        </div>
    </div>
-->

    <input type="submit" value="submit" />

    <c:forEach var="each_book" items="${list_of_books}">
            <ul>
                <li>${each_book.getBook_name() } <a href="reserve.jsp">reserve</a></li>
            </ul>
        </c:forEach>
    <!-- </select>-->
 </form>


 <!--<input type="text" id="book" name="book" placeholder = "Search books..">-->

<p>${error}</p>

<a href="hello-servlet">Hello Servlet</a>
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