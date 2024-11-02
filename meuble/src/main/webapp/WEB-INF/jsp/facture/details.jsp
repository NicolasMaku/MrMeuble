<%@ page import="com.source.meuble.achat.Facture.Facture" %>
<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.Facture.FactureFille.FactureFille" %><%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 01/11/2024
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Facture facture = ((Facture) request.getAttribute("facture"));
    List<FactureFille> filles = ((List<FactureFille>) request.getAttribute("filles"));
%>

<div class="flex">
    <div class="d-flex justify-content-center">
        <div class="card mb-4 w-50">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Details Facture</h5>
                <%--                <small class="text-muted float-end">Demandeur: <%=u.getRole().name()%></small>--%>
            </div>
            <div class="card-body">
                <table class="table table-borderless">
                    <tr>
                        <td class="bold">Numero:</td>
                        <td>FC000<%=facture.getId()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Date:</td>
                        <td><%=facture.getDateFacture()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Numero Bon de Reception:</td>
                        <td>BR000<%=facture.getIdBr().getId()%>
                        </td>
                    </tr>

                    <tr>
                        <td class="bold">Emetteur:</td>
                        <td> FRN000<%=facture.getIdBc().getIdFournisseur().getId()%> - <%=facture.getIdBc().getIdFournisseur().getNom()%>
                        </td>
                    </tr>

                    <tr>
                        <td class="bold">Recepteur:</td>
                        <td>mr meuble</td>
                    </tr>

                    <tr>
                        <td class="bold">Etat:</td>
                        <td>
                        </td>
                    </tr>
                </table>

                <div class="d-flex justify-content-end m-2 gap-2">

                    <a href="">
                        <button class="btn btn-primary">Valider et Generer Stock</button>
                    </a>
                    <form action="/facture/generer" method="post">
                        <input type="hidden" name="idBr" value="<%=facture.getId()%>"/>
                        <button type="submit" class="btn btn-warning">Payer</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="card">
    <h5 class="card-header">
        Liste Produits

    </h5>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Produit</th>
                <th>Prix Unitaire</th>
                <th>Qte</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <%
                for (FactureFille fille: filles) {
            %>
            <tr>
                <td>FCF000<%=fille.getId()%>
                <td>PRD000<%=fille.getIdMarchandise().getId()%> - <%=fille.getIdMarchandise().getLibelle()%>
                </td>
                <td class="text-right"><%=String.format("%.2f", fille.getPrix())%>
                </td>
                <td><%=fille.getQuantite()%> <%=fille.getIdMarchandise().getUniteOeuvre().getNom()%>
                </td>

            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

</div>
