<%@ page import="com.source.meuble.achat.proformat.Proformat" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Proformat> proformats = ((List<Proformat>) request.getAttribute("proformats"));
%>


<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black text-center">Fournisseur</th>
            <th class="text-black text-center">Date creation</th>
            <th class="text-black text-center">Action</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <%
            for(Proformat proformat : proformats) {
        %>
        <tr>
            <th><%=proformat.getId()%></th>
            <td class="text-black text-center"><%=proformat.getIdFournisseur().getNom()%></td>
            <td class="text-black text-center"><%=proformat.getDaty()%></td>
            <th class="flex justify-center gap-2">
                <a href="/proformat/details?id=<%=proformat.getId()%>"><button class="btn btn-default btn-xs">Details</button></a>
            </th>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
</div>
