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
            <div class="icon">
                <svg class="icones" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                    <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#ffffff"
                          d="M0 24C0 10.7 10.7 0 24 0L69.5 0c22 0 41.5 12.8 50.6 32l411 0c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3l-288.5 0 5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5L488 336c13.3 0 24 10.7 24 24s-10.7 24-24 24l-288.3 0c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5L24 48C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/>
                </svg>
            </div>
            <div class="miafina">Besoin
            </div>
        </div>
    </a><a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/validation-besoin">
        <div class="flex">
            <div class="icon">
                <svg class="icones" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#ffffff"
                          d="M256 48a208 208 0 1 1 0 416 208 208 0 1 1 0-416zm0 464A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-111 111-47-47c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l64 64c9.4 9.4 24.6 9.4 33.9 0L369 209z"/>
                </svg>
            </div>
            <div class="miafina">Valider un besoin
            </div>
        </div>
    </a>
        <div class="hr"></div>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/proformat">
            <div class="flex">
                <div class="icon">
                    <svg class="icones" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                        <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                        <path fill="#ffffff"
                              d="M64 0C28.7 0 0 28.7 0 64L0 448c0 35.3 28.7 64 64 64l256 0c35.3 0 64-28.7 64-64l0-288-128 0c-17.7 0-32-14.3-32-32L224 0 64 0zM256 0l0 128 128 0L256 0zM80 64l64 0c8.8 0 16 7.2 16 16s-7.2 16-16 16L80 96c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64l64 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-64 0c-8.8 0-16-7.2-16-16s7.2-16 16-16zm16 96l192 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32L96 352c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32zm0 32l0 64 192 0 0-64L96 256zM240 416l64 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-64 0c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/>
                    </svg>
                </div>
                <div class="miafina">Proformats
                </div>
            </div>
            <div class="hr"></div>
        </a><a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/bon-commande">
            <div class="flex">
                <div class="icon">
                    <svg class="icones" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                        <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                        <path fill="#ffffff"
                              d="M64 0C28.7 0 0 28.7 0 64L0 448c0 35.3 28.7 64 64 64l256 0c35.3 0 64-28.7 64-64l0-288-128 0c-17.7 0-32-14.3-32-32L224 0 64 0zM256 0l0 128 128 0L256 0zM80 64l64 0c8.8 0 16 7.2 16 16s-7.2 16-16 16L80 96c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64l64 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-64 0c-8.8 0-16-7.2-16-16s7.2-16 16-16zm16 96l192 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32L96 352c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32zm0 32l0 64 192 0 0-64L96 256zM240 416l64 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-64 0c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/>
                    </svg>
                </div>
                <div class="miafina">Bon de commande
                </div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/validation-bon-commande">
            <div class="flex">
                <div class="icon">
                    <svg class="icones" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#FFFFFF"><path d="M620-163 450-333l56-56 114 114 226-226 56 56-282 282Zm220-397h-80v-200h-80v120H280v-120h-80v560h240v80H200q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h167q11-35 43-57.5t70-22.5q40 0 71.5 22.5T594-840h166q33 0 56.5 23.5T840-760v200ZM480-760q17 0 28.5-11.5T520-800q0-17-11.5-28.5T480-840q-17 0-28.5 11.5T440-800q0 17 11.5 28.5T480-760Z"/></svg>
                </div>
                <div class="miafina">Valider un bon de commande
                </div>
            </div>
        </a>
        <div class="hr"></div>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/creation-bon-reception">
            <div class="flex">
                <div class="icon">
                    <svg class="icones" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                        <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                        <path fill="#ffffff"
                              d="M64 0C28.7 0 0 28.7 0 64L0 448c0 35.3 28.7 64 64 64l256 0c35.3 0 64-28.7 64-64l0-288-128 0c-17.7 0-32-14.3-32-32L224 0 64 0zM256 0l0 128 128 0L256 0zM80 64l64 0c8.8 0 16 7.2 16 16s-7.2 16-16 16L80 96c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64l64 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-64 0c-8.8 0-16-7.2-16-16s7.2-16 16-16zm16 96l192 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32L96 352c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32zm0 32l0 64 192 0 0-64L96 256zM240 416l64 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-64 0c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/>
                    </svg>
                </div>
                <div class="miafina">Creer bon de reception</div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/validation-facture">
            <div class="flex">
                <div class="icon">
                    <svg class="icones" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#FFFFFF"><path d="M620-163 450-333l56-56 114 114 226-226 56 56-282 282Zm220-397h-80v-200h-80v120H280v-120h-80v560h240v80H200q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h167q11-35 43-57.5t70-22.5q40 0 71.5 22.5T594-840h166q33 0 56.5 23.5T840-760v200ZM480-760q17 0 28.5-11.5T520-800q0-17-11.5-28.5T480-840q-17 0-28.5 11.5T440-800q0 17 11.5 28.5T480-760Z"/></svg>
                </div>
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
                        <label for="departement" class="block text-sm font-medium mb-2 dark:text-white">Departement:</label>
                        <select type="date" id="departement" name="centre"
                                class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
                            <%
                                for (Centre centre : centres) {
                            %>
                            <option value="<%=centre.getIdCentre()%>"><%=centre.getNom()%>
                            </option>
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
                                    for (Marchandise produit : produits) {
                                %>
                                <option value="<%=produit.getIdMarchandise()%>"><%=produit.getNom()%>
                                </option>
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