<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.bonCommande.BonCommande" %><%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 01/11/2024
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<BonCommande> bcs = ((List<BonCommande>) request.getAttribute("bcs"));
%>

<div class="card">
    <h5 class="card-header">Liste Bon de Reception</h5>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>ID Proformat</th>
                <th>Fournisseur</th>
                <th>Etat</th>
                <th>Date Commande</th>
                <th>Date Livraison</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
                <%
                    for(BonCommande bc: bcs) {
                %>
                <tr>
                    <td>BC000<%=bc.getId()%></td>
                    <td>PF000<%=bc.getIdProformat().getId()%></td>
                    <td>FRN000<%=bc.getIdFournisseur().getId()%> - <%=bc.getIdFournisseur().getNom()%></td>
                    <td><%=bc.getEtatHtml()%></td>
                    <td><%=bc.getDateCommande()%></td>
                    <td><%=bc.getDateLivraison() != null ? bc.getDateLivraison() : "-" %></td>
                    <td>
                        <a href="/bon-commande/details?id=<%=bc.getId()%>">
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
