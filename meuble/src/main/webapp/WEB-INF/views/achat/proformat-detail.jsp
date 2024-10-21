<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.proformat.proformatFille.ProformatFille" %>
<%@ page import="com.source.meuble.achat.proformat.Proformat" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>

<%
    List<ProformatFille> pfs = ((List<ProformatFille>) request.getAttribute("pfs"));
%>


<form method="post" action="/proformat/ajouter-prix">
<div class="w-full flex justify-center mt-2 bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30">
<%--    <div class="overflow-x-auto w-1/3">--%>
        <table class="table">
            <thead>
                <tr>
                    <th>id</th>
                    <th class="text-black text-center">ID Produit</th>
                    <th class="text-black text-center">Produit</th>
                    <th class="text-black text-center">Prix</th>
                </tr>
            </thead>
            <tbody>
            <%
                for(ProformatFille pf: pfs) {
            %>
            <tr>
                <th>PRF00<%=pf.getId()%></th>
                <td class="text-black text-center">PRD00<%=pf.getIdMarchandise().getIdMarchandise()%></td>
                <td class="text-black text-center"><%=pf.getIdMarchandise().getNom()%></td>
                <td class="text-black text-center number">
                    <input type="hidden" name="pf[]" value="<%=pf.getId()%>">
                    <input type="number" name="prix[]" class="input" value="<%=pf.getPrix() != null ? pf.getPrix() : "0.00"%>">
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
<%--    </div>--%>
</div>
    <div class="flex justify-center">
        <button  type="submit" class="btn btn-primary z-[80]">Valider Prix</button>
    </div>


</form>