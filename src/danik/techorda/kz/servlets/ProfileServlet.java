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
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");

        if (currentUser!=null){
            User user = DBConnection.getUser(currentUser.getEmail());

            request.setAttribute("superUser", user);
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
        }else {
            response.sendRedirect("/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String password = request.getParameter("password");
        String rePassword = request.getParameter("re_password");
        String fullName = request.getParameter("full_name");

        User user = (User) request.getSession().getAttribute("currentUser");
        if (password.equals(rePassword)){
            if (!password.equals(user.getPassword())||!fullName.equals(user.getFull_name())){
                User newUser = new User();
                newUser.setId(user.getId());
                newUser.setPassword(password);
                newUser.setEmail(user.getEmail());
                newUser.setFull_name(fullName);
                newUser.setRole_id(user.getRole_id());
                DBConnection.updateUser(newUser);
                response.sendRedirect("/profile?success");

            }else{
                response.sendRedirect("/profile?newandoldsame");
            }


        }else {
            response.sendRedirect("/profile?passworderror");
        }
    }
}
