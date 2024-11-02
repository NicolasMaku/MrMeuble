<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.besoin.Besoin" %>
<%@ page import="com.source.meuble.achat.Fornisseur.Fournisseur" %><%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 01/11/2024
  Time: 09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Besoin> besoins = ((List<Besoin>) request.getAttribute("besoins"));
    List<Fournisseur> frns = ((List<Fournisseur>) request.getAttribute("fournisseurs"));
%>

<form action="/proformat/demande" method="post">
    <div class="flex">
        <div class="d-flex justify-content-center">
            <div class="card mb-4 w-50">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Demande de Proformat</h5>
                    <%--                <small class="text-muted float-end">Demandeur: <%=u.getRole().name()%></small>--%>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label" for="produit">Fournisseur: </label>
                        <select name="fournisseur" id="produit" class="form-select">
                            <%
                                for (Fournisseur frn : frns) {
                            %>
                            <option value="<%=frn.getId()%>">FRN000<%=frn.getId()%> - <%=frn.getNom()%> [<%=frn.getCompte()%>]</option>
                            <%
                                }
                            %>
                            <option id="addProduit" value="$">+ Ajouter un nouveau produit</option>
                        </select>
                    </div>


                    <button type="submit" class="btn btn-primary">Valider</button>
                </div>
            </div>
        </div>
    </div>


    <div class="card">
        <h5 class="card-header">Inclure les besoins dans le Proformat</h5>
        <div class="table-responsive text-nowrap">
            <table class="table">
                <thead>
                <tr>
                    <th></th>
                    <th>ID</th>
                    <th>Nom du Produit</th>
                    <th>Quantite</th>
                    <th>Departement</th>
                    <th>Date</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <%
                    for (Besoin besoin : besoins) {
                %>
                <tr>
                    <td><input class="form-check-input" type="checkbox" name="besoin[]" value="<%=besoin.getId()%>"/></td>
                    <td><strong>BES000<%=besoin.getId()%>
                    </strong></td>
                    <td><%=besoin.getIdMarchandise().getLibelle()%>
                    </td>
                    <td><%=String.format("%.2f", besoin.getQuantite())%>
                    </td>
                    <td><%=besoin.getRole().name()%>
                    </td>
                    <td><%=besoin.getDaty()%>
                    </td>

                </tr>
                <%
                    }
                %>

                </tbody>
            </table>
        </div>
    </div>
</form>

