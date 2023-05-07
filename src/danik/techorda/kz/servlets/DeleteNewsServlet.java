package danik.techorda.kz.servlets;

import danik.techorda.kz.classes.DBConnection;
import danik.techorda.kz.classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/delete-news")
public class DeleteNewsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");

        if (currentUser.getRole_id().getRole_description().equals("admin")) {
            long id = Long.parseLong(request.getParameter("id"));

            DBConnection.deleteNews(id);
            response.sendRedirect("/");
        }
    }
}
