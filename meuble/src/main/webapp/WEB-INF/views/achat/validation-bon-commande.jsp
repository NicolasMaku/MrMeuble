<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.bonCommande.BonCommande" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<BonCommande> bcs = ((List<BonCommande>) request.getAttribute("bcs"));
%>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black">Fournisseur</th>
            <th class="text-black">Date creation</th>
            <th class="text-black">Etat</th>
            <th class="text-black">Transfert</th>
            <th class="text-black text-center">Action</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <%
            for(BonCommande bc: bcs) {
        %>
        <tr>
            <th>BC00<%=bc.getId()%></th>
            <td><%=bc.getIdFournisseur().getNom()%></td>
            <td><%=bc.getDateCommande()%></td>
            <td><%=bc.getEtat()%></td>
            <td></td>
            <th class="flex justify-center gap-2">
                <button class="btn btn-success btn-xs">Valider</button>
                <button class="btn btn-info btn-xs">Transferer</button>
                <button class="btn btn-default btn-xs">Details</button>
            </th>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
</div>
