<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.proformat.proformatFille.ProformatFille" %>
<%@ page import="com.source.meuble.achat.proformat.Proformat" %>
<%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 01/11/2024
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Proformat proformat = ((Proformat) request.getAttribute("proformat"));
    List<ProformatFille> pfs = ((List<ProformatFille>) request.getAttribute("pfs"));
%>

<form action="/proformat/ajouter-prix" method="POST">
    <div class="card">
        <input type="hidden" name="proformat" value="<%=proformat.getId()%>">
        <h5 class="card-header">
            <strong>Details du Proformat: </strong> PF000<%=proformat.getId()%> du <%=proformat.getDaty()%> <br>
            <strong> Fournisseur: </strong> FRN000<%=proformat.getIdFournisseur().getId()%> - <%=proformat.getIdFournisseur().getNom()%> <br>
            <strong>Etat: <%=proformat.getEtatHtml()%></strong>

        </h5>
        <div class="table-responsive text-nowrap">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Produit</th>
                    <th>Qte</th>
                    <th>Prix Unitaire</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <%
                    for (ProformatFille pf : pfs) {
                %>
                <tr>
                    <td>PFF000<%=pf.getId()%>
                    <td>PRD000<%=pf.getId()%> - <%=pf.getIdMarchandise().getLibelle()%></td>
                    <td><%=pf.getQte()%> <%=pf.getIdMarchandise().getUniteOeuvre().getNom()%>
                    </td>
                    <td>
                        <input type="hidden" name="pf[]" value="<%=pf.getId()%>">
                        <input type="number" class="form-control" step="0.01" name="prix[]" value="<%=pf.getPrix()%>">
                    </td>

                </tr>
                <%
                    }
                %>

                </tbody>
            </table>
            <div class="d-flex m-3 justify-content-center">
                <div>
                    <button type="submit" class="btn btn-primary">Valider Proformat</button>
                    <%
                        if(proformat.isValide()) {
                    %>
                        <a href="/bon-commande/generer?id=<%=proformat.getId()%>">
                            <button type="button" class="btn btn-warning">Generer Bon de Commande</button>
                        </a>
                    <%
                        }
                    %>
                </div>
            </div>

        </div>

    </div>

</form>



