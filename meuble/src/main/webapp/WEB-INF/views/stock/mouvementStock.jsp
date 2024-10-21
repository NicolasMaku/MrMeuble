<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.stock.mouvementStock.MouvementStock" %><%--
  Created by IntelliJ IDEA.
  User: Tsinjoniaina
  Date: 10/21/2024
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<MouvementStock> mouvementStocks = (List<MouvementStock>) request.getAttribute("mouvement");
%>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">Id</th>
            <th class="text-black text-center">Marchandise</th>
            <th class="text-black text-center">Date Enregistrement</th>
            <th class="text-black text-center">Quantite</th>
            <th class="text-black text-center">Nature</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <% for(int i=0; i<mouvementStocks.size(); i++){ %>
        <tr>
            <th><%= mouvementStocks.get(i).getId()%></th>
            <td class="text-black text-center"><%= mouvementStocks.get(i).getMarchandise().getNom()%></td>
            <td class="text-black text-center"><%= mouvementStocks.get(i).getDateEnregistrement().toString()%></td>
            <td class="text-black text-center"><%= mouvementStocks.get(i).getQuantite()%></td>
            <td class="text-black text-center"><%= mouvementStocks.get(i).getPrixUnitaire()%></td>
            <td class="text-black text-center">
                <% if(mouvementStocks.get(i).getNature()==0){
                    out.print("Achat");
                }else {
                    out.print("Vente");
                }%>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
