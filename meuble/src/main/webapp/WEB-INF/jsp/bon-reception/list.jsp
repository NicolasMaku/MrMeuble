<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.BonReception.BonReception" %>
<%@ page import="com.source.meuble.achat.bonCommande.BonCommande" %><%--
  Created by IntelliJ IDEA.
  User: Nathanalex
  Date: 01/11/2024
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<BonReception> brs = ((List<BonReception>) request.getAttribute("brs"));
%>

<div class="card">
    <h5 class="card-header">Liste Bon de Commande</h5>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>ID Bon de Commande</th>
                <th>Date Reception</th>
                <th>Etat</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <%
                for(BonReception br: brs) {
            %>
                <tr>
                    <td class="bold">BR000<%=br.getId()%></td>
                    <td>BC000<%=br.getIdBc().getId()%></td>
                    <td><%=br.getDateReception()%></td>
                    <td><%=br.getEtat()%></td>
                    <td>
                        <a href="/bon-reception/details?id=<%=br.getId()%>">
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

