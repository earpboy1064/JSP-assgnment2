/*
 *
 *  JSP Assignment 2
 *  Wyatt LeMaster
 *  5/2/2023
 *  Controls the navigation to the reservations servlet
 *
 *
 */


package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "ReserveNavServlet", value = "/ReserveNavServlet")
public class ReserveNavServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();

        boolean loggedIn = false;
        try {
            loggedIn = (boolean) session.getAttribute("loggedIn");
        }
        catch(Exception e)
        {

        }
        if (loggedIn == true) {

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("reserve.jsp");
            request.setAttribute("login", true);
            requestDispatcher.forward(request, response);
        }
        else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
            session.setAttribute("file","reserve.jsp");
            request.setAttribute("error", "Passwords must match!");
            requestDispatcher.forward(request, response);
        }

    }
}


