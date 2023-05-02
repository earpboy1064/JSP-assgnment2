/*
 *
 *  JSP Assignment 2
 *  Wyatt LeMaster
 *  5/2/2023
 *  servlet collects user data from jsp and registers new user account
 *
 *
 */



package servlets;

import models.UserModel;
import services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "registerServlet", value = "/registerServlet")
public class registerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordCON");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        if (password.equals(passwordConfirm) == true) {
            UserModel userModel = new UserModel(1, firstName, lastName, username, password);


            HttpSession session = request.getSession();

            session.setAttribute("user", userModel);


            MySQLdb db = MySQLdb.getInstance();


            Boolean isSuccess = false;
            try {
                isSuccess = db.register(username, password, firstName, lastName);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            if (isSuccess == false)
            {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
                request.setAttribute("error", "username already exists");
                requestDispatcher.forward(request, response);

            }
            else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                session.setAttribute("loggedIn", true);
                request.setAttribute("login", true);
                requestDispatcher.forward(request, response);
            }
        }
        else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
            request.setAttribute("error", "Passwords must match!");
            requestDispatcher.forward(request, response);
        }
    }
}




