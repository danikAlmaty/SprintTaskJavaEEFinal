package danik.techorda.kz.servlets;

import danik.techorda.kz.classes.Category;
import danik.techorda.kz.classes.DBConnection;
import danik.techorda.kz.classes.News;
import danik.techorda.kz.classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-news")
public class AddNews extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User currentUser = (User) request.getSession().getAttribute("currentUser");

        if (currentUser.getRole_id().getRole_description().equals("admin")) {


            long id = Long.parseLong(request.getParameter("category_name"));
            String title = request.getParameter("news_title");
            String content = request.getParameter("news_content");

            Category category = DBConnection.getCategoryById(id);

            if (category != null) {

                News news = new News();
                news.setContent(content);
                news.setTitle(title);
                news.setCategory_id(category);

                DBConnection.addNews(news);

                response.sendRedirect("/home");
            }
        }
    }
}
