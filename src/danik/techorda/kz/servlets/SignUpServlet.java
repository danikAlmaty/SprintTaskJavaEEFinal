package danik.techorda.kz.servlets;

import danik.techorda.kz.classes.DBConnection;
import danik.techorda.kz.classes.Role;
import danik.techorda.kz.classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(value = "/sign-up")
public class SignUpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("re_password");
        String fullName = request.getParameter("full_name");

        User user = DBConnection.getUser(email);
        if (user==null){
            if (password.equals(rePassword)){
                User newUser = new User();

                newUser.setEmail(email);
                newUser.setPassword(password);
                newUser.setFull_name(fullName);

                Role role = new Role();
                role.setId(2);

                newUser.setRole_id(role);

                DBConnection.addUser(newUser);

                response.sendRedirect("/sign-up?success");
            } else {
                response.sendRedirect("/sign-up?passworderror");
            }


        } else {
            response.sendRedirect("sign-up?emailerror");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/sign_up.jsp").forward(request, response);
    }
}
