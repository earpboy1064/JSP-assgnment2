package servlets;

import models.BookModel;
import models.MusicModel;
import models.UserModel;
//import services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "registerServlet", value = "/registerServlet")
public class registerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String username = request.getParameter("username");
        //String password = request.getParameter("password");

        String fixed_password ="1234";
        String fixed_userName = "earpboy";


        //if (username.equals(fixed_userName) && password.equals(fixed_password)) {

        //UserModel userModel = new UserModel(1,"jarod","Luther",username,password);
        UserModel userModel = new UserModel(1,"jarod","Luther",fixed_userName,fixed_password);

        HttpSession session = request.getSession();

        session.setAttribute("user", userModel);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/FetchBookServlet");
        requestDispatcher.forward(request, response);
            /*
            List<BookModel> list = new ArrayList<>();
            list.add(new BookModel(1, 1, "back in black",1, 1));
            list.add(new BookModel(2, 3, "Fire in the Sky",1, 1));
            list.add(new BookModel(3, 1, "Under the black moon",6, 1));
            list.add(new BookModel(1, 1, "Camping or dummies",1, 1));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp");
            session.setAttribute("List_of_Books", list);
            //RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp");
            requestDispatcher.forward(request, response);
*/

        //}
        //  else {
        // RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        // request.setAttribute("error", "Incorrect email or pasword");
        //requestDispatcher.forward(request, response);
        //}
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

