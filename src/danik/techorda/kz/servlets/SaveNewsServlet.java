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

@WebServlet(value = "/save-news")
public class SaveNewsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");

        if (currentUser.getRole_id().getRole_description().equals("admin")) {

            long id = Long.parseLong(request.getParameter("news_id"));
            String title = request.getParameter("news_title");
            String content = request.getParameter("news_content");
            long idCategory = Long.parseLong(request.getParameter("select_category"));

            News newNews = DBConnection.getNewsById(id);
            Category newCategory = DBConnection.getCategoryById(idCategory);

            newNews.setContent(content);
            newNews.setTitle(title);
            newNews.setCategory_id(newCategory);

            DBConnection.updateNews(newNews);
            response.sendRedirect("/details?new_id=" + id);
        }

    }
}
