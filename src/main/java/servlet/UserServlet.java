package servlet;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

// Associe le servlet à l'URL /userServlet
@WebServlet(name = "userServlet", value = "/userServlet")
public class UserServlet extends HttpServlet {
    // Liste statique pour stocker les utilisateurs
    private static List<User> users = new ArrayList<>();

    // Traite les requêtes POST (soumission du formulaire)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Récupère nom et email
            String nom = request.getParameter("nom");
            String email = request.getParameter("email");

            // Vérifie si les champs sont vides
            if (nom == null || nom.trim().isEmpty() || email == null || email.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Tous les champs sont obligatoires.");
                request.getRequestDispatcher("userForm.jsp").forward(request, response);
                return;
            }

            // Nettoie les données et stocke dans des variables finales
            final String cleanedNom = nom.trim();
            final String cleanedEmail = email.trim();

            // Vérifie si l'utilisateur existe déjà (par email)
            boolean userExists = users.stream().anyMatch(user -> user.getEmail().equalsIgnoreCase(cleanedEmail));
            if (userExists) {
                request.setAttribute("errorMessage", "Cet email est déjà enregistré.");
                request.getRequestDispatcher("userForm.jsp").forward(request, response);
                return;
            }

            // Crée un nouvel utilisateur
            User user = new User(cleanedNom, cleanedEmail);

            // Ajoute à la liste et stocke dans la session
            users.add(user);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("usersList", users);

            // Redirection vers userServlet (GET) pour éviter la resoumission
            response.sendRedirect(request.getContextPath() + "/userServlet");
        } catch (Exception e) {
            // En cas d'erreur, redirige vers error.jsp
            response.sendRedirect("error.jsp");
        }
    }

    // Traite les requêtes GET pour afficher userDetails.jsp
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Transfère la requête vers userDetails.jsp
        request.getRequestDispatcher("userDetails.jsp").forward(request, response);
    }
}