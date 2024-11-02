<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.Facture.Facture" %><%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 01/11/2024
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Facture> factures = ((List<Facture>) request.getAttribute("factures"));
%>

<div class="card">
    <h5 class="card-header">Liste Facture</h5>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>ID Bon de Reception</th>
                <th>Fournisseur</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            </thead>

            <tbody class="table-border-bottom-0">
            <%
                for(Facture facture: factures) {
            %>
            <tr>
                <td class="bold">FC000<%=facture.getId()%></td>
                <td>BR000<%=facture.getIdBr().getId()%></td>
                <td>FRN000<%=facture.getIdFournisseur().getId()%> - <%=facture.getIdFournisseur().getNom()%></td>
                <td><%=facture.getDateFacture()%></td>
                <td>
                    <a href="/facture/details?id=<%=facture.getId()%>">
                        <button class="btn btn-primary">Voir Details</button>
                    </a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
