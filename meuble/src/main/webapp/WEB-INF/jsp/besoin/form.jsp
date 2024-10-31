<%@ page import="com.source.meuble.utilisateur.Utilisateur" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.source.meuble.analytique.produit.Produit" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Utilisateur u = ((Utilisateur) request.getAttribute("u"));
    List<Produit> produits = ((List<Produit>) request.getAttribute("produits"));
%>

<div class="flex">
    <div class="d-flex justify-content-center">
        <div class="card mb-4 w-50">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Deamande de Besoin</h5>
                <small class="text-muted float-end">Demandeur: <%=u.getRole().name()%></small>
            </div>
            <div class="card-body">
                <form action="/besoin/save" method="POST">
                    <div class="mb-3">
                        <label class="form-label" for="date-input">Date: </label>
                        <input type="date" class="form-control" id="date-input" value="<%=LocalDate.now()%>" name="date">
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="produit">Produit: </label>
                        <select name="prd" id="produit" class="form-select">
                            <%
                                for(Produit produit: produits) {
                            %>
                                <option value="<%=produit.getId()%>">PRD000<%=produit.getId()%> - <%=produit.getLibelle()%> (en <%=produit.getUniteOeuvre().getNom()%>)</option>
                            <%
                                }
                            %>
                            <option id="addProduit" value="$">+ Ajouter un nouveau produit</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="qte-input">Quantite:</label>
                        <input type="number" step="0.01" id="qte-input" class="form-control" name="qte">
                    </div>

                    <button type="submit" class="btn btn-primary">Valider</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        const $produit = document.getElementById('produit');
        $produit.addEventListener('change', () => {
            if($produit.value === '$') {
                // $produit.
                window.open('http://localhost:8080/besoin/form', 'Ajout Produit', 'width=600,height=400');
                // window.location.href = '/home';
            }
        })
    })
</script>