<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.analytique.exercice.Exercice" %><%
    List<Exercice> exercices = ((List<Exercice>) request.getAttribute("exercices"));
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/output.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <title>Exercice</title>
</head>
<body>
    <div class="bg-[#DEE9EE] w-full h-dvh flex justify-center items-center">
        <div class="bg-white py-3 px-3 w-1/3 rounded-xl shadow-lg">
            <div class="text-center font-bold text-gray-700 text-3xl pt-2 pb-8">
                <h1>Choix ou ajout d'exercice</h1>
            </div>
            <form action="exercice/set" method="POST">
                <div class="flex justify-evenly items-center">
                    <select class="w-[60%] border h-8 border-zinc-300 rounded-md" name="exercice" id="">
                        <%
                            for(Exercice exercice : exercices)
                            {
                        %>
                        <option value="<%=exercice.getId()%>"><%=exercice.getAnnee()%></option>
                        <%
                            }
                        %>
                    </select>
                    <div class="cursor-pointer w-[12%] h-8 flex justify-center items-center" aria-haspopup="dialog"
                        aria-expanded="false" aria-controls="exercice-modal" data-hs-overlay="#exercice-modal">
                        <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px"
                            fill="#5f6368">
                            <path
                                d="M440-280h80v-160h160v-80H520v-160h-80v160H280v80h160v160Zm40 200q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z" />
                        </svg>
                    </div>
                </div>
                <button
                    class="mx-auto mt-2 flex h-[unset] text-slate-100 w-[80%] items-center justify-center rounded-lg px-2 py-2 text-sm font-medium bg-slate-500 focus:bg-slate-700 hover:bg-slate-700 transition-all duration-300"
                    type="submit">Valider</button>
            </form>
        </div>
    </div>
    <div id="exercice-modal"
        class="hs-overlay hidden size-full fixed top-0 start-0 z-[80] overflow-x-hidden overflow-y-auto pointer-events-none"
        role="dialog" tabindex="-1" aria-labelledby="exercice-modal-label">
        <div
            class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto min-h-[calc(100%-3.5rem)] flex items-center">
            <div
                class="w-full flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-neutral-800 dark:border-neutral-700 dark:shadow-neutral-700/70">
                <div class="flex justify-between items-center py-3 px-4 border-b dark:border-neutral-700">
                    <h3 id="exercice-modal-label" class="font-bold text-gray-800 dark:text-white">
                        Ajout d'un exercice
                    </h3>
                    <button type="button"
                        class="size-8 inline-flex justify-center items-center gap-x-2 rounded-full border border-transparent bg-gray-100 text-gray-800 hover:bg-gray-200 focus:outline-none focus:bg-gray-200 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-700 dark:hover:bg-neutral-600 dark:text-neutral-400 dark:focus:bg-neutral-600"
                        aria-label="Close" data-hs-overlay="#exercice-modal">
                        <span class="sr-only">Close</span>
                        <svg class="shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6 6 18"></path>
                            <path d="m6 6 12 12"></path>
                        </svg>
                    </button>
                </div>
                <form action="exercice/add" method="POST">
                    <div class="p-4 overflow-y-auto">
                        <label for="date-exercice" class="block text-sm font-medium mb-2 dark:text-white">Date:</label>
                        <input type="date" id="date-exercice" name="dateDebut"
                            class="py-3 px-4 block w-full border border-gray-500 rounded-lg text-sm">

                    </div>
                    <div class="flex justify-center items-center gap-x-2 py-3 px-4 border-t dark:border-neutral-700">
                        <button type="button"
                            class="w-2/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 focus:outline-none focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-800 dark:border-neutral-700 dark:text-white dark:hover:bg-neutral-700 dark:focus:bg-neutral-700"
                            data-hs-overlay="#exercice-modal">
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
    <script src="./node_modules/preline/dist/preline.js"></script>
</body>
</html>