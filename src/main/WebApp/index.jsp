        <%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wyatt
  Date: 4/14/2023
  Time: 7:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>JSP - Assignment 1</title>
</head>

<body>
<%


    List<String> questions = new ArrayList<>(Arrays.asList("one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"));
    List<String> answers = new ArrayList<>(Arrays.asList("true", "false", "true", "false", "true", "false", "true", "false", "true", "false"));

%>

<form>

  <%
      int i = 1;
      for (String question : questions) {
  %>

    <%=question%>

  <br/><br/>

  True: <input type="radio" name="answer<%=i%>" value="True" required />
  False: <input type="radio" name="answer<%=i%>" value="False" required />   <br/><br/>
    <%

            i++;
        }
    %>
    <input type="submit" value="Submit" name="submit"   />  <br/><br/>
</form>
<%
    int score = 0;
    if (request.getParameter("submit") != null) {
        int j = 1;

        for (String answer : answers) {
            if (request.getParameter("answer" + j).toLowerCase().equals(answer)) {
                score++;
            }
            j++;
        }
        System.out.println("Your Score is: " + score); // this might be wrong
    }


%>

<%=System.out.println("Your Score is: " + score)%>



This is a test body page
</body>
</html>
