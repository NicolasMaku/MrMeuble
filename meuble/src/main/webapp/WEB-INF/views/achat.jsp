<%--
  Created by IntelliJ IDEA.
  User: Tsinjoniaina
  Date: 10/10/2024
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Achat</title>
</head>
<body>
    <h2>Achat</h2>
    <form action="/mouvementStock/achat" method="post">
        <p>Marchandise: <input type="text" name="idMarchandise"></p>
        <p>Quantite: <input type="number" name="quantite"></p>
        <p>Prix Unitaire: <input type="number" name="prixUnitaire"></p>
        <p>Date: <input type="date" name="date"></p>
        <input type="submit" value="valider">
    </form>
    <p></p>
    <h2>Vente</h2>
    <form action="/mouvementStock/vente" method="post">
        <p>Marchandise: <input type="text" name="idProduit"></p>
        <p>Quantite: <input type="number" name="quantite"></p>
        <p>Date: <input type="date" name="date"></p>
        <input type="submit" value="valider">
    </form>
</body>
</html>
