<%@ page import="com.source.meuble.achat.bonCommande.BonCommande" %>
<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFille" %>
<%@ page import="com.source.meuble.utilisateur.Utilisateur" %>
<%@ page import="com.source.meuble.utilisateur.UserRole" %>
<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 01/11/2024
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Utilisateur u = ((Utilisateur) request.getAttribute("u"));
    BonCommande bc = ((BonCommande) request.getAttribute("bc"));
    List<BonCommandeFille> bcfs = ((List<BonCommandeFille>) request.getAttribute("bcf"));

%>

<%
    if(u.getRole() == UserRole.DIRECTION && bc.isValide()) {
%>
<form action="/bon-commande/commander" method="post">
    <div class="flex">
        <div class="d-flex justify-content-center">
            <div class="card mb-4 w-50">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Faire Une Commade</h5>
                    <%--                <small class="text-muted float-end">Demandeur: <%=u.getRole().name()%></small>--%>
                </div>
                <div class="card-body">
                    <input type="hidden" name="idBc" value="<%=bc.getId()%>">
                    <div class="mb-3">
                        <label class="form-label" for="i1">Date Commande: </label>
                        <input type="date" id="i1" class="form-control" name="dateCommande" value="<%=LocalDate.now()%>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="i2">Date Livraison prévu: </label>
                        <input type="date" id="i2" class="form-control" name="dateLivraison" value="<%=LocalDate.now()%>">
                    </div>


                    <button type="submit" class="btn btn-primary">Commander</button>
                </div>
            </div>
        </div>
    </div>
</form>
<%
    }
%>

<%
    if(bc.getEtat() == 3) {
%>
<form action="/bon-reception/generer" method="post">
    <div class="flex">
        <div class="d-flex justify-content-center">
            <div class="card mb-4 w-50">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Generer Bon de Reception</h5>
                    <%--                <small class="text-muted float-end">Demandeur: <%=u.getRole().name()%></small>--%>
                </div>
                <div class="card-body">
                    <input type="hidden" name="idBc" value="<%=bc.getId()%>">
                    <div class="mb-3">
                        <label class="form-label" for="i3">Date Reception: </label>
                        <input type="date" id="i3" class="form-control" name="dateReception" value="<%=bc.getDateLivraison()%>">
                    </div>


                    <button type="submit" class="btn btn-primary">Generer Bon de Reception</button>
                </div>
            </div>
        </div>
    </div>
</form>

<%
    }
%>


<div class="card">
    <input type="hidden" name="proformat" value="<%=bc.getId()%>">
    <h5 class="card-header">
        <strong>Details du Bon de Commande: </strong> BC000<%=bc.getId()%> du <%=bc.getDateCommande()%> <br>
        <strong> Fournisseur: </strong> FRN000<%=bc.getIdFournisseur().getId()%> - <%=bc.getIdFournisseur().getNom()%> <br>
        <strong>Etat: <%=bc.getEtatHtml()%>
        </strong>

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
                for (BonCommandeFille bcf : bcfs) {
            %>
            <tr>
                <td>BCF000<%=bcf.getId()%>
                <td>PRD000<%=bcf.getIdMarchandise().getId()%> - <%=bcf.getIdMarchandise().getLibelle()%>
                </td>
                <td class="text-right"><%=String.format("%.2f", bcf.getPrix())%>
                </td>
                <td><%=bcf.getQuantite()%> <%=bcf.getIdMarchandise().getUniteOeuvre().getNom()%>
                </td>

            </tr>
            <%
                }
            %>
            </tbody>
        </table>


    </div>

</div>

