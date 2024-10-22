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
                <a id="genererBonCommande" href="/bon-commande/generer?id=<%=proformat.getId()%>"><button class="btn btn-success btn-xs">Generer Bon de Commande</button></a>

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

    document.getElementById('validerBesoinDg').addEventListener('click', function(event) {
        event.preventDefault();

        var lienHref = this.getAttribute('href');
        Swal.fire({
            title: 'Avez vous validé si :',
            html: `• les besoins ne sont pas disponibles en stock?.<br>
                   • les fonds disponibles sont assez pour l’achat?<br>
                   • Est-ce qu’il y a le budget pour l’achat?`,
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
