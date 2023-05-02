/*
 *
 *  JSP Assignment 2
 *  Wyatt LeMaster
 *  5/2/2023
 *  servlet that reserves a book by the id for a user.
 *  User must be logged in.
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

@WebServlet(name = "ReserveServlet", value = "/ReserveServlet")
public class ReserveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int book_id = 999;
        boolean wasSuccess = false;
        boolean loggedIn = false;
        HttpSession session = request.getSession();
        MySQLdb db = MySQLdb.getInstance();
        UserModel user = (UserModel) session.getAttribute("user");

        try {
            loggedIn = (boolean) session.getAttribute("loggedIn");
        } catch (Exception e) {

        }
        if (loggedIn == true) {

            if (session != null) {

                if (request.getParameter("Res_Book_ID") != "") {
                    book_id = Integer.parseInt(request.getParameter("Res_Book_ID"));
                }


                try {
                    wasSuccess = db.doReserve(user, book_id);
                    // request.setAttribute("list_of_books", bookModelList);

                } catch (SQLException e) {
                    e.printStackTrace();
                }

                String file = (String) session.getAttribute("file");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(file);
                requestDispatcher.forward(request, response);


            }
        }
        else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
            session.setAttribute("file","home.jsp");
            request.setAttribute("error", "Passwords must match!");
            requestDispatcher.forward(request, response);
        }
    }


}

