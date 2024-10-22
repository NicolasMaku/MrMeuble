<%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 14/10/2024
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="UTF-8" %>

<div class="sidebar bg-slate-600 transition-all duration-500">
    <div>
        <a class="link hover:bg-slate-700 transition duration-300" href="/etatStock/stock/etatStock">
            <div class="flex">
                <div class="icon">
                    <svg class="icones" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#FFFFFF"><path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/></svg>
                </div>
                <div class="miafina">Etat de Stock</div>
            </div>
        </a>
        <a class="link hover:bg-slate-700 transition duration-300" href="/mouvementStock/stock/mouvementStock">
            <div class="flex">
                <div class="icon">
                    <svg class="icones" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#FFFFFF"><path d="M280-120 80-320l200-200 57 56-104 104h607v80H233l104 104-57 56Zm400-320-57-56 104-104H120v-80h607L623-784l57-56 200 200-200 200Z"/></svg>
                </div>
                <div class="miafina">Mouvement Stock</div>
            </div>
        </a>
    </div>
</div>
