<%@ page contentType="text/html; charset=utf-8" language="java" import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wyatt
  Date: 4/14/2023
  Time: 7:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

DocumentBuilder db = dbf.newDocumentBuilder();

Document doc = db.parse("C:\\Users\\wyatt\\Box\\Spring 2023\\Web app\\JSPAssignment1\\OnlineExamSystem\\src\\main\\WebApp\\assignment.xml");
    NodeList assignment = doc.getElementsByTagName("assignment");
    NodeList questionsL = doc.getElementsByTagName("questions");
    NodeList questionL = doc.getElementsByTagName("question");
    NodeList answerL = doc.getElementsByTagName("answer");

    %>
<html>
<head>
  <title>JSP - Assignment 1</title>
</head>

<body>

<%
    String[] questions = new String[questionL.getLength()];

    for (int i = 0; i <= questionL.getLength()-1; i++) {
        questions[i]=(questionL.item(i).getFirstChild().getNodeValue());
    }

    String[] answers = new String[questionL.getLength()];

    for (int j = 0; j <= answerL.getLength()-1; j++) {
        answers[j]=(answerL.item(j).getFirstChild().getNodeValue());
    }

  //  List<String> questions = new ArrayList<>(Arrays.asList("one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"));
   // List<String> answers = new ArrayList<>(Arrays.asList("true", "false", "true", "false", "true", "false", "true", "false", "true", "false"));

%>

<form>

  <%
      int k = 1;
      for (String question : questions) {
  %>

    <%=question%>

  <br/><br/>

  True: <input type="radio" name="answer<%=k%>" value="True" required />
  False: <input type="radio" name="answer<%=k%>" value="False" required />   <br/><br/>
    <%
        k++;

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

Your Score is <%=score%> // this displays the score to the user.




</body>
</html>
