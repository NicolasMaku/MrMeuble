<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.besoin.Besoin" %>
<%@ page import="com.source.meuble.achat.Fornisseur.Fournisseur" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Map<Integer, List<Besoin>> besoinMap = ((Map<Integer, List<Besoin>>) request.getAttribute("besoinMap"));
    List<Fournisseur> fournisseurs = ((List<Fournisseur>) request.getAttribute("fournisseurs"));
%>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <h2 class="p-3 font-bold underline">Besoins en cours de validation par departement Achat:</h2>

    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black">Demandeur</th>
            <th class="text-black">Produit</th>
            <th class="text-black">Quantité</th>
            <th class="text-black">Date besoin</th>
            <th class="text-black">Action</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <%
            for(Besoin besoin: besoinMap.get(0)) {
        %>
        <tr>
            <td><%=besoin.getId()%></td>
            <td><%=besoin.getIdDemandeur().getNom()%></td>
            <td><%=besoin.getIdMarchandise().getNom()%></td>
            <td><%=besoin.getQuantite()%></td>
            <td><%=besoin.getDaty()%></td>
            <th>
                <a href="/besoin/valider?idBesoin=<%=besoin.getId()%>"
                   onclick="
                       confirmSubmission(event, 'Est-ce que les besoins ne sont pas disponible au stock?');
                       confirmSubmission(event, 'Est-ce que les fonds sont assez pour l\'achat?')
                   "
                >
                    <button  class="btn btn-success btn-xs">Valider</button>
                </a>
            </th>
        </tr>
        <%
            }
        %>


        </tbody>
    </table>
</div>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black mt-2.5">
    <h2 class="p-3 font-bold underline">Besoins en cours de validation par le Directeur:</h2>

    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black">Demandeur</th>
            <th class="text-black">Produit</th>
            <th class="text-black">Quantité</th>
            <th class="text-black">Date besoin</th>
            <th class="text-black">Action</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <%
            for(Besoin besoin: besoinMap.get(1)) {
        %>
        <tr>
            <td><%=besoin.getId()%></td>
            <td><%=besoin.getIdDemandeur().getNom()%></td>
            <td><%=besoin.getIdMarchandise().getNom()%></td>
            <td><%=besoin.getQuantite()%></td>
            <td><%=besoin.getDaty()%></td>
            <th>
                <a href="/besoin/valider?idBesoin=<%=besoin.getId()%>"><button class="btn btn-success btn-xs">Valider</button></a>
            </th>
        </tr>
        <%
            }
        %>


        </tbody>
    </table>
</div>


<form action="/proformat/demande" method="post">
    <div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black mt-2.5">
        <table class="table">
            <thead>
            <tr>
                <th></th>
                <th class="text-black">id</th>
                <th class="text-black">Demandeur</th>
                <th class="text-black">Produit</th>
                <th class="text-black">Quantité</th>
                <th class="text-black">Date besoin</th>
            </tr>
            </thead>
            <tbody class="text-black">
            <%
                for(Besoin besoin: besoinMap.get(2)) {
            %>
            <tr>
                <th>
                    <label>
                        <input type="checkbox" class="checkbox" name="besoin[]" value="<%=besoin.getId()%>"/>
                    </label>
                </th>
                <td><%=besoin.getId()%></td>
                <td><%=besoin.getIdDemandeur().getNom()%></td>
                <td><%=besoin.getIdMarchandise().getNom()%></td>
                <td><%=besoin.getDaty()%></td>

            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <div class="absolute right-0 w-1/3 flex-row my-3">
        <label class="my-2" for="validation-besoin-fournisseur">Fournisseur:</label>
        <br>
        <select name="fournisseur" id="validation-besoin-fournisseur"
                class="py-3 px-4 block w-2/3 border border-gray-500 rounded-lg text-sm">
            <%
                for(Fournisseur fournisseur: fournisseurs) {
            %>
                <option value="<%=fournisseur.getId()%>"><%=fournisseur.getCompte()%> - <%=fournisseur.getNom()%></option>
            <%
                }
            %>
        </select>
<%--        test sur ce bouton--%>
        <button id="btn" class="btn btn-outline w-2/3 my-3" type="button">Demander proformat</button>

    </div>
</form>

<div id="for-validation-besoin" class="relative">
    <ul>
        <li>•	Est-ce que les besoins ne sont pas disponible au stock?</li>
        <li>•	Est-ce que les fonds sont assez pour l'achat?</li>
        <li>•	Est-ce qu’il y a le budget pour l’achat?</li>
    </ul>
</div>