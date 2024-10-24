<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.achat.bonCommande.BonCommande" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Map<Integer, List<BonCommande>> bcMap = (Map<Integer, List<BonCommande>>) request.getAttribute("bcMap");
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
            for (BonCommande bc : bcMap.get(0)) {
        %>
        <tr>
            <th>BC00<%=bc.getId()%>
            </th>
            <td><%=bc.getIdFournisseur().getNom()%>
            </td>
            <td><%=bc.getDateCommande()%>
            </td>
            <td><%=bc.getEtat()%>
            </td>
            <td></td>
            <th class="flex justify-center gap-2">
                <a id="genererBonCommande" href="/bon-commande/valider?id=<%=bc.getId()%>">
                    <button class="btn btn-success btn-xs">Valider</button>
                </a>
                <%--                <button class="btn btn-info btn-xs">Transferer</button>--%>
                <a href="/bon-commande/details?id=<%=bc.getId()%>"><button class="btn btn-default btn-xs">Details</button></a>
            </th>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
</div>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black mt-2">
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
            for (BonCommande bc : bcMap.get(1)) {
        %>
        <tr>
            <th>BC00<%=bc.getId()%>
            </th>
            <td><%=bc.getIdFournisseur().getNom()%>
            </td>
            <td><%=bc.getDateCommande()%>
            </td>
            <td><%=bc.getEtat()%>
            </td>
            <td></td>
            <th class="flex justify-center gap-2">
                <a id="genererBonCommande1" href="/bon-commande/valider?id=<%=bc.getId()%>">
                    <button class="btn btn-success btn-xs">Valider</button>
                </a>
                <%--                <button class="btn btn-info btn-xs">Transferer</button>--%>
                <a href="/bon-commande/details?id=<%=bc.getId()%>"><button class="btn btn-default btn-xs">Details</button></a>
            </th>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
</div>

<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black mt-2.5">
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
            for (BonCommande bc : bcMap.get(2)) {
        %>
        <tr>
            <th>BC00<%=bc.getId()%>
            </th>
            <td><%=bc.getIdFournisseur().getNom()%>
            </td>
            <td><%=bc.getDateCommande()%>
            </td>
            <td><%=bc.getEtat()%>
            </td>
            <td></td>
            <th class="flex justify-center gap-2">
                <%--                <a href="/bon-commande/valider?id=<%=bc.getId()%>"><button class="btn btn-success btn-xs">Valider</button></a>--%>
                <form action="/bon-commande/transferer" method="post">
                    <input type="hidden" name="id" value="<%=bc.getId()%>">
                    Date Livraison: <input type="date" class="input" name="date">
                    <button type="submit" class="btn btn-info btn-xs">Transferer</button>
                </form>
                <a href="/bon-commande/details?id=<%=bc.getId()%>"><button class="btn btn-default btn-xs">Details</button></a>
            </th>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
</div>

<script>
    document.getElementById('genererBonCommande').addEventListener('click', function(event) {
        event.preventDefault();

        var lienHref = this.getAttribute('href');
        Swal.fire({
            title: 'Avez vous validé si :',
            html: ` • le bon de commande correspond bien à la demande d’achat?<br>
                    • les prix correspondent au proforma<br>
                    • les fonds sont encore disponibles pour l’achat?<br>
                    • Validation interne effectué?`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Valider',
            cancelButtonText: 'Annuler'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = lienHref;
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                // Si l'utilisateur clique sur "Annuler", rester sur la page
                console.log('Action annulée');
                // Aucune redirection ne se produit
            }
        });
    });

    document.getElementById('genererBonCommande1').addEventListener('click', function(event) {
        event.preventDefault();

        var lienHref = this.getAttribute('href');
        Swal.fire({
            title: 'Avez vous validé si :',
            html: ` • Est-ce que les prix correspondent au proforma<br>
                    • Est-ce que les fonds sont encore disponibles pour l’achat?<br>
                    • Validation interne effectué?`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Valider',
            cancelButtonText: 'Annuler'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = lienHref;
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                // Si l'utilisateur clique sur "Annuler", rester sur la page
                console.log('Action annulée');
                // Aucune redirection ne se produit
            }
        });
    });


    document.getElementById('genererBonCommande2').addEventListener('click', function(event) {
        event.preventDefault();

        var lienHref = this.getAttribute('href');
        Swal.fire({
            title: 'Avez vous validé si :',
            html: ` • Est-ce que les prix correspondent au proforma<br>
                    • Est-ce que les fonds sont encore disponibles pour l’achat?<br>
                    • Validation interne effectué?`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Valider',
            cancelButtonText: 'Annuler'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = lienHref;
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                // Si l'utilisateur clique sur "Annuler", rester sur la page
                console.log('Action annulée');
                // Aucune redirection ne se produit
            }
        });
    });

</script>

