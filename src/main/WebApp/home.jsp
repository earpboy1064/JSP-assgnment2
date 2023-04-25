<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.UserModel" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sessions and Cookies</title>
</head>
<body>

<% if(request.getSession() != null){

        if(session.getAttribute("session_name") != null){

            UserModel user = (UserModel) session.getAttribute("session_name");
            %>

<p> Hello, <%=user.getName() %></p>

<c:forEach var="each_music" items="${List_of_Music}" >
    <p> ${each_music.getSong_name() }</p>

</c:forEach>

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