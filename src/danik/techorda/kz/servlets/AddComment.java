package danik.techorda.kz.servlets;

import danik.techorda.kz.classes.Comment;
import danik.techorda.kz.classes.DBConnection;
import danik.techorda.kz.classes.News;
import danik.techorda.kz.classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-comment")
public class AddComment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentUser");
        if (user!=null){
            String comment = request.getParameter("comment");
            long newsId = Long.parseLong(request.getParameter("add_news_id"));

            News news1 = DBConnection.getNewsById(newsId);

            Comment comment1 = new Comment();
            comment1.setComment(comment);
            comment1.setNews(news1);
            comment1.setUser(user);

            DBConnection.addComment(comment1);

            response.sendRedirect("/details?new_id=" + newsId);
        }
    }
}
