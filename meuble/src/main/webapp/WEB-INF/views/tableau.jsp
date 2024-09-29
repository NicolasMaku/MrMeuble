<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.analytique.uniteOeuvre.UniteOeuvre" %>
<%@ page import="com.source.meuble.analytique.centre.Centre" %>
<%@ page import="com.source.meuble.analytique.typeRubrique.TypeRubrique" %>
<%@ page import="com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueRow" %>
<%@ page import="com.source.meuble.util.RequestAttribute" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.source.meuble.analytique.listeAnalytique.RepartitionCentre" %>
<%@ page import="com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueTableau" %>
<%@page pageEncoding="UTF-8" %>

<%
    RequestAttribute requestAttribute = new RequestAttribute(request);
    List<UniteOeuvre> uos = ((List<UniteOeuvre>) request.getAttribute("uos"));
    List<Centre> centres = ((List<Centre>) request.getAttribute("centres"));
    List<TypeRubrique> trs = ((List<TypeRubrique>) request.getAttribute("trs"));
    ListeAnalytiqueTableau tableau = requestAttribute.getObject("tableau", ListeAnalytiqueTableau.class, new ListeAnalytiqueTableau(new ListeAnalytiqueRow[0]));
    ListeAnalytiqueRow[] lars = tableau.getTableau();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/output.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <title>Document</title>
</head>

<body>
    <svg class="bgs absolute z-0" id="eBWIyf7iGnv1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2560 1000" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" project-id="8a736d06e89d453488ae787ec2786625" export-id="94e49368974348cba6ad2bb61150d0c3" cached="false"><defs><linearGradient id="eBWIyf7iGnv2-fill" x1="0.458994" y1="1.017456" x2="0.458994" y2="0.281312" spreadMethod="pad" gradientUnits="objectBoundingBox" gradientTransform="translate(0 0)"><stop id="eBWIyf7iGnv2-fill-0" offset="0%" stop-color="#f3f7f9"/><stop id="eBWIyf7iGnv2-fill-1" offset="0%" stop-color="#fff"/><stop id="eBWIyf7iGnv2-fill-2" offset="40.3228%" stop-color="#fcfdfd"/><stop id="eBWIyf7iGnv2-fill-3" offset="65.8394%" stop-color="#f2f6f8"/><stop id="eBWIyf7iGnv2-fill-4" offset="100%" stop-color="#dee9ee"/></linearGradient></defs><path d="M285.85945,66.35304v1307.293918q256.195996,66.35304,591.661108,0c0-37.450621,0-124.835403,0-124.835403l-8.803025-267.242946c0-131.791043-64.761322-319.916369-96.833279-380.729676C667.799942,358.74226,454.54609,-269.841303,285.85945,66.35304" transform="matrix(1 0 0 0.784513-285.85945 79.243451)" fill="url(#eBWIyf7iGnv2-fill)" stroke-width="5.12"/></svg>


    <svg class="bgs absolute z-0" id="eRYNvC8mAPq1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2560 1000" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" project-id="8a736d06e89d453488ae787ec2786625" export-id="2dc69a17fd054190aba0f72fd98ed3df" cached="false"><defs><linearGradient id="eRYNvC8mAPq2-fill" x1="0.458994" y1="1.017456" x2="0.458994" y2="0.281312" spreadMethod="pad" gradientUnits="objectBoundingBox" gradientTransform="translate(0 0)"><stop id="eRYNvC8mAPq2-fill-0" offset="0%" stop-color="#f3f7f9"/><stop id="eRYNvC8mAPq2-fill-1" offset="0%" stop-color="#fff"/><stop id="eRYNvC8mAPq2-fill-2" offset="40.3228%" stop-color="#fcfdfd"/><stop id="eRYNvC8mAPq2-fill-3" offset="65.8394%" stop-color="#f2f6f8"/><stop id="eRYNvC8mAPq2-fill-4" offset="100%" stop-color="#dee9ee"/></linearGradient></defs><path d="M285.85945,66.35304v1307.293918q256.195996,66.35304,591.661108,0c0-37.450621,0-124.835403,0-124.835403l-8.803025-267.242946c0-131.791043-64.761322-319.916369-96.833279-380.729676C667.799942,358.74226,454.54609,-269.841303,285.85945,66.35304" transform="matrix(-1 0 0 0.784513 2845.859449 88.94811)" fill="url(#eRYNvC8mAPq2-fill)" stroke-width="5.12"/></svg>

    <div class="relative z-3 flex items-center justify-center">
        <nav class="relative navbar w-3/6 h-16 flex justify-around border-b-2">
            <div class="absolute left-0 h-[100%] flex items-center justify-center">
                <span class="font-bold"><a href="">Mr. Meuble</a></span>
            </div>
            <div class="absolute right-0 h-[100%] flex items-center justify-center">
                <ul class="flex items-center justify-center gap-10">
                    <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="centre-modal" data-hs-overlay="#centre-modal">Centre</li>
                    <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="uo-modal" data-hs-overlay="#uo-modal">Unité d'oeuvre</li>
                    <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="type-rubrique-modal" data-hs-overlay="#type-rubrique-modal">Type rubrique</li>
                    <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="rubrique-modal" data-hs-overlay="#rubrique-modal">Rubrique</li>
                    <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="sortie-modal" data-hs-overlay="#sortie-modal">Sortie</li>
                </ul>
            </div>
        </nav>
    </div>

    <button class="absolute top-10 left-20 p-2 px-3 rounded-3xl text-gray-50 bg-slate-500" id="generate">Generer PDF</button>
    <div
        class="overflow-x-auto m-8 bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-10">
        <div class="table-container relative max-h-[75dvh] overflow-y-auto">
            <table class="table table-xs" id="table">
                <thead>
                    <tr>
                        <th class="text-black" rowspan="2">RUBRIQUES</th>
                        <th class="text-black text-center border border-r-black border-transparent" rowspan="2">TOTAL
                        </th>
                        <th class="text-black text-center" rowspan="2">UNITÉ D'OEUVRE</th>
                        <th class="text-black text-center" rowspan="2">NATURE</th>
                        <%
                            for(Centre centre: centres)
                            {
                        %>

                        <th class="text-black text-center border border-black border-t-transparent" colspan="3">
                            <%=centre.getNom()%>
                        </th>
                        <%
                            }
                        %>

                        <th class="text-black text-center border border-black border-t-transparent border-r-transparent"
                            colspan="3">TOTAL</th>
                    </tr>
                    <tr>
                        <%
                            for(int i = 0; i < centres.size(); i++)
                            {
                        %>
                            <th class="text-black text-center border border-l-black border-transparent">%</th>
                            <th class="text-black text-center">FIXE</th>
                            <th class="text-black text-center">VARIABLE</th>
                        <%
                            }
                        %>
                        <th class="text-black text-center border border-l-black border-transparent">%</th>
                        <th class="text-black text-center border border-l-black border-transparent">FIXE</th>
                        <th class="text-black text-center">VARIABLE</th>
<%--                        <th class="text-black text-center border border-l-black border-transparent">%</th>--%>
<%--                        <th class="text-black text-center">FIXE</th>--%>
<%--                        <th class="text-black text-center">VARIABLE</th>--%>
<%--                        <th class="text-black text-center border border-l-black border-transparent w-[1px]"></th>--%>
<%--                        <th class="text-black text-center">FIXE</th>--%>
<%--                        <th class="text-black text-center">VARIABLE</th>--%>
                    </tr>
                </thead>
                <tbody class="overflow-y-scroll">
                <%
                    for(ListeAnalytiqueRow row: lars)
                    {
                %>
                    <tr>
                        <td><%=row.getRubrique()%></td>
                        <td class="number text-right border border-r-black border-transparent"><%=row.getTotal()%></td>
                        <td class="text-center"><%=row.getUniteOeuvre()%></td>
                        <td class="text-center"><%=row.getNature().substring(0, 1).toUpperCase()%></td>

                        <%
                            for(Centre centre: centres)
                            {
                                RepartitionCentre rc = row.getRepartition().get(centre.getIdCentre());
                        %>
                        <td class="text-center border border-l-black border-transparent"><%=rc != null ? rc.getPourcentage() + "%" : "-"%></td>
                        <td class="number text-center"><%=rc != null ? rc.getFixeStr(): "-"%></td>
                        <td class="number text-center"><%=rc != null ? rc.getVariableStr() : "-"%></td>
                        <%
                            }
                        %>


                        <td class="text-center border border-l-black border-transparent">100.00%</td>
                        <td class="number text-center "><%=row.getTotalFixe()%></td>
                        <td class="number text-center"><%=row.getTotalVariable()%></td>
<%--                        <td class="text-center border border-l-black border-transparent">100%</td>--%>
<%--                        <td class="number text-center">-</td>--%>
<%--                        <td class="number text-center">4321600</td>--%>
<%--                        <td class="text-center border border-l-black w-[1px] border-transparent"></td>--%>
<%--                        <td class="number text-center">-</td>--%>
<%--                        <td class="number text-center">4321600</td>--%>
                    </tr>
                <%
                    }
                %>
                </tbody>
                <tfoot>
                    <tr>
                        <th class="text-black border border-r-black border-b-black" colspan="2"></th>
                        <th class="text-black border border-black border-t-transparent" colspan="2"></th>
                        <%
                            for(Centre centre: centres)
                            {
                                Double fixe = tableau.getTotalFixeParCentre().get(centre.getIdCentre());
                                Double variable = tableau.getTotalVariableParCentre().get(centre.getIdCentre());
                        %>
                        <th class="text-black text-right border border-black"></th>
                        <th class="number text-black text-right border border-black"><%=fixe != null ? fixe : "0.00"%></th>
                        <th class="number text-black text-right border border-black"><%=variable != null ? variable : "0.00"%></th>

                        <%
                            }
                        %>
                        <th class="number text-black text-right border border-black"></th>
                        <th class="number text-black text-right border border-black"><%=tableau.getTotalFixe()%></th>
                        <th class="number text-black text-right border border-black"><%=tableau.getTotalVariable()%></th>
<%--                        <th class="number text-black text-right border border-black"></th>--%>
<%--                        <th class="number text-black text-right border border-black">5487956</th>--%>
<%--                        <th class="number text-black text-right border border-black">97996146</th>--%>
<%--                        <th class="number text-black text-right border border-black border-r-transparent"></th>--%>
<%--                        <th class="number text-black text-right border border-black"></th>--%>
<%--                        <th class="number text-black text-right border border-black"></th>--%>
                    </tr>
                    <tr>
                        <th class="text-black">TOTAL</th>
                        <th class="number text-black text-right border border-r-black border-transparent"><%=tableau.getGrandTotal()%></th>
                        <th class="number text-black text-right" colspan="2"></th>
                        <%
                            for (Centre centre: centres)
                            {
                                Double totalParCentre = tableau.getTotalParCentre().get(centre.getIdCentre());
                        %>
                        <th class="number text-black text-right border border-black border-b-transparent" colspan="3">
                            <%=totalParCentre != null ? totalParCentre : "0.00"%>
                        </th>
                        <%
                            }
                        %>
                        <th class="number text-black text-right border border-black border-b-transparent" colspan="3">
                            <%=tableau.getGrandTotal()%>
                        </th>
<%--                        <th class="number text-black text-right border border-black border-b-transparent" colspan="1">--%>
<%--                            225770320.00</th>--%>
<%--                        <th class="number text-black text-right border border-t-black border-transparent"></th>--%>
<%--                        <th class="number text-black text-right">179815100.00</th>--%>
<%--                        <th class="number text-black text-right border border-black border-b-transparent border-r-transparent">--%>
<%--                            367585800.00</th>--%>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <div class="relative z-1">
        <div id="centre-modal"
             class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] overflow-x-hidden overflow-y-auto pointer-events-none"
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
                                           class="shrink-0 mt-1 border-gray-500 rounded-full" id="centre-direct"
                                           checked="">
                                    <label for="centre-direct"
                                           class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Direct</label>
                                </div>

                                <div class="flex">
                                    <input type="radio" name="categorie" value="0"
                                           class="shrink-0 mt-1 border-gray-500 rounded-full" id="centre-indirect">
                                    <label for="centre-indirect"
                                           class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Indirect</label>
                                </div>
                            </div>
                        </div>
                        <div
                                class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
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
             class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] overflow-x-hidden overflow-y-auto pointer-events-none"
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
                        <div
                                class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
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
             class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] overflow-x-hidden overflow-y-auto pointer-events-none"
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
                            <label for="uo-type-rubrique"
                                   class="block text-sm font-medium my-2 dark:text-white">Unité d'oeuvre:</label>
                            <select name="uo-type-rubrique" id="uo-type-rubrique" name="uo"
                                    class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm"
                            >
                                <%
                                    for(UniteOeuvre uo : uos)
                                    {
                                %>
                                <option value="<%=uo.getIdUniteOeuvre()%>"><%=uo.getNom()%></option>
                                <%
                                    }
                                %>
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
                            <label for=""
                                   class="block text-sm font-medium my-2 dark:text-white">Incorporabilité:</label>
                            <div class="flex gap-x-12">
                                <div class="flex">
                                    <input type="radio" name="incorporabilite" value="1"
                                           class="shrink-0 mt-1 border-gray-500 rounded-full" id="type-rubrique-corporel"
                                           checked="">
                                    <label for="type-rubrique-corporel"
                                           class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Corporel</label>
                                </div>

                                <div class="flex">
                                    <input type="radio" name="incorporabilite" value="0"
                                           class="shrink-0 mt-1 border-gray-500 rounded-full"
                                           id="type-rubrique-non-corporel">
                                    <label for="type-rubrique-non-corporel"
                                           class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Non corporel</label>
                                </div>
                            </div>
                        </div>
                        <div
                                class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
                            <button type="button"
                                    class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 focus:outline-none focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-800 dark:border-neutral-700 dark:text-white dark:hover:bg-neutral-700 dark:focus:bg-neutral-700"
                                    data-hs-overlay="#type-rubrique-modal">
                                Fermer
                            </button>
                            <button type="button"
                                    class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-transparent bg-gray-600 text-white hover:bg-gray-700 focus:outline-none focus:bg-gray-700 disabled:opacity-50 disabled:pointer-events-none" aria-haspopup="dialog" aria-expanded="false" aria-controls="imputation-modal" data-hs-overlay="#imputation-modal">
                                Valider
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div id="imputation-modal"
             class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] overflow-x-hidden overflow-y-auto pointer-events-none"
             role="dialog" tabindex="-1" aria-labelledby="imputation-modal-label">
            <div
                    class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
                <div
                        class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                    <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                        <h3 id="imputation-modal-label" class="font-bold text-gray-800 dark:text-white">
                            Config imputation
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
                    <form action="#">
                        <div class="p-4 overflow-y-auto">
                            <label for="" class="block text-sm font-medium my-2 dark:text-white">Pourcentage par centre:</label>
                            <div class="flex flex-col gap-x-12 gap-y-2">
                                <%
                                    for(Centre centre: centres)
                                    {
                                %>
                                <div class="w-2/3 relative flex justify-evenly items-center mb-3">
                                    <div class="relative left-0 flex items-center">
                                        <input type="checkbox" name=""
                                               class="ckeckbox shrink-0 mt-1 border-gray-500 rounded-full" id="centre<%=centre.getIdCentre()%>-cb"
                                               checked="">
                                        <label for="centre<%=centre.getIdCentre()%>-cb"
                                               class="text-sm text-gray-900 ms-2 dark:text-neutral-400"><%=centre.getNom()%></label>
                                    </div>
                                    <div class="percentage relative right-0 flex justify-end items-center">
                                        <input type="number" name=""
                                               class="py-3 px-3 block w-2/6 border border-gray-500 rounded-lg text-sm" id="centre<%=centre.getIdCentre()%>-cb">
                                        <label for="centre<%=centre.getIdCentre()%>-cb"
                                               class="text-sm text-gray-900 ms-2 dark:text-neutral-400">%</label>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                                <%--                                <div class="w-2/3 relative flex justify-evenly items-center my-3">--%>
                                <%--                                    <div class="relative left-0 flex items-center">--%>
                                <%--                                        <input type="checkbox" name=""--%>
                                <%--                                            class="checkbox shrink-0 mt-1 border-gray-500 rounded-full" id="adm"--%>
                                <%--                                            checked="">--%>
                                <%--                                        <label for="adm"--%>
                                <%--                                            class="text-sm text-gray-900 ms-2 dark:text-neutral-400">ADM/DIST</label>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="percentage relative right-0 flex justify-end items-center">--%>
                                <%--                                        <input type="number" name=""--%>
                                <%--                                        class="py-3 px-3 block w-2/6 border border-gray-500 rounded-lg text-sm" id="adm-perc">--%>
                                <%--                                        <label for="adm-perc"--%>
                                <%--                                        class="text-sm text-gray-900 ms-2 dark:text-neutral-400">%</label>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>

                            </div>
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
             class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] overflow-x-hidden overflow-y-auto pointer-events-none"
             role="dialog" tabindex="-1" aria-labelledby="rubrique-modal-label">
            <div
                    class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
                <div
                        class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                    <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                        <h3 id="type-rubrique-modal-label" class="font-bold text-gray-800 dark:text-white">
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
                            <label for="type-rubrique"
                                   class="block text-sm font-medium mb-2 dark:text-white">Type rubrique:</label>
                            <select id="type-rubrique" name="tr"
                                    class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm"
                            >
                                <%
                                    for(TypeRubrique tr: trs)
                                    {
                                %>
                                <option value="<%=tr.getId()%>"><%=tr.getLibelle()%> (<%=tr.getIdUniteOeuvre().getNom()%>)</option>
                                <%
                                    }
                                %>
                            </select>
                            <div class="flex items-center justify-center py-3 gap-2">
                                <label for="prix-unitaire-rubrique" class="block text-sm font-medium mb-2 dark:text-white">Prix unitaire:</label>
                                <input type="number" id="prix-unitaire-rubrique" name="pu"
                                       class="py-3 px-4 block w-2/3 border border-gray-500 rounded-lg text-sm">
                                <label for="quantite-rubrique" class="block text-sm font-medium mb-2 dark:text-white">Quantité:</label>
                                <input type="number" id="quantite-rubrique" name="qte"
                                       class="py-3 px-4 block w-1/3 border border-gray-500 rounded-lg text-sm">
                            </div>
                            <label for="date-achat-rubrique" class="block text-sm font-medium mb-2 dark:text-white">Date d'achat:</label>
                            <input type="date" id="date-achat-rubrique"
                                   class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">
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

        <div id="sortie-modal"
             class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] overflow-x-hidden overflow-y-auto pointer-events-none"
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
                    <form action="" method="POST">
                        <div class="p-4 overflow-y-auto">
                            <div class="flex items-center justify-center py-3 gap-2">
                                <label for="unite-oeuvre-sortie" class="block text-sm font-medium mb-2 dark:text-white">Unite d'oeuvre:</label>
                                <select id="unite-oeuvre-sortie" name="tr"
                                        class="py-3 px-4 block w-2/3 border border-gray-500 rounded-lg text-sm"
                                >
                                    <%
                                        for(TypeRubrique tr: trs)
                                        {
                                    %>
                                    <option value="<%=tr.getId()%>"><%=tr.getLibelle()%> (<%=tr.getIdUniteOeuvre().getNom()%>)</option>
                                    <%
                                        }
                                    %>
                                </select>
                                <label for="quantite-sortie" class="block text-sm font-medium mb-2 dark:text-white">Quantité produite:</label>
                                <input type="number" id="quantite-sortie" name="qte"
                                       class="py-3 px-4 block w-1/3 border border-gray-500 rounded-lg text-sm">
                            </div>
                            <label class="block text-sm font-medium mb-2 dark:text-white">Centre:</label>
                            <input type="checkbox" name=""
                                   class="ckeckbox shrink-0 mt-1 border-gray-500 rounded-full" id="centre-sortie"
                                   checked="">
                            <label for="centre-sortie"
                                   class="text-sm text-gray-900 ms-2 dark:text-neutral-400">ADM</label>
                        </div>
                        <div
                                class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
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


        <script src="/assets/js/tableToPdf.js"></script>
        <script src="/node_modules/preline/dist/preline.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.21/jspdf.plugin.autotable.min.js"></script>

</body>

</html>