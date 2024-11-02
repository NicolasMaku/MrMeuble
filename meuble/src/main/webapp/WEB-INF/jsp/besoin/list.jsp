<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.besoin.Besoin" %><%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 31/10/2024
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Besoin> besoins = ((List<Besoin>) request.getAttribute("besoins"));
%>

<div class="card">
    <h5 class="card-header">Liste des Besoins a Valider</h5>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nom du Produit</th>
                <th>Quantite</th>
                <th>Departement</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <%
                for(Besoin besoin: besoins) {
            %>
                <tr>
                    <td><strong>BES000<%=besoin.getId()%></strong></td>
                    <td><%=besoin.getIdMarchandise().getLibelle()%></td>
                    <td><%=String.format("%.2f", besoin.getQuantite())%></td>
                    <td><%=besoin.getRole().name()%></td>
                    <td><%=besoin.getDaty()%></td>
                    <td>
                        <a href="/besoin/valider?idBesoin=<%=besoin.getId()%>"><button class="btn btn-primary">Valider</button></a>
                    </td>
                </tr>
            <%
                }
            %>

            </tbody>
        </table>
    </div>
</div>