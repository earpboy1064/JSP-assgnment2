<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sessions and Cookies</title>
</head>
<body>


<form action="LoginServlet" method="post" onsubmit="return validate()">
    Email: <input id="email" name="email" type="text" /> <br/>
    Password: <input id="password" name="password" type="password" /> <br/>
    <input type="submit" name="Login" /> <br/> </br>
    <span id="error_msg"></span>
</form>

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