<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulaire Utilisateur</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h2>Formulaire Utilisateur</h2>
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="error"><%= request.getAttribute("errorMessage") %></div>
    <% } %>
    <form action="userServlet" method="post">
        <div class="form-group">
            <label for="nom" class="required-field">Nom</label>
            <input type="text" id="nom" name="nom" required placeholder="Votre nom">
        </div>
        <div class="form-group">
            <label for="email" class="required-field">Email</label>
            <input type="email" id="email" name="email" required placeholder="exemple@email.com">
        </div>
        <input type="submit" value="Soumettre">
    </form>
    <p><a href="index.jsp">Retour à l'accueil</a></p>
</div>
</body>
</html>