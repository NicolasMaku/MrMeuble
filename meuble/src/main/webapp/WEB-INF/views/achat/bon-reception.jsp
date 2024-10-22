<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.BonReception.BonReception" %>
<%@ page import="com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<BonReception> bonReceptions= (List<BonReception>)request.getAttribute("bonReceptions");
%>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black text-center">Id bon de commande</th>
            <th class="text-black text-center">Date de reception</th>
            <th class="text-black text-center">Action</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <%
            for (int i = 0; i < bonReceptions.size(); i++) {
        %>
        <tr>
            <td class="text-blue-500 underline text-center"><a href="/BonReception/details?id=<%=bonReceptions.get(i).getId()%>"><%=bonReceptions.get(i).getId()%></a></td>
            <td class="text-black text-center"><%=bonReceptions.get(i).getIdBc().getId()%></td>
            <td class="text-black text-center"><%=bonReceptions.get(i).getDateReception()%></td>
            <th class="flex justify-center gap-2">
                <button class="btn btn-info btn-xs"><a href="/Facture/transfert?id=<%=bonReceptions.get(i).getId()%> " >Transferer</a></button>
            </th>
        </tr>
        <% }%>
        </tbody>
    </table>
</div>
