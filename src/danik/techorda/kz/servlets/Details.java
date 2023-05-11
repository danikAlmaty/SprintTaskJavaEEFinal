package danik.techorda.kz.servlets;

import danik.techorda.kz.classes.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/details")

public class Details extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");

        if (currentUser != null) {


            long id = -1;

            try {
                id = Long.parseLong(request.getParameter("new_id"));
            } catch (Exception e) {
                e.printStackTrace();
            }

            News newsById = DBConnection.getNewsById(id);
            ArrayList<Category> categories = DBConnection.getCategories();
            ArrayList<Comment> comments = DBConnection.getComments(id);

            request.setAttribute("newsOne", newsById);
            request.setAttribute("categories", categories);
            request.setAttribute("commentter", comments);
            request.getRequestDispatcher("details.jsp").forward(request, response);
        }else {
            response.sendRedirect("/login");
        }
    }
}
