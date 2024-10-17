<%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 14/10/2024
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.analytique.uniteOeuvre.UniteOeuvre" %>
<%@ page import="com.source.meuble.analytique.centre.Centre" %>
<%@ page import="com.source.meuble.analytique.typeRubrique.TypeRubrique" %>
<%@page pageEncoding="UTF-8" %>

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
            <div class="miafina">Validation besoin
            </div>
        </div>
    </a><a class="link hover:bg-slate-700 transition duration-300" href="#">
        <div class="flex" aria-haspopup="dialog" aria-expanded="false" aria-controls="bon-commande-modal"
             data-hs-overlay="#bon-commande-modal">
            <div class="icon"></div>
            <div class="miafina" >Créer bon de commande
            </div>
        </div>
    </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/achat/bon-commande">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina" >Bon de commande
                </div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="#">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina" >Valider bon de commande
                </div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/table">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina">Creer bon de reception</div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/home/table">
            <div class="flex">
                <div class="icon"></div>
                <div class="miafina">Valider facture</div>
            </div>
        </a>
    </div>
</div>

<div class="relative z-1">
    <div id="besoin-modal"
         class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] flex justify-center items-center overflow-x-hidden overflow-y-auto pointer-events-none"
         role="dialog" tabindex="-1" aria-labelledby="besoin-modal-label">
        <div
                class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
            <div
                    class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                    <h3 id="besoin-modal-label" class="font-bold text-gray-800 dark:text-white">
                        Insertion besoin
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
                <form action="" method="POST">
                    <div class="p-4 overflow-y-auto">
                        <div class="flex items-center justify-center py-3 gap-2">
                            <label for="produit-besoin"
                                   class="block text-sm font-medium mb-2 dark:text-white">Produit:</label>
                            <select id="produit-besoin" name="produit-besoin"
                                    class="py-3 px-4 block w-2/3 border border-gray-500 rounded-lg text-sm">
                            </select>
                            <label for="quantite-besoin" class="block text-sm font-medium mb-2 dark:text-white">Quantité:</label>
                            <input type="number" id="quantite-besoin" name="qte"
                                   class="py-3 px-4 block w-1/3 border border-gray-500 rounded-lg text-sm">
                        </div>
                        <label for="date-besoin" class="block text-sm font-medium mb-2 dark:text-white">Date besoin:</label>
                        <input type="date" id="date-besoin" name="besoin"
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

    <div id="bon-commande-modal"
         class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] flex justify-center items-center overflow-x-hidden overflow-y-auto pointer-events-none"
         role="dialog" tabindex="-1" aria-labelledby="bon-commande-modal-label">
        <div
                class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
            <div
                    class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                    <h3 id="bon-commande-modal-label" class="font-bold text-gray-800 dark:text-white">
                        Creation de bon de commande
                    </h3>
                    <button type="button"
                            class="size-8 inline-flex justify-center items-center gap-x-2 rounded-full border border-transparent bg-gray-100 text-gray-800 hover:bg-gray-200 focus:outline-none focus:bg-gray-200 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-700 dark:hover:bg-neutral-600 dark:text-neutral-400 dark:focus:bg-neutral-600"
                            aria-label="Close" data-hs-overlay="#bon-commande-modal">
                        <span class="sr-only">Close</span>
                        <svg class="shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6 6 18"></path>
                            <path d="m6 6 12 12"></path>
                        </svg>
                    </button>
                </div>
                <form action="" method="POST">
                    <div class="p-4 overflow-y-auto">
                        <div class="pb-3">
                            <label for="fournisseur-bc"
                                   class="block text-sm font-medium mb-2 dark:text-white">Fournisseur:</label>
                            <select id="fournisseur-bc" name="produit-besoin"
                                    class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
                            </select>
                        </div>
                        <div class="flex items-center justify-center py-3 gap-2">
                            <label for="produit-bc"
                                   class="block text-sm font-medium mb-2 dark:text-white">Produit:</label>
                            <select id="produit-bc" name="produit-bc"
                                    class="py-3 px-4 block w-2/3 border border-gray-500 rounded-lg text-sm">
                            </select>
                            <label for="quantite-bc" class="block text-sm font-medium mb-2 dark:text-white">Quantité:</label>
                            <input type="number" id="quantite-bc" name="qte"
                                   class="py-3 px-4 block w-1/3 border border-gray-500 rounded-lg text-sm">
                        </div>
                    </div>
                    <div class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
                        <button type="button"
                                class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 focus:outline-none focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-800 dark:border-neutral-700 dark:text-white dark:hover:bg-neutral-700 dark:focus:bg-neutral-700"
                                data-hs-overlay="#bon-commande-modal">
                            Fermer
                        </button>
                        <button type="submit"
                                class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-transparent bg-gray-600 text-white hover:bg-gray-700 focus:outline-none focus:bg-gray-700 disabled:opacity-50 disabled:pointer-events-none">
                            Ajouter
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>