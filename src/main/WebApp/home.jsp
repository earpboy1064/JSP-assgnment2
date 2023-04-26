<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.UserModel" %>
<%@ page import="models.MusicModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sessions and Cookies</title>
</head>
<body>

<%if(request.getSession() != null){

        if(session.getAttribute("user") != null){

            UserModel user = (UserModel) session.getAttribute("user");

%>

<p> Hello, <%=user.getFname() %>, <%=user.getLname() %> </p>
<p> <a href="LogoutServlet"> Logout </a></p>

<form action ="LoginServlet">
<c:forEach var="each_book" items="${list_of_books}" >
    <p> ${each_book.getBook_name() }</p>

</c:forEach>
</form>
<%

} else {

    RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
    request.setAttribute("error", "Incorrect email or password..!!!");
    requestDispatcher.forward(request, response);
    }

}
else {
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
    request.setAttribute("error", "Incorrect email or password..!!!");
    requestDispatcher.forward(request, response);
    }


%>
</body>
</html>