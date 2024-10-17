<%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 14/10/2024
  Time: 14:26
  To change this template use File | Settings | File Templates.
  ca: Comptabilité analytique
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.analytique.uniteOeuvre.UniteOeuvre" %>
<%@ page import="com.source.meuble.analytique.centre.Centre" %>
<%@ page import="com.source.meuble.analytique.typeRubrique.TypeRubrique" %>
<%@page pageEncoding="UTF-8" %>


<%
    List<UniteOeuvre> uos = ((List<UniteOeuvre>) request.getAttribute("uos"));
    List<Centre> centres = ((List<Centre>) request.getAttribute("centres"));
    List<TypeRubrique> trs = ((List<TypeRubrique>) request.getAttribute("trs"));
    List<Centre> cos = ((List<Centre>) request.getAttribute("cos"));
%>

<div class="sidebar bg-slate-600 transition-all duration-500">
    <div><a class="link hover:bg-slate-700 transition duration-300" href="#">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina" aria-haspopup="dialog" aria-expanded="false" aria-controls="centre-modal"
                    data-hs-overlay="#centre-modal">Centre
                </div>
            </div>
        </a><a class="link hover:bg-slate-700 transition duration-300" href="#">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina" aria-haspopup="dialog" aria-expanded="false" aria-controls="uo-modal"
                    data-hs-overlay="#uo-modal">Unité d'oeuvre
                </div>
            </div>
        </a><a class="link hover:bg-slate-700 transition duration-300" href="#">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina" aria-haspopup="dialog" aria-expanded="false" aria-controls="type-rubrique-modal"
                    data-hs-overlay="#type-rubrique-modal">Type rubrique
                </div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="#">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina" aria-haspopup="dialog" aria-expanded="false" aria-controls="rubrique-modal"
                    data-hs-overlay="#rubrique-modal">Rubrique
                </div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="#">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina" aria-haspopup="dialog" aria-expanded="false" aria-controls="sortie-modal"
                    data-hs-overlay="#sortie-modal">Sortie
                </div>
            </div>
        </a>
        <div class="hr"></div>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/table">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina">Tableau</div>
            </div>
        </a>
    </div>
</div>

<div class="relative z-1">
    <div id="centre-modal"
         class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] flex justify-center items-center overflow-x-hidden overflow-y-auto pointer-events-none"
         role="dialog" tabindex="-1" aria-labelledby="centre-modal-label">
        <div
            class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
            <div
                class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                    <h3 id="centre-modal-label" class="font-bold text-gray-800 dark:text-white">
                        Ajout de centre
                    </h3>
                    <button type="button"
                        class="size-8 inline-flex justify-center items-center gap-x-2 rounded-full border border-transparent bg-gray-100 text-gray-800 hover:bg-gray-200 focus:outline-none focus:bg-gray-200 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-700 dark:hover:bg-neutral-600 dark:text-neutral-400 dark:focus:bg-neutral-600"
                        aria-label="Close" data-hs-overlay="#centre-modal">
                        <span class="sr-only">Close</span>
                        <svg class="shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6 6 18"></path>
                            <path d="m6 6 12 12"></path>
                        </svg>
                    </button>
                </div>
                <form action="centre/save" method="POST">
                    <div class="p-4 overflow-y-auto">
                        <label for="nom-centre" class="block text-sm font-medium mb-2 dark:text-white">Nom:</label>
                        <input type="text" id="nom-centre" name="nom"
                            class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
                        <label for="" class="block text-sm font-medium my-2 dark:text-white">Catégorie:</label>
                        <div class="flex gap-x-12">
                            <div class="flex">
                                <input type="radio" name="categorie" value="1"
                                    class="shrink-0 mt-1 border-gray-500 rounded-full" id="centre-direct" checked="">
                                <label for="centre-direct"
                                    class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Direct
                                    (opérationnel)</label>
                            </div>

                            <div class="flex">
                                <input type="radio" name="categorie" value="0"
                                    class="shrink-0 mt-1 border-gray-500 rounded-full" id="centre-indirect">
                                <label for="centre-indirect"
                                    class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Indirect
                                    (structure)</label>
                            </div>
                        </div>
                    </div>
                    <div class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
                        <button type="button"
                            class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 focus:outline-none focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-800 dark:border-neutral-700 dark:text-white dark:hover:bg-neutral-700 dark:focus:bg-neutral-700"
                            data-hs-overlay="#centre-modal">
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

    <div id="uo-modal"
        class="hs-overlay hidden size-full fixed top-0 start-0 z-[80]  flex justify-center items-center overflow-x-hidden overflow-y-auto pointer-events-none"
        role="dialog" tabindex="-1" aria-labelledby="uo-modal-label">
        <div
            class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
            <div
                class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                    <h3 id="uo-modal-label" class="font-bold text-gray-800 dark:text-white">
                        Ajout d'unité d'oeuvre
                    </h3>
                    <button type="button"
                        class="size-8 inline-flex justify-center items-center gap-x-2 rounded-full border border-transparent bg-gray-100 text-gray-800 hover:bg-gray-200 focus:outline-none focus:bg-gray-200 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-700 dark:hover:bg-neutral-600 dark:text-neutral-400 dark:focus:bg-neutral-600"
                        aria-label="Close" data-hs-overlay="#uo-modal">
                        <span class="sr-only">Close</span>
                        <svg class="shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6 6 18"></path>
                            <path d="m6 6 12 12"></path>
                        </svg>
                    </button>
                </div>
                <form action="ue/save" method="POST">
                    <div class="p-4 overflow-y-auto">
                        <label for="nom-uo" class="block text-sm font-medium mb-2 dark:text-white">Nom:</label>
                        <input type="text" id="nom-uo" name="nom"
                            class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">

                    </div>
                    <div class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
                        <button type="button"
                            class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 focus:outline-none focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-800 dark:border-neutral-700 dark:text-white dark:hover:bg-neutral-700 dark:focus:bg-neutral-700"
                            data-hs-overlay="#uo-modal">
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

    <div id="type-rubrique-modal"
        class="hs-overlay hidden size-full fixed top-0 start-0 z-[80]  flex justify-center items-center overflow-x-hidden overflow-y-auto pointer-events-none"
        role="dialog" tabindex="-1" aria-labelledby="type-rubrique-modal-label">
        <div
            class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
            <div
                class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                    <h3 id="type-rubrique-modal-label" class="font-bold text-gray-800 dark:text-white">
                        Ajout d'une nouvelle rubrique
                    </h3>
                    <button type="button"
                        class="size-8 inline-flex justify-center items-center gap-x-2 rounded-full border border-transparent bg-gray-100 text-gray-800 hover:bg-gray-200 focus:outline-none focus:bg-gray-200 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-700 dark:hover:bg-neutral-600 dark:text-neutral-400 dark:focus:bg-neutral-600"
                        aria-label="Close" data-hs-overlay="#type-rubrique-modal">
                        <span class="sr-only">Close</span>
                        <svg class="shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6 6 18"></path>
                            <path d="m6 6 12 12"></path>
                        </svg>
                    </button>
                </div>
                <form action="tr/save" method="POST">
                    <div class="p-4 overflow-y-auto">
                        <label for="libelle-type-rubrique"
                            class="block text-sm font-medium mb-2 dark:text-white">Nom:</label>
                        <input type="text" id="libelle-type-rubrique" name="nom"
                            class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
                        <label for="uo-type-rubrique" class="block text-sm font-medium my-2 dark:text-white">Unité
                            d'oeuvre:</label>
                        <select id="uo-type-rubrique" name="uo"
                            class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
                            <% for (UniteOeuvre uo : uos) { %>
                                <option value="<%=uo.getIdUniteOeuvre()%>">
                                    <%=uo.getNom()%>
                                </option>
                                <% } %>
                        </select>
                        <label for="" class="block text-sm font-medium my-2 dark:text-white">Nature:</label>
                        <div class="flex gap-x-12">
                            <div class="flex">
                                <input type="radio" name="nature" value="0"
                                    class="shrink-0 mt-1 border-gray-500 rounded-full" id="type-rubrique-fixe"
                                    checked="">
                                <label for="type-rubrique-fixe"
                                    class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Fixe</label>
                            </div>

                            <div class="flex">
                                <input type="radio" name="nature" value="1"
                                    class="shrink-0 mt-1 border-gray-500 rounded-full" id="type-rubrique-variable">
                                <label for="type-rubrique-variable"
                                    class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Variable</label>
                            </div>
                        </div>
                        <label for="" class="block text-sm font-medium my-2 dark:text-white">Incorporabilité:</label>
                        <div class="flex gap-x-12">
                            <div class="flex">
                                <input type="radio" name="incorporabilite" value="1"
                                    class="shrink-0 mt-1 border-gray-500 rounded-full" id="type-rubrique-corporel"
                                    checked="">
                                <label for="type-rubrique-corporel"
                                    class="text-sm text-gray-900 ms-2 dark:text-neutral-400">incorporable</label>
                            </div>

                            <div class="flex">
                                <input type="radio" name="incorporabilite" value="0"
                                    class="shrink-0 mt-1 border-gray-500 rounded-full" id="type-rubrique-non-corporel">
                                <label for="type-rubrique-non-corporel"
                                    class="text-sm text-gray-900 ms-2 dark:text-neutral-400">non incorporable</label>
                            </div>

                            <%-- <div class="flex">--%>
                                <%-- <input type="radio" name="incorporabilite" value="2" --%>
                                    <%-- class="shrink-0 mt-1 border-gray-500 rounded-full" --%>
                                        <%-- id="type-rubrique-non-corporel">--%>
                                            <%-- <label for="type-rubrique-non-corporel" --%>
                                                <%-- class="text-sm text-gray-900 ms-2 dark:text-neutral-400">supplétive</label>--%>
                                                    <%-- </div>--%>
                        </div>
                        <div class="flex flex-col gap-x-12 gap-y-2">
                            <% for (Centre centre : centres) { %>
                                <div class="w-2/3 relative flex justify-evenly items-center mb-3">
                                    <div class="relative left-0 flex items-center">
                                        <input type="checkbox" name=""
                                            class="ckeckbox shrink-0 mt-1 border-gray-500 rounded-full"
                                            id="centre<%=centre.getIdCentre()%>-cb" checked="">
                                        <label for="centre<%=centre.getIdCentre()%>-cb"
                                            class="text-sm text-gray-900 ms-2 dark:text-neutral-400">
                                            <%=centre.getNom()%>
                                        </label>
                                    </div>
                                    <div class="percentage relative right-0 flex justify-end items-center">
                                        <input type="hidden" name="centre[]" value="<%=centre.getIdCentre()%>" />
                                        <input type="number" value="0" name="pourcentage[]"
                                            class="py-3 px-3 block w-2/6 border border-gray-500 rounded-lg text-sm"
                                            id="centre<%=centre.getIdCentre()%>-cb">
                                        <label for="centre<%=centre.getIdCentre()%>-cb"
                                            class="text-sm text-gray-900 ms-2 dark:text-neutral-400">%</label>
                                    </div>
                                </div>
                                <% } %>

                        </div>
                        <div
                            class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
                            <button type="button"
                                class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 focus:outline-none focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-800 dark:border-neutral-700 dark:text-white dark:hover:bg-neutral-700 dark:focus:bg-neutral-700"
                                data-hs-overlay="#type-rubrique-modal">
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

    <div id="rubrique-modal"
        class="hs-overlay hidden size-full fixed top-0 start-0 z-[80]  flex justify-center items-center overflow-x-hidden overflow-y-auto pointer-events-none"
        role="dialog" tabindex="-1" aria-labelledby="rubrique-modal-label">
        <div
            class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
            <div
                class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                    <h3 id="rubrique-modal-label" class="font-bold text-gray-800 dark:text-white">
                        Config rubrique
                    </h3>
                    <button type="button"
                        class="size-8 inline-flex justify-center items-center gap-x-2 rounded-full border border-transparent bg-gray-100 text-gray-800 hover:bg-gray-200 focus:outline-none focus:bg-gray-200 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-700 dark:hover:bg-neutral-600 dark:text-neutral-400 dark:focus:bg-neutral-600"
                        aria-label="Close" data-hs-overlay="#rubrique-modal">
                        <span class="sr-only">Close</span>
                        <svg class="shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6 6 18"></path>
                            <path d="m6 6 12 12"></path>
                        </svg>
                    </button>
                </div>
                <form action="/rubrique/save" method="POST">
                    <div class="p-4 overflow-y-auto">
                        <label for="type-rubrique" class="block text-sm font-medium mb-2 dark:text-white">Type
                            rubrique:</label>
                        <select id="type-rubrique" name="tr"
                            class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
                            <% for (TypeRubrique tr : trs) { %>
                                <option value="<%=tr.getId()%>">
                                    <%=tr.getLibelle()%> (<%=tr.getIdUniteOeuvre().getNom()%>)
                                </option>
                                <% } %>
                        </select>
                        <div class="flex items-center justify-center py-3 gap-2">
                            <label for="prix-unitaire-rubrique"
                                class="block text-sm font-medium mb-2 dark:text-white">Prix
                                unitaire:</label>
                            <input type="number" id="prix-unitaire-rubrique" name="pu"
                                class="py-3 px-4 block w-2/3 border border-gray-500 rounded-lg text-sm">
                            <label for="quantite-rubrique"
                                class="block text-sm font-medium mb-2 dark:text-white">Quantité:</label>
                            <input type="number" id="quantite-rubrique" name="qte"
                                class="py-3 px-4 block w-1/3 border border-gray-500 rounded-lg text-sm">
                        </div>
                        <label for="date-achat-rubrique" class="block text-sm font-medium mb-2 dark:text-white">Date
                            d'achat:</label>
                        <input type="date" id="date-achat-rubrique"
                            class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
                    </div>
                    <div class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
                        <button type="button"
                            class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 focus:outline-none focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-800 dark:border-neutral-700 dark:text-white dark:hover:bg-neutral-700 dark:focus:bg-neutral-700"
                            data-hs-overlay="#rubrique-modal">
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

    <div id="sortie-modal"
        class="hs-overlay hidden size-full fixed top-0 start-0 z-[80]  flex justify-center items-center overflow-x-hidden overflow-y-auto pointer-events-none"
        role="dialog" tabindex="-1" aria-labelledby="sortie-modal-label">
        <div
            class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
            <div
                class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                    <h3 id="sortie-modal-label" class="font-bold text-gray-800 dark:text-white">
                        Sortie
                    </h3>
                    <button type="button"
                        class="size-8 inline-flex justify-center items-center gap-x-2 rounded-full border border-transparent bg-gray-100 text-gray-800 hover:bg-gray-200 focus:outline-none focus:bg-gray-200 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-700 dark:hover:bg-neutral-600 dark:text-neutral-400 dark:focus:bg-neutral-600"
                        aria-label="Close" data-hs-overlay="#sortie-modal">
                        <span class="sr-only">Close</span>
                        <svg class="shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6 6 18"></path>
                            <path d="m6 6 12 12"></path>
                        </svg>
                    </button>
                </div>

                <form action="home/table/sortie" method="GET">
                    <div class="p-4 overflow-y-auto">
                        <div class="flex items-center">
                            <label for="sortie-libelle"
                                class="block text-sm font-medium mb-2 dark:text-white">Libelle:</label>
                            <input type="text" id="sortie-libelle" name="libelle"
                                class="py-3 px-4 block w-1/3 border border-gray-500 rounded-lg text-sm">
                        </div>

                        <div class="flex items-center">
                            <label for="pv-libelle" class="block text-sm font-medium mb-2 dark:text-white">Prix de
                                Vente:</label>
                            <input type="number" id="pv-libelle" name="pv" step="0.01"
                                class="py-3 px-4 block w-1/3 border border-gray-500 rounded-lg text-sm">
                        </div>

                        <div class="flex items-center justify-center py-3 gap-2">

                            <label for="unite-oeuvre-sortie"
                                class="block text-sm font-medium mb-2 dark:text-white">Unite
                                d'oeuvre:</label>
                            <select id="unite-oeuvre-sortie" name="uo"
                                class="py-3 px-4 block w-2/3 border border-gray-500 rounded-lg text-sm">
                                <% for (UniteOeuvre uo : uos) { %>
                                    <option value="<%=uo.getIdUniteOeuvre()%>">
                                        <%=uo.getNom()%>
                                    </option>
                                    <% } %>
                            </select>
                            <label for="quantite-sortie" class="block text-sm font-medium mb-2 dark:text-white">Quantité
                                produite:</label>
                            <input type="number" id="quantite-sortie" name="qte"
                                class="py-3 px-4 block w-1/3 border border-gray-500 rounded-lg text-sm">
                        </div>
                        <label class="block text-sm font-medium mb-2 dark:text-white">Centre:</label>
                        <% for (Centre centre : cos) { %>
                            <input type="checkbox" name="centre[]"
                                class="ckeckbox shrink-0 mt-1 border-gray-500 rounded-full"
                                id="centre-sortie<%=centre.getIdCentre()%>" value="<%=centre.getIdCentre()%>">
                            <label for="centre-sortie<%=centre.getIdCentre()%>"
                                class="text-sm text-gray-900 ms-2 dark:text-neutral-400">
                                <%=centre.getNom()%>
                            </label>
                            <% } %>
                    </div>
                    <div class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
                        <button type="button"
                            class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 focus:outline-none focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-800 dark:border-neutral-700 dark:text-white dark:hover:bg-neutral-700 dark:focus:bg-neutral-700"
                            data-hs-overlay="#sortie-modal">
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