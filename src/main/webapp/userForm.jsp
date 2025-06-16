<%--
  Created by IntelliJ IDEA.
  User: BUFALLO
  Date: 16/06/2025
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
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
    <form action="userServlet" method="post">
        <div class="form-group">
            <label for="nom" class="required-field">Nom</label>
            <input type="text" id="nom" name="nom" required placeholder="Votre nom complet">
        </div>

        <div class="form-group">
            <label for="email" class="required-field">Email</label>
            <input type="email" id="email" name="email" required placeholder="exemple@email.com">
        </div>

        <input type="submit" value="Soumettre">
    </form>
</div>
</body>
</html>
