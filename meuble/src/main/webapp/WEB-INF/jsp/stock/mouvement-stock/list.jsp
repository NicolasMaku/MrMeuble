<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.stock.mouvementStock.MouvementStock" %><%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 01/11/2024
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>

<%
    List<MouvementStock> mvts = ((List<MouvementStock>) request.getAttribute("mvts"));
%>


<div class="card">
    <h5 class="card-header">Liste Mouvement de Stock</h5>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Produit</th>
                <th>Date</th>
                <th>Entree</th>
                <th>Sortie</th>
                <th>Prix Unitaire</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <%
                for(MouvementStock mvt: mvts) {
            %>
                <tr>
                    <td>MVT000<%=mvt.getId()%></td>
                    <td>PRD000<%=mvt.getMarchandise().getId()%> - <%=mvt.getMarchandise().getLibelle()%></td>
                    <td><%=mvt.getDateEnregistrement()%></td>
                    <td><%=mvt.getEntree()%></td>
                    <td><%=mvt.getSortie()%></td>
                    <td class="text-right"><%=mvt.getPrixUnitaire()%></td>
                </tr>
            <%
                }
            %>

            </tbody>
        </table>
    </div>
</div>
