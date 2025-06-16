<%@ page import="com.model.userapp1.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: BUFALLO
  Date: 16/06/2025
  Time: 09:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Vérification si l'utilisateur est connecté --%>
<c:if test="${empty sessionScope.user}">
    <%-- Redirection vers le formulaire si non connecté --%>
    <c:redirect url="userForm.jsp"/>
</c:if>

<!-- Récupération des données depuis la session -->
<%
    // Récupération de l'utilisateur courant depuis la session
    User user = (User) session.getAttribute("user");

    // Récupération de la liste complète des utilisateurs
    List<User> users = (List<User>) session.getAttribute("usersList");
%>

<!-- Affichage des informations de l'utilisateur connecté -->
<h1>Bonjour ${user.nom}!</h1>   <!-- Affichage du nom de l'utilisateur -->
<p>Email: ${user.email}!</p>    <!-- Affichage de l'email de l'utilisateur -->

<!-- Section liste des utilisateurs -->
<h2>Utilisateurs enregistrés:</h2>
<ul>
    <% // Boucle pour afficher tous les utilisateurs %>
    <% for (User u : users) {%>
    <li><%= u.getNom()%> - <%=u.getEmail()%></li> <!-- Ligne par utilisateur -->
    <% } %>
</ul>