<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.pieces.Etat" %>
<%@ page import="com.source.meuble.stock.etatStock.EtatStock" %><%--
  Created by IntelliJ IDEA.
  User: Tsinjoniaina
  Date: 10/21/2024
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<EtatStock> etatStockList = (List<EtatStock>) request.getAttribute("etat");
%>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">Id</th>
            <th class="text-black text-center">Marchandise</th>
            <th class="text-black text-center">Date Enregistrement</th>
            <th class="text-black text-center">Quantite</th>
        </tr>
        </thead>
        <tbody class="text-black">
            <% for(int i=0; i<etatStockList.size(); i++){ %>
                <tr>
                    <th><%= etatStockList.get(i).getId()%></th>
                    <td class="text-black text-center"><%= etatStockList.get(i).getMarchandise().getNom()%></td>
                    <td class="text-black text-center"><%= etatStockList.get(i).getDateEnregistrement().toString()%></td>
                    <td class="text-black text-center"><%= etatStockList.get(i).getPrixUnitaire()%></td>
                    <td class="text-black text-center"><%= etatStockList.get(i).getQuantite()%></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
