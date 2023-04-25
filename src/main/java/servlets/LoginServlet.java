package servlets;

import models.MusicModel;
import models.UserModel;
//import services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String fixed_name ="Wyatt@gmail.com";
        String fixed_password = "password";


        if (email.equals(fixed_name) && password.equals(fixed_password)) {

            UserModel userModel = new UserModel(email,password);
            HttpSession session = request.getSession();
            session.setAttribute("session_name", userModel);

            List<MusicModel> list = new ArrayList<>();
            list.add(new MusicModel(1,1,"song_one","album_one"));
            list.add(new MusicModel(2,2,"song_two","album_two"));
            list.add(new MusicModel(3,3,"song_three","album_three"));
            list.add(new MusicModel(4,4,"song_four","album_four"));
            list.add(new MusicModel(5,5,"song_five","album_five"));
            request.setAttribute("List_of_music", list);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);


        }
        else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            request.setAttribute("error", "Incorrect email or pasword");
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

