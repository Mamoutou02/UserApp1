<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Détails Utilisateur</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h2>Détails Utilisateur</h2>
    <% User currentUser = (User) session.getAttribute("user"); %>
    <% if (currentUser != null) { %>
    <h3>Votre profil</h3>
    <table>
        <tr><th>Nom</th><td><%= currentUser.getNom() %></td></tr>
        <tr><th>Email</th><td><%= currentUser.getEmail() %></td></tr>
    </table>
    <% } else { %>
    <p>Aucun utilisateur courant.</p>
    <% } %>

    <h3>Liste des utilisateurs</h3>
    <% List<User> usersList = (List<User>) session.getAttribute("usersList"); %>
    <% if (usersList != null && !usersList.isEmpty()) { %>
    <table>
        <tr><th>#</th><th>Nom</th><th>Email</th></tr>
        <% for (int i = 0; i < usersList.size(); i++) {
            User user = usersList.get(i);
            boolean isCurrent = currentUser != null && currentUser.getEmail().equals(user.getEmail());
        %>
        <tr <%= isCurrent ? "class='highlight'" : "" %>>
            <td><%= i + 1 %></td>
            <td><%= user.getNom() %></td>
            <td><%= user.getEmail() %></td>
        </tr>
        <% } %>
    </table>
    <% } else { %>
    <p>Aucun utilisateur enregistré.</p>
    <% } %>
    <p><a href="userForm.jsp">Ajouter un utilisateur</a></p>
    <p><a href="index.jsp">Retour à l'accueil</a></p>
</div>
</body>
</html>