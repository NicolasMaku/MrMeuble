
<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.BonReception.BonReception" %>
<%@ page import="com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille" %>
<%@ page import="com.source.meuble.achat.bonCommande.BonCommande" %>
<%@ page import="com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFille" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<BonCommandeFille> bonReceptionsFille= (List<BonCommandeFille>)request.getAttribute("bcFille");
%>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black text-center">Id bon de reception</th>
            <th class="text-black text-center">Id marchandise</th>
            <th class="text-black text-center">Quantite</th>
            <th class="text-black text-center">Prix</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <%
            for (int i = 0; i < bonReceptionsFille.size(); i++) {
        %>
        <tr>
            <th><%=i%></th>
            <td class="text-blue-500 underline text-center"> <%=bonReceptionsFille.get(i).getId()%></td>
            <td class="text-black text-center"><%=bonReceptionsFille.get(i).getIdBc().getId()%></td>
            <td class="text-black text-center"><%=bonReceptionsFille.get(i).getIdMarchandise().getNom()%></td>
            <td class="text-black text-center"><%=bonReceptionsFille.get(i).getQuantite()%></td>
            <td class="text-black text-center"><%=bonReceptionsFille.get(i).getPrix()%></td>
        </tr>
        <% }%>
        </tbody>
    </table>
</div>
