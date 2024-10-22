<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.Facture.Facture" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Facture> factures= (List<Facture>) request.getAttribute("factures");
%>


<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black text-center">Bon de reception</th>
            <th class="text-black text-center">Date de creation</th>
            <th class="text-black text-center">Action</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <%
            for (int i = 0; i <factures.size() ; i++) {
        %>
        <tr>
            <th><%=i%></th>
            <td class="text-blue-500 underline text-center"><a href="/BonReception/details?id=<%=factures.get(i).getId()%>"><%=factures.get(i).getId()%></a></td>
            <td class="text-black text-center"><%=factures.get(i).getDateFacture()%></td>
            <td class="flex justify-center gap-2">
                <button class="btn btn-default btn-xs"> <a href="/Facture/details?id=<%=factures.get(i).getId()%>">Voir détails </a> </button>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
