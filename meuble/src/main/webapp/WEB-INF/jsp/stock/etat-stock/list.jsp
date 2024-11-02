<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.stock.etatStock.EtatStock" %><%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 01/11/2024
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<EtatStock> stocks = ((List<EtatStock>) request.getAttribute("stocks"));
%>

<div class="card">
    <h5 class="card-header">Etat de Stock</h5>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Produit</th>
                <th>Quantite</th>
                <th>Prix Unitaire</th>
                <th>Date</th>

            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <%
                for(EtatStock stock: stocks) {
            %>
            <tr>
                <td>STK000<%=stock.getId()%></td>
                <td>PRD000<%=stock.getMarchandise().getId()%> - <%=stock.getMarchandise().getLibelle()%></td>
                <td><%=stock.getQte()%></td>
                <td><%=stock.getPrixUnitaire()%></td>
                <td><%=stock.getDateEnregistrement()%></td>
            </tr>

            <%
                }
            %>

            </tbody>
        </table>
    </div>
</div>
