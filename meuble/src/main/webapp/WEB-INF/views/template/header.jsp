<%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 14/10/2024
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="UTF-8" %>

<div class="relative z-3 flex items-center justify-center">
    <nav class="relative navbar w-3/6 h-16 flex justify-around border-b-2">
        <div class="absolute left-0 h-[100%] flex items-center justify-center">
            <span class="font-bold"><a href="${pageContext.request.contextPath}/home">Mr. Meuble</a></span>
        </div>
        <div class="absolute right-0 h-[100%] flex items-center justify-center">
            <ul class="flex items-center justify-center gap-10">
<%--                <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="centre-modal" data-hs-overlay="#centre-modal">Centre</li>--%>
<%--                <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="uo-modal" data-hs-overlay="#uo-modal">Unité d'oeuvre</li>--%>
<%--                <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="type-rubrique-modal" data-hs-overlay="#type-rubrique-modal">Type rubrique</li>--%>
<%--                <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="rubrique-modal" data-hs-overlay="#rubrique-modal">Rubrique</li>--%>
<%--                <li class="font-sans list cursor-pointer" aria-haspopup="dialog" aria-expanded="false" aria-controls="sortie-modal" data-hs-overlay="#sortie-modal">Sortie</li>--%>
                <li class="font-sans list cursor-pointer"><a href="home/ca">Comptabilité analytique</a></li>
                <li class="font-sans list cursor-pointer">Achat</li>
                <li class="font-sans list cursor-pointer">Stock</li>
            </ul>
        </div>
    </nav>
</div>