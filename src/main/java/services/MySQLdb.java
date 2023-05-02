/*
 *
 *  JSP Assignment 2
 *  Wyatt LeMaster
 *  5/2/2023
 *  Class connects to Database and submits queries for users and books.
 *
 *
 */


package services;

import models.BookModel;
import models.TopicModel;
import models.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLdb {
    String url = "jdbc:mysql://localhost:3306/library_catalog";  //Database URL
    String username = "root";  // Username
    String password = "1234";  //password
    Connection connection = null;
    static MySQLdb instance = null;


    public MySQLdb() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace();
        }
    }




    public static synchronized MySQLdb getInstance() {
        if (instance == null) {
            instance = new MySQLdb();
        }
        return instance;
    }


    /**
     * Queries database for user info and compares with inputted data.
     * If match creates userModel object and returns that
     *
     * @param username
     * @param password
     * @return UserModel with user data
     * @throws SQLException
     */
    public UserModel doLogin(String username, String password) throws SQLException {
        UserModel userModel = null;




        // Statement
        String qLogin = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(qLogin);


        if (resultSet.next()) {
            String fname = resultSet.getString("fname");
            String lname = resultSet.getString("lname");
            int id = resultSet.getInt("user_id");
            String name = fname + " " + lname;


            userModel = new UserModel(id, fname, lname, username, password);
            resultSet.close();
            statement.close();
//        preparedStatement.close();
            return userModel;
        } else {
            return null;
        }

    }

    /**
     *
     * accepts user data and inserts into database.
     *
     * @param username
     * @param password
     * @param firstName
     * @param lastName
     * @return
     * @throws SQLException
     */
    public Boolean register(String username, String password, String firstName, String lastName) throws SQLException {
        UserModel userModel = null;


        String qGetID = "SELECT MAX(user_id) FROM users";
        PreparedStatement preparedStatement = connection.prepareStatement(qGetID);
        ResultSet IDresult = preparedStatement.executeQuery();


        String UsernameCheck = "SELECT * FROM users WHERE username = '" + username + "'";
        PreparedStatement preparedStatementCheck = connection.prepareStatement(UsernameCheck);
        ResultSet UsernameResult = preparedStatementCheck.executeQuery();




        if (UsernameResult.next()) {

            return false;
        }
        else{
            int id = 0;
            try {
                while (IDresult.next()) {
                    id = IDresult.getInt("MAX(user_id)");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            id++; // adds one to the last ID
            String qLogin = "INSERT INTO users (user_id, fname, lname, username, password) VALUES ('" + id + "', '" + firstName + "', '" + lastName + "', '" + username + "', '" + password + "')";
            Statement statement = connection.createStatement();
            try {
                int resultSet = statement.executeUpdate(qLogin);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return true;


        }

    }


    /**
     *
     * Gets book data from database
     *
     * @param topic_ID
     * @return
     * @throws SQLException
     */
    public List<BookModel> fetchBook(int topic_ID) throws SQLException {
        String qGetBook = null;
        List<BookModel> list = new ArrayList<>();
        if (topic_ID == 999) {
            qGetBook = "SELECT B.book_id, B.topic_id, B.book_name, B.author_id, B.is_available, A.author_name FROM books as B, authors as A WHERE A.author_id = B.author_id;";
        } else {

            qGetBook = "SELECT B.book_id, B.topic_id, B.book_name, B.author_id, B.is_available, A.author_name FROM books as B, authors as A WHERE A.author_id = B.author_id AND B.topic_id = '" + topic_ID + "'";
        }
        PreparedStatement preparedStatement = connection.prepareStatement(qGetBook);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int book_id = resultSet.getInt("book_id");
            int topic_id = resultSet.getInt("topic_id");
            String book_name = resultSet.getString("book_name");
            int author_id = resultSet.getInt("author_id");
            int is_available = resultSet.getInt("is_available");
            String Author_name = resultSet.getString("author_name");

            BookModel bookModel = new BookModel(book_id, topic_id, book_name, author_id, is_available);
            bookModel.setAuthor_name(Author_name);
            list.add(bookModel);
        }
        resultSet.close();
        preparedStatement.close();

        return list;
    }


    /**
     *
     * Fetches topic data from database
     * @param topic_id_in
     * @return
     * @throws SQLException
     */
    public List<TopicModel> fetchTopic(int topic_id_in) throws SQLException {
        String qGetTopic = null;
        List<TopicModel> list = new ArrayList<>();
        if (topic_id_in == 999) {
            qGetTopic = "SELECT T.topic_id, T.topic_name FROM topics as T";
        } else {

            qGetTopic = "SELECT T.topic_id, T.topic_name FROM topics as T WHERE T.topic_id = '" + topic_id_in + "'";
        }
        PreparedStatement preparedStatement = connection.prepareStatement(qGetTopic);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int topic_id = resultSet.getInt("topic_id");
            String topic_name = resultSet.getString("topic_name");

            TopicModel topicModel = new TopicModel(topic_id, topic_name);

            list.add(topicModel);
        }
        resultSet.close();
        preparedStatement.close();

        return list;
    }


    /**
     *
     * completes the reservation of a book in the database.
     * @param user
     * @param book_id
     * @return
     * @throws SQLException
     */
    public boolean doReserve(UserModel user, int book_id) throws SQLException {
        boolean result = false;
        int userID = user.getUser_id();
        if (book_id == 999) {

            return false;
        } else {

            String qDoReserve = "INSERT INTO reservations VALUES(?, ?)";
            String qBooksUpdate = "UPDATE books SET is_available = ? WHERE book_id = ?;";

            PreparedStatement preparedStatement = connection.prepareStatement(qDoReserve);
            preparedStatement.setInt(1, userID);
            preparedStatement.setInt(2, book_id);
            int rows_update = preparedStatement.executeUpdate();

            PreparedStatement preparedStatemenUpdate = connection.prepareStatement(qBooksUpdate);
            preparedStatemenUpdate.setInt(1, 0);
            preparedStatemenUpdate.setInt(2, book_id);

            int Books_update = preparedStatemenUpdate.executeUpdate();
            if (rows_update > 0 && Books_update > 0) {
                result = true;
            }
            preparedStatement.close();
            preparedStatemenUpdate.close();
            return result;
        }
    }

    /**
     * Gets reserved books from database
     *
     * @param user
     * @return
     * @throws SQLException
     */
    public List<BookModel> getReserve(UserModel user) throws SQLException {
        boolean result = false;
        List<BookModel> list = new ArrayList<>();
        int userID = user.getUser_id();


        String qGetReserve = "SELECT DISTINCT B.book_id, B.topic_id, B.book_name, B.author_id, B.is_available, A.author_name FROM books as B, reservations as R, users as U, Authors as A WHERE ? = R.user_id AND R.book_id = B.book_id AND A.author_id = B.author_id;";

        PreparedStatement preparedStatement = connection.prepareStatement(qGetReserve);
        preparedStatement.setInt(1, userID);

        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int book_id = resultSet.getInt("book_id");
            int topic_id = resultSet.getInt("topic_id");
            String book_name = resultSet.getString("book_name");
            int author_id = resultSet.getInt("author_id");
            int is_available = resultSet.getInt("is_available");
            String Author_name = resultSet.getString("author_name");

            BookModel bookModel = new BookModel(book_id, topic_id, book_name, author_id, is_available);
            bookModel.setAuthor_name(Author_name);
            list.add(bookModel);
        }
        resultSet.close();
        preparedStatement.close();

        return list;
    }
}


