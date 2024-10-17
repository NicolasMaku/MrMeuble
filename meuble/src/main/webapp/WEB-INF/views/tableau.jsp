<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.analytique.uniteOeuvre.UniteOeuvre" %>
<%@ page import="com.source.meuble.analytique.centre.Centre" %>
<%@ page import="com.source.meuble.analytique.typeRubrique.TypeRubrique" %>
<%@ page import="com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueRow" %>
<%@ page import="com.source.meuble.visible.repartition.Repartition" %>
<%@ page import="com.source.meuble.visible.repartition.TotauxRepartition" %>
<%@ page import="com.source.meuble.util.RequestAttribute" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.source.meuble.analytique.listeAnalytique.RepartitionCentre" %>
<%@ page import="com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueTableau" %>
<%@ page import="com.source.meuble.visible.cout.Cout" %>
<%@ page import="com.source.meuble.visible.seuil.CalculSeuil" %>
<%@ page import="com.source.meuble.visible.seuil.Seuil" %>
<%@page pageEncoding="UTF-8" %>

<%
    RequestAttribute requestAttribute = new RequestAttribute(request);
    List<UniteOeuvre> uos = ((List<UniteOeuvre>) request.getAttribute("uos"));
    List<Centre> centres = ((List<Centre>) request.getAttribute("centres"));
    List<TypeRubrique> trs = ((List<TypeRubrique>) request.getAttribute("trs"));
    ListeAnalytiqueTableau tableau = requestAttribute.getObject("tableau", ListeAnalytiqueTableau.class, new ListeAnalytiqueTableau(new ListeAnalytiqueRow[0]));
    ListeAnalytiqueRow[] lars = tableau.getTableau();
    List<Centre> cos = ((List<Centre>) request.getAttribute("cos"));
    Boolean hasSortie = requestAttribute.getObject("hasSortie", Boolean.class, false);
    Cout cout = requestAttribute.getObject("cout", Cout.class, null);
    List<Repartition> repartitions = ((List<Repartition>) request.getAttribute("repartitions") );
    TotauxRepartition totalRepa = ((TotauxRepartition) request.getAttribute("totalRepa") );
    Seuil seuil = ((Seuil) request.getAttribute("seuil") );
%>

<button class="absolute top-[-10%] right-20 p-2 px-3 rounded-3xl text-gray-50 bg-slate-500" id="generate">Generer PDF</button>
<div
        class="overflow-x-auto m-8 bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-10">
    <h1 class="text-black p-2 font-bold underline">Tableau des charges:</h1>
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
                    for (Centre centre : centres) {
                %>

                <th class="text-black text-center border border-black border-t-transparent" colspan="3">
                    <%=centre.getNom()%>
                </th>
                <%
                    }
                %>

                <th class="text-black text-center border border-black border-t-transparent border-r-transparent"
                    colspan="3">TOTAL
                </th>
            </tr>
            <tr>
                <%
                    for (int i = 0; i < centres.size(); i++) {
                %>
                <th class="text-black text-center border border-l-black border-transparent">%</th>
                <th class="text-black text-center">FIXE</th>
                <th class="text-black text-center">VARIABLE</th>
                <%
                    }
                %>
                <th class="text-black text-center border border-l-black border-transparent">%</th>
                <th class="text-black text-center">FIXE</th>
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
                for (ListeAnalytiqueRow row : lars) {
            %>
            <tr>
                <td><%=row.getRubrique()%>
                </td>
                <td class="number text-right border border-r-black border-transparent"><%=row.getTotal()%>
                </td>
                <td class="text-center"><%=row.getUniteOeuvre()%>
                </td>
                <td class="text-center"><%=row.getNature().substring(0, 1).toUpperCase()%>
                </td>

                <%
                    for (Centre centre : centres) {
                        RepartitionCentre rc = row.getRepartition().get(centre.getIdCentre());
                %>
                <td class="text-center border border-l-black border-transparent"><%=rc != null ? rc.getPourcentage() : "-"%>
                </td>
                <td class="number text-center"><%=rc != null ? rc.getFixeStr() : "-"%>
                </td>
                <td class="number text-center"><%=rc != null ? rc.getVariableStr() : "-"%>
                </td>
                <%
                    }
                %>


                <td class="text-center border border-l-black border-transparent">100.00%</td>
                <td class="number text-center"><%=row.getTotalFixe()%>
                </td>
                <td class="number text-center"><%=row.getTotalVariable()%>
                </td>
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
                    for (Centre centre : centres) {
                        Double fixe = tableau.getTotalFixeParCentre().get(centre.getIdCentre());
                        Double variable = tableau.getTotalVariableParCentre().get(centre.getIdCentre());
                %>
                <th class="text-black text-right border border-black"></th>
                <th class="number text-black text-right border border-black"><%=fixe != null ? fixe : "0.00"%>
                </th>
                <th class="number text-black text-right border border-black"><%=variable != null ? variable : "0.00"%>
                </th>

                <%
                    }
                %>
                <th class="number text-black text-right border border-black"></th>
                <th class="number text-black text-right border border-black"><%=tableau.getTotalFixe()%>
                </th>
                <th class="number text-black text-right border border-black"><%=tableau.getTotalVariable()%>
                </th>
                <%--                        <th class="number text-black text-right border border-black"></th>--%>
                <%--                        <th class="number text-black text-right border border-black">5487956</th>--%>
                <%--                        <th class="number text-black text-right border border-black">97996146</th>--%>
                <%--                        <th class="number text-black text-right border border-black border-r-transparent"></th>--%>
                <%--                        <th class="number text-black text-right border border-black border-l-transparent">7854219</th>--%>
                <%--                        <th class="number text-black text-right border border-black">6562315</th>--%>
            </tr>
            <tr>
                <th class="text-black">TOTAL</th>
                <th class="number text-black text-right border border-r-black border-transparent"><%=tableau.getGrandTotal()%>
                </th>
                <th class="number text-black text-right" colspan="2"></th>
                <%
                    for (Centre centre : centres) {
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
                <%--                        <th class="number text-black text-right border border-black border-b-transparent" colspan="3">--%>
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
    <div
            class="overflow-x-auto m-8 bg-gray-500 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-10">
        <h1 class="text-black p-2 font-bold underline">Tableau de répartition:</h1>
        <div class="table-container relative max-h-[75dvh] overflow-y-auto">
            <table class="table table-xs" id="table-2">
                <thead>
                    <tr>
                        <th class="text-center text-black">REPARTITION CENTRE STRUCTURE</th>
                        <th class="text-center text-black">Cout direct</th>
                        <th class="text-center text-black"></th>
                        <th class="text-center text-black">Clés (%)</th>
                        <th class="text-center text-black">Structure</th>
                        <th class="text-center text-black">Cout total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                    <%
                        for (Repartition repart : repartitions) { %>
                            <tr>
                                <td>Total <%= repart.getNom() %></td>
                                <td class="number text-right"><%= String.format("%.2f",repart.getMontant()) %></td>
                                <td class="number text-right"></td>
                                <td class="number text-right"><%= repart.getCle() %> %</td>
                                <td class="number text-right"><%= String.format("%.2f",repart.getStructure()) %></td>
                                <td class="number text-right"><%= repart.getCoutTotal() %></td>
                            </tr>
                        <% } %>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td></tr>
                </tbody>
                <tfoot>
                <tr>
                    <th class="text-black">Total générale</th>
                    <th class="number text-right text-black"><%= String.format("%.2f",totalRepa.getSDirect()) %></th>
                    <th class="number text-right text-black"></th>
                    <th class="number text-right text-black">100 %</th>
                    <th class="number text-right text-black"><%= totalRepa.getSStructure() %></th>
                    <th class="number text-right text-black"><%= String.format("%.2f",totalRepa.getSCoutTotal()) %></th>
                </tr>
                </tfoot>
            </table>
        </div>
</div>


<%
    if(hasSortie)
    {
%>
<div class="overflow-x-auto w-1/3 m-8 bg-gray-500 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-10">
    <h1 class="text-black p-2 font-bold underline">Calcul de cout de revient:</h1>
    <div class="table-container relative max-h-[75dvh] overflow-y-auto">
        <table class="table table-xs" id="table-3">
            <thead>
            <tr>
                <th class="text-black"><%=cout.getLibelle()%></th>
                <th class="text-black"></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Unité d'oeuvre</td>
                <td class="text-right"><%=cout.getUniteOeuvre().getNom()%></td>
            </tr>
            <tr>
                <td>Nombre</td>
                <td class="number text-right"><%=cout.getQuantite()%></td>
            </tr>
            <%
                for(Map.Entry<Centre, Double> entry: cout.getCoutParCentre().entrySet())
                {
            %>
            <tr>
                <td><%=entry.getKey().getNom()%></td>
                <td class="number text-right"><%=entry.getValue()%></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>Cout TOTAUX</td>
                <td><%=cout.getCout_total()%></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <th class="text-black">Cout de revient du <%=cout.getLibelle()%></th>
                <th class="number text-right text-black text-right"><%=cout.getCoutRevient()%></th>
            </tr>
            </tfoot>
        </table>
    </div>
</div>

<div
        class="overflow-x-auto w-1/3 m-8 bg-gray-500 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-10">
    <h1 class="text-black p-2 font-bold underline">Seuil de rentabilité:</h1>
    <div class="table-container relative max-h-[75dvh] overflow-y-auto">
        <div class="flex items-center justify-center gap-2">
            <div class="py-2 px-4 w-3/6">
                <p>CA:</p>
            </div>
            <div class="py-2 px-4 w-3/6">
                <p class="number text-right text-black font-bold"><%= seuil.getChiffreAffaire() %></p>
            </div>
        </div>
        <div class="flex items-center justify-center gap-2">
            <div class="py-2 px-4 w-3/6">
                <p>CV:</p>
            </div>
            <div class="py-2 px-4 w-3/6">
                <p class="number text-right text-black font-bold"><%= seuil.getCoutVariable() %></p>
            </div>
        </div>
        <div class="flex items-center justify-center gap-2">
            <div class="py-2 px-4 w-3/6">
                <p>CF:</p>
            </div>
            <div class="py-2 px-4 w-3/6">
                <p class="number text-right text-black font-bold"><%= seuil.getCoutFixe() %> </p>
            </div>
        </div>
        <div class="flex items-center justify-center gap-2">
            <div class="py-2 px-4 w-3/6">
                <p>Cout de revient : </p>
            </div>
            <div class="py-2 px-4 w-3/6">
                <p class="number text-right text-black font-bold"><%=cout.getCoutRevient()%></p>
            </div>
        </div>
        <div class="flex items-center justify-center gap-2">
            <div class="flex items-center gap-4 py-2 px-4 w-3/6">
                <p>Seuil:</p>
                <svg xmlns="http://www.w3.org/2000/svg" width="85.096px" height="39.096px" viewBox="0 -1392 4701.4 2160" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style=""><defs><path id="MJX-11-TEX-I-1D436" d="M50 252Q50 367 117 473T286 641T490 704Q580 704 633 653Q642 643 648 636T656 626L657 623Q660 623 684 649Q691 655 699 663T715 679T725 690L740 705H746Q760 705 760 698Q760 694 728 561Q692 422 692 421Q690 416 687 415T669 413H653Q647 419 647 422Q647 423 648 429T650 449T651 481Q651 552 619 605T510 659Q484 659 454 652T382 628T299 572T226 479Q194 422 175 346T156 222Q156 108 232 58Q280 24 350 24Q441 24 512 92T606 240Q610 253 612 255T628 257Q648 257 648 248Q648 243 647 239Q618 132 523 55T319 -22Q206 -22 128 53T50 252Z"></path><path id="MJX-11-TEX-I-1D439" d="M48 1Q31 1 31 11Q31 13 34 25Q38 41 42 43T65 46Q92 46 125 49Q139 52 144 61Q146 66 215 342T285 622Q285 629 281 629Q273 632 228 634H197Q191 640 191 642T193 659Q197 676 203 680H742Q749 676 749 669Q749 664 736 557T722 447Q720 440 702 440H690Q683 445 683 453Q683 454 686 477T689 530Q689 560 682 579T663 610T626 626T575 633T503 634H480Q398 633 393 631Q388 629 386 623Q385 622 352 492L320 363H375Q378 363 398 363T426 364T448 367T472 374T489 386Q502 398 511 419T524 457T529 475Q532 480 548 480H560Q567 475 567 470Q567 467 536 339T502 207Q500 200 482 200H470Q463 206 463 212Q463 215 468 234T473 274Q473 303 453 310T364 317H309L277 190Q245 66 245 60Q245 46 334 46H359Q365 40 365 39T363 19Q359 6 353 0H336Q295 2 185 2Q120 2 86 2T48 1Z"></path><path id="MJX-11-TEX-N-2217" d="M229 286Q216 420 216 436Q216 454 240 464Q241 464 245 464T251 465Q263 464 273 456T283 436Q283 419 277 356T270 286L328 328Q384 369 389 372T399 375Q412 375 423 365T435 338Q435 325 425 315Q420 312 357 282T289 250L355 219L425 184Q434 175 434 161Q434 146 425 136T401 125Q393 125 383 131T328 171L270 213Q283 79 283 63Q283 53 276 44T250 35Q231 35 224 44T216 63Q216 80 222 143T229 213L171 171Q115 130 110 127Q106 124 100 124Q87 124 76 134T64 161Q64 166 64 169T67 175T72 181T81 188T94 195T113 204T138 215T170 230T210 250L74 315Q65 324 65 338Q65 353 74 363T98 374Q106 374 116 368T171 328L229 286Z"></path><path id="MJX-11-TEX-I-1D434" d="M208 74Q208 50 254 46Q272 46 272 35Q272 34 270 22Q267 8 264 4T251 0Q249 0 239 0T205 1T141 2Q70 2 50 0H42Q35 7 35 11Q37 38 48 46H62Q132 49 164 96Q170 102 345 401T523 704Q530 716 547 716H555H572Q578 707 578 706L606 383Q634 60 636 57Q641 46 701 46Q726 46 726 36Q726 34 723 22Q720 7 718 4T704 0Q701 0 690 0T651 1T578 2Q484 2 455 0H443Q437 6 437 9T439 27Q443 40 445 43L449 46H469Q523 49 533 63L521 213H283L249 155Q208 86 208 74ZM516 260Q516 271 504 416T490 562L463 519Q447 492 400 412L310 260L413 259Q516 259 516 260Z"></path><path id="MJX-11-TEX-N-2212" d="M84 237T84 250T98 270H679Q694 262 694 250T679 230H98Q84 237 84 250Z"></path><path id="MJX-11-TEX-I-1D449" d="M52 648Q52 670 65 683H76Q118 680 181 680Q299 680 320 683H330Q336 677 336 674T334 656Q329 641 325 637H304Q282 635 274 635Q245 630 242 620Q242 618 271 369T301 118L374 235Q447 352 520 471T595 594Q599 601 599 609Q599 633 555 637Q537 637 537 648Q537 649 539 661Q542 675 545 679T558 683Q560 683 570 683T604 682T668 681Q737 681 755 683H762Q769 676 769 672Q769 655 760 640Q757 637 743 637Q730 636 719 635T698 630T682 623T670 615T660 608T652 599T645 592L452 282Q272 -9 266 -16Q263 -18 259 -21L241 -22H234Q216 -22 216 -15Q213 -9 177 305Q139 623 138 626Q133 637 76 637H59Q52 642 52 648Z"></path></defs><g stroke="#000000" fill="#000000" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mfrac"><g data-mml-node="mrow" transform="translate(369,676)"><g data-mml-node="mi"><use data-c="1D436" xlink:href="#MJX-11-TEX-I-1D436"></use></g><g data-mml-node="mi" transform="translate(760,0)"><use data-c="1D439" xlink:href="#MJX-11-TEX-I-1D439"></use></g><g data-mml-node="mo" transform="translate(1731.2,0)"><use data-c="2217" xlink:href="#MJX-11-TEX-N-2217"></use></g><g data-mml-node="mi" transform="translate(2453.4,0)"><use data-c="1D436" xlink:href="#MJX-11-TEX-I-1D436"></use></g><g data-mml-node="mi" transform="translate(3213.4,0)"><use data-c="1D434" xlink:href="#MJX-11-TEX-I-1D434"></use></g></g><g data-mml-node="mrow" transform="translate(220,-686)"><g data-mml-node="mi"><use data-c="1D436" xlink:href="#MJX-11-TEX-I-1D436"></use></g><g data-mml-node="mi" transform="translate(760,0)"><use data-c="1D434" xlink:href="#MJX-11-TEX-I-1D434"></use></g><g data-mml-node="mo" transform="translate(1732.2,0)"><use data-c="2212" xlink:href="#MJX-11-TEX-N-2212"></use></g><g data-mml-node="mi" transform="translate(2732.4,0)"><use data-c="1D436" xlink:href="#MJX-11-TEX-I-1D436"></use></g><g data-mml-node="mi" transform="translate(3492.4,0)"><use data-c="1D449" xlink:href="#MJX-11-TEX-I-1D449"></use></g></g><rect width="4461.4" height="60" x="120" y="220"></rect></g></g></g></svg>
<%--                <svg xmlns="http://www.w3.org/2000/svg" width="85.072px" height="37.808px" viewBox="0 -1381 4700.4 2089" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style=""><defs><path id="MJX-7-TEX-I-1D436" d="M50 252Q50 367 117 473T286 641T490 704Q580 704 633 653Q642 643 648 636T656 626L657 623Q660 623 684 649Q691 655 699 663T715 679T725 690L740 705H746Q760 705 760 698Q760 694 728 561Q692 422 692 421Q690 416 687 415T669 413H653Q647 419 647 422Q647 423 648 429T650 449T651 481Q651 552 619 605T510 659Q484 659 454 652T382 628T299 572T226 479Q194 422 175 346T156 222Q156 108 232 58Q280 24 350 24Q441 24 512 92T606 240Q610 253 612 255T628 257Q648 257 648 248Q648 243 647 239Q618 132 523 55T319 -22Q206 -22 128 53T50 252Z"></path><path id="MJX-7-TEX-I-1D439" d="M48 1Q31 1 31 11Q31 13 34 25Q38 41 42 43T65 46Q92 46 125 49Q139 52 144 61Q146 66 215 342T285 622Q285 629 281 629Q273 632 228 634H197Q191 640 191 642T193 659Q197 676 203 680H742Q749 676 749 669Q749 664 736 557T722 447Q720 440 702 440H690Q683 445 683 453Q683 454 686 477T689 530Q689 560 682 579T663 610T626 626T575 633T503 634H480Q398 633 393 631Q388 629 386 623Q385 622 352 492L320 363H375Q378 363 398 363T426 364T448 367T472 374T489 386Q502 398 511 419T524 457T529 475Q532 480 548 480H560Q567 475 567 470Q567 467 536 339T502 207Q500 200 482 200H470Q463 206 463 212Q463 215 468 234T473 274Q473 303 453 310T364 317H309L277 190Q245 66 245 60Q245 46 334 46H359Q365 40 365 39T363 19Q359 6 353 0H336Q295 2 185 2Q120 2 86 2T48 1Z"></path><path id="MJX-7-TEX-N-2B" d="M56 237T56 250T70 270H369V420L370 570Q380 583 389 583Q402 583 409 568V270H707Q722 262 722 250T707 230H409V-68Q401 -82 391 -82H389H387Q375 -82 369 -68V230H70Q56 237 56 250Z"></path><path id="MJX-7-TEX-I-1D449" d="M52 648Q52 670 65 683H76Q118 680 181 680Q299 680 320 683H330Q336 677 336 674T334 656Q329 641 325 637H304Q282 635 274 635Q245 630 242 620Q242 618 271 369T301 118L374 235Q447 352 520 471T595 594Q599 601 599 609Q599 633 555 637Q537 637 537 648Q537 649 539 661Q542 675 545 679T558 683Q560 683 570 683T604 682T668 681Q737 681 755 683H762Q769 676 769 672Q769 655 760 640Q757 637 743 637Q730 636 719 635T698 630T682 623T670 615T660 608T652 599T645 592L452 282Q272 -9 266 -16Q263 -18 259 -21L241 -22H234Q216 -22 216 -15Q213 -9 177 305Q139 623 138 626Q133 637 76 637H59Q52 642 52 648Z"></path><path id="MJX-7-TEX-I-1D445" d="M230 637Q203 637 198 638T193 649Q193 676 204 682Q206 683 378 683Q550 682 564 680Q620 672 658 652T712 606T733 563T739 529Q739 484 710 445T643 385T576 351T538 338L545 333Q612 295 612 223Q612 212 607 162T602 80V71Q602 53 603 43T614 25T640 16Q668 16 686 38T712 85Q717 99 720 102T735 105Q755 105 755 93Q755 75 731 36Q693 -21 641 -21H632Q571 -21 531 4T487 82Q487 109 502 166T517 239Q517 290 474 313Q459 320 449 321T378 323H309L277 193Q244 61 244 59Q244 55 245 54T252 50T269 48T302 46H333Q339 38 339 37T336 19Q332 6 326 0H311Q275 2 180 2Q146 2 117 2T71 2T50 1Q33 1 33 10Q33 12 36 24Q41 43 46 45Q50 46 61 46H67Q94 46 127 49Q141 52 146 61Q149 65 218 339T287 628Q287 635 230 637ZM630 554Q630 586 609 608T523 636Q521 636 500 636T462 637H440Q393 637 386 627Q385 624 352 494T319 361Q319 360 388 360Q466 361 492 367Q556 377 592 426Q608 449 619 486T630 554Z"></path></defs><g stroke="#000000" fill="#000000" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mfrac"><g data-mml-node="mrow" transform="translate(220,676)"><g data-mml-node="mi"><use data-c="1D436" xlink:href="#MJX-7-TEX-I-1D436"></use></g><g data-mml-node="mi" transform="translate(760,0)"><use data-c="1D439" xlink:href="#MJX-7-TEX-I-1D439"></use></g><g data-mml-node="mo" transform="translate(1731.2,0)"><use data-c="2B" xlink:href="#MJX-7-TEX-N-2B"></use></g><g data-mml-node="mi" transform="translate(2731.4,0)"><use data-c="1D436" xlink:href="#MJX-7-TEX-I-1D436"></use></g><g data-mml-node="mi" transform="translate(3491.4,0)"><use data-c="1D449" xlink:href="#MJX-7-TEX-I-1D449"></use></g></g><g data-mml-node="mrow" transform="translate(1590.7,-686)"><g data-mml-node="mi"><use data-c="1D436" xlink:href="#MJX-7-TEX-I-1D436"></use></g><g data-mml-node="mi" transform="translate(760,0)"><use data-c="1D445" xlink:href="#MJX-7-TEX-I-1D445"></use></g></g><rect width="4460.4" height="60" x="120" y="220"></rect></g></g></g></svg>--%>
            </div>
            <div class="py-2 px-4 w-3/6">
                <p class="number text-right text-black font-bold"><%= seuil.getSeuil() %>></p>
            </div>
        </div>
    </div>
</div>

<%
    }
%>

<script src="/assets/js/tableToPdf.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.21/jspdf.plugin.autotable.min.js"></script>
