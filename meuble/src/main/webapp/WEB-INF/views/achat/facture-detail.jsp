
<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.BonReception.BonReception" %>
<%@ page import="com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille" %>
<%@ page import="com.source.meuble.achat.Facture.FactureFille.FactureFille" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<FactureFille> factureFilles= (List<FactureFille>)request.getAttribute("factFille");
%>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black text-center">Id facture</th>
            <th class="text-black text-center">Id marchandise</th>
            <th class="text-black text-center">Quantite</th>
            <th class="text-black text-center">Prix</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <%
            for (int i = 0; i < factureFilles.size(); i++) {
        %>
        <tr>
            <th><%=i%></th>
            <td class="text-blue-500 underline text-center"> <%=factureFilles.get(i).getId()%></td>
            <td class="text-black text-center"><%=factureFilles.get(i).getIdFacture()%></td>
            <td class="text-black text-center"><%=factureFilles.get(i).getIdMarchandise()%></td>
            <td class="text-black text-center"><%=factureFilles.get(i).getQuantite()%></td>
            <td class="text-black text-center"><%=factureFilles.get(i).getPrix()%></td>
        </tr>
        <% }%>
        </tbody>
    </table>
</div>
