package com.model.userapp1;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "userServlet", value = "/userServlet")
public class UserServlet extends HttpServlet {
    private static List<User> users = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String nom = request.getParameter("nom");
            String email = request.getParameter("email");

            if(nom == null || nom.isEmpty() || email == null || email.isEmpty()) {
                throw new ServletException("Tous les champs sont obligatoires");
            }

            com.model.userapp1.User user = new com.model.userapp1.User(nom, email);

            HttpSession session = request.getSession();

            users.add(user);
            session.setAttribute("user", user);
            session.setAttribute("usersList", users);

            request.getRequestDispatcher("userDetails.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }
    }

    public void destroy() {
    }
}
