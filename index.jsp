<%@ page contentType="text/html; charset=utf-8" language="java" import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*" errorPage="" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Wyatt LeMaster
  Date: 4/14/2023
  Time: 7:57 PM
  JSP Assignment 1
  Comp 6000

  This program will read questions and answers from assignment.xml and display them as options for an online quiz.
  The user can select the answers to the questions and press submit to see their score. The quiz will clear all
  questions when submitted allowing the user to take it again.
--%>
<%

    //creates doc elements that allow access to the data inside the xml
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

DocumentBuilder db = dbf.newDocumentBuilder();

//*******************
// This path needs to be the ABSOLUTE FILE PATH where the xml file is stored.
//*******************
Document doc = db.parse("D:\\Documents\\GitHub\\JSP-Assignement1\\src\\main\\WebApp\\assignment.xml");
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
<h1> Exam Page </h1>


<%
    // for loops to build arrays that hold questions and answers.
    String[] questions = new String[questionL.getLength()];

    for (int i = 0; i <= questionL.getLength()-1; i++) {
        questions[i]=(questionL.item(i).getFirstChild().getNodeValue());
    }

    String[] answers = new String[questionL.getLength()];

    for (int j = 0; j <= answerL.getLength()-1; j++) {
        answers[j]=(answerL.item(j).getFirstChild().getNodeValue());
    }

%>

<form>

  <%
      // loop that allows printing of each question
      int k = 1;
      for (String question : questions) {
  %>

        <%=k%> <%=question%>

  <br/>

  True: <input type="radio" name="answer<%=k%>" value="True" required />
  False: <input type="radio" name="answer<%=k%>" value="False" required />   <br/><br/>
    <%
        k++;

        }
    %>


    <input type="submit" value="Submit" name="submit"   /> <br/><br/>
</form>
<%
    // checks the score by comparing the inputted results against the answers.
    int score = 0;
    if (request.getParameter("submit") != null) {
        int j = 1;

        for (String answer : answers) {
            if (request.getParameter("answer" + j).toLowerCase().equals(answer)) {
                score++;
            }
            j++;
        }

    }
%>

<h1> Your Score is <%=score%> </h1>


<style>

form
{
    background: gainsboro;
}

</style>

</body>
</html>
