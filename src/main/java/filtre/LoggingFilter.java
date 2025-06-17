package filtre;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/*") // Intercepte toutes les requêtes
public class LoggingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialisation du filtre
        System.out.println("LoggingFilter initialisé");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // Convertit la requête en HttpServletRequest pour obtenir les infos URL
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        // Récupère le chemin de la requête
        String path = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        String servletPath = httpRequest.getServletPath();

        // Affiche les informations dans la console
        System.out.println("Requête interceptée:");
        System.out.println("- Chemin complet: " + path);
        System.out.println("- Contexte: " + contextPath);
        System.out.println("- Servlet: " + servletPath);

        // Passe la requête au filtre suivant ou à la servlet
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Nettoyage du filtre
        System.out.println("LoggingFilter détruit");
    }
}