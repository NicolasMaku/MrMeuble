<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.analytique.uniteOeuvre.UniteOeuvre" %>
<%@ page import="com.source.meuble.analytique.centre.Centre" %>
<%@ page import="com.source.meuble.analytique.typeRubrique.TypeRubrique" %>
<%@page pageEncoding="UTF-8" %>

<%
    List<UniteOeuvre> uos = ((List<UniteOeuvre>) request.getAttribute("uos"));
    List<Centre> centres = ((List<Centre>) request.getAttribute("centres"));
    List<TypeRubrique> trs = ((List<TypeRubrique>) request.getAttribute("trs"));
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/output.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <title>Mr Meuble</title>
</head>

<body class="overflow-hidden">
    <svg class="bgs absolute z-0" id="eBWIyf7iGnv1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2560 1000" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" project-id="8a736d06e89d453488ae787ec2786625" export-id="94e49368974348cba6ad2bb61150d0c3" cached="false"><defs><linearGradient id="eBWIyf7iGnv2-fill" x1="0.458994" y1="1.017456" x2="0.458994" y2="0.281312" spreadMethod="pad" gradientUnits="objectBoundingBox" gradientTransform="translate(0 0)"><stop id="eBWIyf7iGnv2-fill-0" offset="0%" stop-color="#f3f7f9"/><stop id="eBWIyf7iGnv2-fill-1" offset="0%" stop-color="#fff"/><stop id="eBWIyf7iGnv2-fill-2" offset="40.3228%" stop-color="#fcfdfd"/><stop id="eBWIyf7iGnv2-fill-3" offset="65.8394%" stop-color="#f2f6f8"/><stop id="eBWIyf7iGnv2-fill-4" offset="100%" stop-color="#dee9ee"/></linearGradient></defs><path d="M285.85945,66.35304v1307.293918q256.195996,66.35304,591.661108,0c0-37.450621,0-124.835403,0-124.835403l-8.803025-267.242946c0-131.791043-64.761322-319.916369-96.833279-380.729676C667.799942,358.74226,454.54609,-269.841303,285.85945,66.35304" transform="matrix(1 0 0 0.784513-285.85945 79.243451)" fill="url(#eBWIyf7iGnv2-fill)" stroke-width="5.12"/></svg>
    
    
    <svg class="bgs absolute z-0" id="eRYNvC8mAPq1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2560 1000" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" project-id="8a736d06e89d453488ae787ec2786625" export-id="2dc69a17fd054190aba0f72fd98ed3df" cached="false"><defs><linearGradient id="eRYNvC8mAPq2-fill" x1="0.458994" y1="1.017456" x2="0.458994" y2="0.281312" spreadMethod="pad" gradientUnits="objectBoundingBox" gradientTransform="translate(0 0)"><stop id="eRYNvC8mAPq2-fill-0" offset="0%" stop-color="#f3f7f9"/><stop id="eRYNvC8mAPq2-fill-1" offset="0%" stop-color="#fff"/><stop id="eRYNvC8mAPq2-fill-2" offset="40.3228%" stop-color="#fcfdfd"/><stop id="eRYNvC8mAPq2-fill-3" offset="65.8394%" stop-color="#f2f6f8"/><stop id="eRYNvC8mAPq2-fill-4" offset="100%" stop-color="#dee9ee"/></linearGradient></defs><path d="M285.85945,66.35304v1307.293918q256.195996,66.35304,591.661108,0c0-37.450621,0-124.835403,0-124.835403l-8.803025-267.242946c0-131.791043-64.761322-319.916369-96.833279-380.729676C667.799942,358.74226,454.54609,-269.841303,285.85945,66.35304" transform="matrix(-1 0 0 0.784513 2845.859449 88.94811)" fill="url(#eRYNvC8mAPq2-fill)" stroke-width="5.12"/></svg>

    <div class="relative z-3 flex items-center justify-center">
        <nav class="relative navbar w-3/6 h-16 flex justify-around border-b-2">
            <div class="absolute left-0 h-[100%] flex items-center justify-center">
                <span class="font-bold">Mr. Meuble</span>
            </div>
            <div class="absolute right-0 h-[100%] flex items-center justify-center">
                <ul class="flex items-center justify-center gap-10">
                    <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="centre-modal" data-hs-overlay="#centre-modal">Centre</li>
                    <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="uo-modal" data-hs-overlay="#uo-modal">Unité d'oeuvre</li>
                    <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="type-rubrique-modal" data-hs-overlay="#type-rubrique-modal">Type rubrique</li>
                    <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="rubrique-modal" data-hs-overlay="#rubrique-modal">Rubrique</li>
                </ul>
            </div>
        </nav>
    </div>

    <div class="slogan relative z-2 top-32 flex justify-center items-center flex-col">
        <h1 class="font-sans text-8xl text-gray-700 font-bold">Mr. Meuble</h1>
        <h1 class="font-sans">Bienvenu dans l'univers du bois.</h1>
    </div> 

    <div class="relative z-1">
        <div class="bg-transparent flex justify-center items-center mt-44 gap-4">
            <div
                class="illustration bg-slate-200 py-3 px-4 text-sm flex items-center font-medium rounded-3xl border border-transparent text-gray-700 focus:outline-none disabled:opacity-50 w-52 h-40 disabled:pointer-events-none">
                <svg id="eBpYDFvM6KR1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2560 1440" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" project-id="8a736d06e89d453488ae787ec2786625" export-id="8da3007915254678ab790e4f83ac07db" cached="false"><g transform="matrix(4.876047 0 0 7.282814 304.7906-713.017554)"><g><path d="M360.6,173.9h-120.1c-7.9,0-14.4,6.5-14.4,14.4v95.9h134.5c7.9,0,14.4-6.5,14.4-14.4v-81.5c0-7.9-6.5-14.4-14.4-14.4v0Z" clip-rule="evenodd" fill="#71b1dd" fill-rule="evenodd"/><path d="M331.1,173.9h29c8.2,0,14.8,6.7,14.8,14.8v81.1c0,7.9-6.5,14.4-14.4,14.4h-29.5c-.2,0-.4-.2-.4-.4v-109.5c.1-.2.3-.4.5-.4v0Z" clip-rule="evenodd" fill="#99cbee" fill-rule="evenodd"/><path d="M57.8,208.6c-.1-.9,12.4-3,10.7-14.9l-9.9-66.8c-.9-6.4-6.4-11.1-12.9-11.1c54.9,0,109.9,0,164.8,0c6.5,0,11.9,4.7,12.9,11.1l12.3,81.7c-58.4,0-119.6,0-177.9,0v0Z" clip-rule="evenodd" fill="#99cbee" fill-rule="evenodd"/><path d="M55.6,208.6h-5.4c-6.5,0-11.9-4.7-12.9-11.1l-9.9-66.8c-.6-3.9.5-7.4,3-10.4c2.6-3,5.9-4.5,9.8-4.5h5.4c6.5,0,11.9,4.7,12.9,11.1l9.9,66.8c.6,3.9-.5,7.4-3,10.4-2.6,3-5.9,4.5-9.8,4.5v0Z" clip-rule="evenodd" fill="#71b1dd" fill-rule="evenodd"/><path d="M192.6,173.9h-153.2c-7.9,0-14.4,6.5-14.4,14.4v81.5c0,7.9,6.5,14.4,14.4,14.4h153.2v-110.3Z" clip-rule="evenodd" fill="#71b1dd" fill-rule="evenodd"/><path d="M192.6,173.9h-29.9c-7.9,0-14.4,6.5-14.4,14.4v95.9h44.3v-110.3Z" clip-rule="evenodd" fill="#99cbee" fill-rule="evenodd"/><path d="M310.6,246.4h-118v-37.8h103.4c8,0,14.6,6.6,14.6,14.6v23.2Z" clip-rule="evenodd" fill="#cce9fb" fill-rule="evenodd"/><polygon points="310.6,246.4 192.6,246.4 192.6,284.2 246.6,284.2" clip-rule="evenodd" fill="#5699c6" fill-rule="evenodd"/><path d="M192.6,215.1v-6.5h103.4c5,0,9.5,2.6,12.1,6.5h-115.5v0Z" clip-rule="evenodd" fill="#e2f2fc" fill-rule="evenodd"/></g><g><path d="M226.1,269.8v14.4h134.5v0c.1,0,.2,0,.4,0v0c.1,0,.2,0,.4,0v0c.1,0,.2,0,.4,0v0c.1,0,.2,0,.4,0c.1,0,.2,0,.4,0v0c.1,0,.2,0,.4-.1.1,0,.2,0,.4-.1.1,0,.2,0,.4-.1v0c.1,0,.2,0,.3-.1v0c.1,0,.2-.1.3-.1s.2-.1.3-.1v0c.1,0,.2-.1.3-.1v0c.1,0,.2-.1.3-.1s.2-.1.3-.1v0c.1,0,.2-.1.3-.1v0c.1,0,.2-.1.3-.1s.2-.1.3-.1.2-.1.3-.1c.1-.1.2-.1.3-.2v0c.1-.1.2-.1.3-.2s.2-.1.3-.2.2-.1.3-.2v0c.1-.1.2-.1.3-.2v0c.1-.1.2-.1.3-.2.2-.1.4-.3.6-.4v0c.1-.1.2-.1.3-.2v0c.3-.2.5-.4.8-.7.2-.2.3-.3.5-.5v0c.1-.1.2-.2.2-.2.1-.1.2-.2.2-.3v0c.1-.1.2-.2.2-.3.1-.1.1-.2.2-.3.2-.3.4-.5.6-.8v0c.1-.1.1-.2.2-.3v0c.3-.4.5-.8.7-1.2v0c.1-.2.2-.4.3-.6v0c.1-.2.2-.4.3-.6v0c0-.1.1-.2.1-.3v0c0-.1.1-.2.1-.3v0c0-.1.1-.2.1-.3v0c0-.1.1-.2.1-.3v0c0-.1.1-.2.1-.3v0c.1-.2.1-.5.2-.7v0c0-.1.1-.2.1-.3v0c0-.1,0-.2.1-.4v0c0-.1,0-.2.1-.4v0c0-.1,0-.2,0-.4v0c0-.1,0-.2,0-.4v0c0-.1,0-.2,0-.4v0c0-.1,0-.2,0-.4v0c0-.1,0-.2,0-.4v0c0-.1,0-.2,0-.4v0l-148.6.2v0Zm147.2,6.8c.1-.2.2-.4.3-.6l-.3.6Zm0,0c.1-.2.2-.4.3-.6l-.3.6Zm.5-1.6c.1-.2.1-.5.2-.7l-.2.7Z" clip-rule="evenodd" fill="#5e1617" fill-rule="evenodd"/><path d="M375,269.8c0,.1,0,.2,0,.4v0c0,.1,0,.2,0,.4v0c0,.1,0,.2,0,.4v0c0,.1,0,.2,0,.4v0c0,.1,0,.2,0,.4v0c0,.1,0,.2,0,.4v0c0,.1,0,.2-.1.4v0c0,.1,0,.2-.1.4v0c0,.1,0,.2-.1.3v0c-.1.2-.1.5-.2.7v0c0,.1-.1.2-.1.3v0c0,.1-.1.2-.1.3v0c0,.1-.1.2-.1.3v0c0,.1-.1.2-.1.3v0c0,.1-.1.2-.1.3v0c-.1.2-.2.4-.3.6v0c-.1.2-.2.4-.3.6v0c-.2.4-.5.8-.7,1.2v0c-.1.1-.1.2-.2.3v0c-.2.3-.4.6-.6.8v0c-.1.1-.1.2-.2.3v0c-.2.2-.3.3-.5.5v0c-.2.3-.5.5-.7.7v0c-.5.5-1.1.9-1.6,1.3v0c-.3.2-.6.4-.9.6v0c-.1.1-.2.1-.3.2v0c-.1.1-.2.1-.3.2v0c-.1.1-.2.1-.3.2v0c-.1,0-.2.1-.3.1v0c-.1,0-.2.1-.3.1v0c-.1,0-.2.1-.3.1v0c-.1,0-.2.1-.3.1v0c-.1,0-.2.1-.3.1v0c-.1,0-.2.1-.3.1v0c-.1,0-.2.1-.3.1v0c-.1,0-.2.1-.3.1v0c-.1,0-.2.1-.3.1v0c-.1,0-.2.1-.3.1v0c-.1,0-.2,0-.4.1v0c-.1,0-.2,0-.4.1v0c-.1,0-.2,0-.4.1v0c-.1,0-.2,0-.4,0v0c-.1,0-.2,0-.4,0v0c-.1,0-.2,0-.4,0v0c-.1,0-.2,0-.4,0v0c-.1,0-.2,0-.4,0v0h-29.5c-.2,0-.4-.2-.4-.4v-14l44-.1v0Z" clip-rule="evenodd" fill="#802d2d" fill-rule="evenodd"/><path d="M25,269.8c0,.1,0,.2,0,.4c0,.1,0,.2,0,.4c0,.1,0,.2,0,.4c0,.1,0,.2,0,.4c0,.1,0,.2,0,.4c0,.1,0,.2.1.4c0,.1,0,.2.1.4c0,.1,0,.2.1.4c0,.1.1.2.1.3s.1.2.1.3v0c0,.1.1.2.1.3s.1.2.1.3.1.2.1.3.1.2.1.3.1.2.1.3.1.2.1.3.1.2.1.3v0c0,.1.1.2.1.3.1.1.1.2.2.3v0c.1.1.1.2.2.3v0c.1.1.1.2.2.3v0c.1.1.1.2.2.3v0c.1.1.1.2.2.3v0c.1.1.1.2.2.3s.1.2.2.3.1.2.2.3v0c.1.1.1.2.2.3v0c.1.1.1.2.2.3s.1.2.2.3.2.2.2.3v0c.1.1.2.2.2.3.1.1.2.2.2.2v0c.1.1.2.2.2.2v0c.1.1.2.2.3.2.1.1.2.2.3.2v0c.1.1.2.2.3.2v0c.1.1.2.1.3.2v0c.1.1.2.1.3.2v0c.1.1.2.1.3.2v0c.1.1.2.1.3.2s.2.1.3.2v0c.1.1.2.1.3.2s.2.1.3.2.2.1.3.2.2.1.3.2v0c.1.1.2.1.3.2.1,0,.2.1.3.1s.2.1.3.1.2.1.3.1.2.1.3.1.2.1.3.1.2.1.3.1.2.1.3.1.2.1.3.1v0c.1,0,.2.1.3.1s.2.1.4.1.2,0,.4.1v0c.1,0,.2,0,.4.1v0c.1,0,.2,0,.4.1.1,0,.2,0,.4,0v0c.1,0,.2,0,.4,0c.1,0,.2,0,.4,0v0c.1,0,.2,0,.4,0v0c.1,0,.2,0,.4,0v0h153.2v-14.4h-167.7v0Z" clip-rule="evenodd" fill="#5e1617" fill-rule="evenodd"/><polygon points="148.3,269.8 148.3,284.2 192.6,284.2 192.6,269.8" clip-rule="evenodd" fill="#802d2d" fill-rule="evenodd"/><polygon points="192.6,269.8 192.6,284.2 246.6,284.2 271,269.8" clip-rule="evenodd" fill="#471213" fill-rule="evenodd"/></g></g></svg>
            </div>
            <div
                class="illustration bg-slate-200 py-3 px-4 gap-x-2 flex items-center text-sm font-medium rounded-3xl border border-transparent text-gray-700 w-72 h-52 focus:outline-none disabled:opacity-50 disabled:pointer-events-none">
                <svg id="eGSZrcMCjOx1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2560 1440" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" project-id="8a736d06e89d453488ae787ec2786625" export-id="97c4f35ee5ca4e088d451b1e2c541d0d" cached="false"><g transform="matrix(5.680145 0 0 4.864436 143.971-209.568565)"><polygon points="25,99.8 375,99.8 375,112 25,112" clip-rule="evenodd" fill="#634829" fill-rule="evenodd"/><polygon points="106.3,148.7 85.3,148.7 81.8,300.2 90.3,300.2" clip-rule="evenodd" fill="#4f361d" fill-rule="evenodd"/><polygon points="293.7,148.7 314.7,148.7 318.2,300.2 309.7,300.2" clip-rule="evenodd" fill="#4f361d" fill-rule="evenodd"/><polygon points="49.2,148.7 44.9,300.2 55.3,300.2 74.9,148.7 325.1,148.7 344.7,300.2 355.1,300.2 350.8,148.7 359,112 41,112" clip-rule="evenodd" fill="#704d29" fill-rule="evenodd"/></g></svg>
            </div>
            <div
                class="illustration bg-slate-200 py-3 px-4 gap-x-2 flex items-center text-sm font-medium rounded-3xl border border-transparent text-gray-700 w-52 h-40 focus:outline-none disabled:opacity-50 disabled:pointer-events-none">
                <svg id="exnSi64zW7A1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2560 1440" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" project-id="8a736d06e89d453488ae787ec2786625" export-id="a07538c6e2da4834af851fac14a8b9c0" cached="false"><g transform="matrix(4.004082 0 0 3.455885 479.282653 58.168369)"><g><polygon points="325.3,375 313.8,375 274.5,231.7 196.7,231.7 157.5,375 146,375 175.1,224.4 296.2,224.4" clip-rule="evenodd" fill="#533618" fill-rule="evenodd"/><polygon points="271.8,375 260.3,375 221.1,231.7 143.3,231.7 104,375 92.5,375 121.6,224.4 242.7,224.4" clip-rule="evenodd" fill="#694721" fill-rule="evenodd"/><polygon points="263.8,224.4 64.1,224.4 64.1,220 263.8,220" clip-rule="evenodd" fill="#634829" fill-rule="evenodd"/><polygon points="329.7,224.4 263.8,224.4 263.8,220 329.7,220" clip-rule="evenodd" fill="#533618" fill-rule="evenodd"/></g><g><path d="M186,25h135.2c4.6,0,8.1,3.6,8,8.2l-3.7,177.5c-.1,2.5-1,4.7-2.9,6.5s-4.1,2.7-6.6,2.7h-159.2c-2.5,0-4.6-.9-6.2-2.8-1.6-1.8-2.2-4.1-1.8-6.6L176.5,33c.8-4.5,4.9-8,9.5-8v0Z" clip-rule="evenodd" fill="#a7d6a7" fill-rule="evenodd"/><path d="M321.2,25h11.8c4.6,0,8.1,3.6,8,8.2l-3.7,177.5c-.1,2.5-1,4.7-2.9,6.5s-4.1,2.7-6.6,2.7h-11.8c2.5,0,4.7-.9,6.6-2.7s2.8-4,2.9-6.5l3.7-177.5c.1-4.6-3.4-8.2-8-8.2v0Z" clip-rule="evenodd" fill="#cfc" fill-rule="evenodd"/><path d="M59,220c-1.1-22.6,15.4-33.3,49.5-32c53.8,0,107.7,0,161.5,0v32c-70.3,0-140.7,0-211,0v0Z" clip-rule="evenodd" fill="#9c9" fill-rule="evenodd"/><path d="M332.6,220c-43.9,0-91.3,0-142.3,0-1.1-22.6,15.4-33.3,49.5-32h41.1c31.5-.6,48.7,10.1,51.7,32Z" clip-rule="evenodd" fill="#cfc" fill-rule="evenodd"/><path d="M186,25h135.2c4.6,0,8.1,3.6,8,8.2l-3.3,157.7c-10.7-8-26.1-10.4-41.9-10.1h-130.5L176.6,33.2c.7-4.7,4.8-8.2,9.4-8.2v0Z" clip-rule="evenodd" fill="#9c9" fill-rule="evenodd"/></g></g></svg>
            </div>
        </div>
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
                                        class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Direct (opérationnel)</label>
                                </div>

                                <div class="flex">
                                    <input type="radio" name="categorie" value="0"
                                        class="shrink-0 mt-1 border-gray-500 rounded-full" id="centre-indirect">
                                    <label for="centre-indirect"
                                        class="text-sm text-gray-900 ms-2 dark:text-neutral-400">Indirect (structure)</label>
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
                                        class="text-sm text-gray-900 ms-2 dark:text-neutral-400">incorporable</label>
                                </div>

                                <div class="flex">
                                    <input type="radio" name="incorporabilite" value="0"
                                        class="shrink-0 mt-1 border-gray-500 rounded-full"
                                        id="type-rubrique-non-corporel">
                                    <label for="type-rubrique-non-corporel"
                                        class="text-sm text-gray-900 ms-2 dark:text-neutral-400">non incorporable</label>
                                </div>

                                <div class="flex">
                                    <input type="radio" name="incorporabilite" value="2"
                                        class="shrink-0 mt-1 border-gray-500 rounded-full"
                                        id="type-rubrique-non-corporel">
                                    <label for="type-rubrique-non-corporel"
                                        class="text-sm text-gray-900 ms-2 dark:text-neutral-400">supplétive</label>
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
    </div>

    <script src="./node_modules/preline/dist/preline.js"></script>
    <script src="assets/js/gsap.min.js"></script>
    <script src="assets/js/script.js"></script>
</body>

</html>