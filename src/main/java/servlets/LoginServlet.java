package servlets;

import models.BookModel;
import models.MusicModel;
import models.UserModel;
import services.MySQLdb;
//import services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String fixed_password ="1234";
        String fixed_userName = "earpboy";


        MySQLdb db = MySQLdb.getInstance();
        //if(session.getAttribute("user") != null) {


        UserModel user = null;
        try {
            user = db.doLogin(username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        if (user!=null) {

        //UserModel userModel = new UserModel(1,"jarod","Luther",fixed_userName,fixed_password);

        HttpSession session = request.getSession();

            session.setAttribute("user", user);
            session.setAttribute("loggedIn", true);


            String file = (String) session.getAttribute("file");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(file);
            requestDispatcher.forward(request, response);
        }
        else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
            request.setAttribute("loginError", "Incorrect Username or password");
            requestDispatcher.forward(request, response);
        }
        }
        /*
        // TASKS
        // ONE SERVLET FOR ONE TASK
        // 1. create doLogin() -- DONE
        // 2. fetch music from db -- DONE


        MySQLdb db = MySQLdb.getInstance();
        UserModel userModel = null;
        try {
            userModel = db.doLogin(email, password);
        } catch(SQLException e) {
            e.printStackTrace();
        }




        if (userModel != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", userModel);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/FetchMusicServlet");
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            request.setAttribute("error", "Incorrect email or password..!!!");
            requestDispatcher.forward(request, response);
        }
    }

         */
    }

