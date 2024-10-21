<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.analytique.centre.Centre" %>
<%@ page import="com.source.meuble.util.RequestAttribute" %>
<%@ page import="com.source.meuble.analytique.produit.Produit" %>
<%@ page import="com.source.meuble.achat.marchandise.Marchandise" %><%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 14/10/2024
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="UTF-8" %>

<%
//    RequestAttribute attribute = new RequestAttribute(request);
    List<Centre> centres = (List<Centre>) request.getAttribute("centres");
    List<Marchandise> produits = ((List<Marchandise>) request.getAttribute("produits"));
%>

<div class="sidebar bg-slate-600 transition-all duration-500">
    <div><a class="link hover:bg-slate-700 transition duration-300" href="#">
        <div class="flex" aria-haspopup="dialog" aria-expanded="false" aria-controls="besoin-modal"
             data-hs-overlay="#besoin-modal">
            <div class="icon"></div>
            <div class="miafina">Besoin
            </div>
        </div>
    </a><a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/validation-besoin">
        <div class="flex">
            <div class="icon"></div>
            <div class="miafina">Valider un besoin
            </div>
        </div>
    </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/proformat">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina">Proformats
                </div>
            </div>
        </a><a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/bon-commande">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina">Bon de commande
                </div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/validation-bon-commande">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina">Valider un bon de commande
                </div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/creation-bon-reception">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina">Creer bon de reception</div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/validation-facture">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina">Valider facture</div>
            </div>
        </a>
    </div>
</div>

<div class="relative z-3">
    <div id="besoin-modal"
         class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] overflow-x-hidden overflow-y-auto pointer-events-none"
         role="dialog" tabindex="-1" aria-labelledby="besoin-modal-label">
        <div
                class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)]">
            <div
                    class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                    <h3 id="besoin-modal-label" class="font-bold text-gray-800 dark:text-white">
                        Ajout de besoin
                    </h3>
                    <button type="button"
                            class="size-8 inline-flex justify-center items-center gap-x-2 rounded-full border border-transparent bg-gray-100 text-gray-800 hover:bg-gray-200 focus:outline-none focus:bg-gray-200 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-700 dark:hover:bg-neutral-600 dark:text-neutral-400 dark:focus:bg-neutral-600"
                            aria-label="Close" data-hs-overlay="#besoin-modal">
                        <span class="sr-only">Close</span>
                        <svg class="shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6 6 18"></path>
                            <path d="m6 6 12 12"></path>
                        </svg>
                    </button>
                </div>
                <form action="/besoin/save" method="POST">
                    <div class="p-4 overflow-y-auto">
                        <select type="date" id="departement" name="centre" class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
                            <%
                                for(Centre centre: centres){
                            %>
                                <option value="<%=centre.getIdCentre()%>"><%=centre.getNom()%></option>
                            <%
                                }
                            %>
                        </select>

                        <div class="flex items-center justify-center py-3 gap-2">
                            <label for="produit-besoin"
                                   class="block text-sm font-medium mb-2 dark:text-white">Produit:</label>
                            <select id="produit-besoin" name="marchandise"
                                    class="py-3 px-4 block w-2/3 border border-gray-500 rounded-lg text-sm"
                            >
                                <%
                                    for(Marchandise produit: produits) {
                                %>
                                <option value="<%=produit.getIdMarchandise()%>"><%=produit.getNom()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <label for="quantite-besoin" class="block text-sm font-medium mb-2 dark:text-white">Quantité:</label>
                            <input type="number" id="quantite-besoin" name="qte"
                                   class="py-3 px-4 block w-1/3 border border-gray-500 rounded-lg text-sm">
                        </div>
                        <label for="date" class="block text-sm font-medium mb-2 dark:text-white">Date
                            besoin:</label>
                        <input type="date" id="date" name="date"
                               class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
                    </div>
                    <div class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
                        <button type="button"
                                class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 focus:outline-none focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-800 dark:border-neutral-700 dark:text-white dark:hover:bg-neutral-700 dark:focus:bg-neutral-700"
                                data-hs-overlay="#besoin-modal">
                            Fermer
                        </button>
                        <button type="submit"
                                class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-transparent bg-gray-600 text-white hover:bg-gray-700 focus:outline-none focus:bg-gray-700 disabled:opacity-50 disabled:pointer-events-none">
                            Valider
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>