<%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="">
<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black">Demandeur</th>
            <th class="text-black">Produit</th>
            <th class="text-black">Quantité</th>
            <th class="text-black">Date besoin</th>
            <th class="text-black">Action</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <tr>
            <th>
                <label>
                    <input type="checkbox" class="checkbox" />
                </label>
            </th>
            <td>Nico</td>
            <td>soris</td>
            <td>10</td>
            <td>17/10/2024</td>
            <th>
                <button class="btn btn-success btn-xs">Valider</button>
            </th>
        </tr>
        <tr>
            <th>
                <label>
                    <input type="checkbox" class="checkbox" />
                </label>
            </th>
            <td>Nicolos</td>
            <td>soris</td>
            <td>10</td>
            <td>17/10/2024</td>
            <th>
                <button class="btn btn-success btn-xs">Valider</button>
            </th>
        </tr>
        <tr>
            <th>
                <label>
                    <input type="checkbox" class="checkbox" />
                </label>
            </th>
            <td>Nicolos</td>
            <td>soris</td>
            <td>10</td>
            <td>17/10/2024</td>
            <th>
                <button class="btn btn-success btn-xs">Valider</button>
            </th>
        </tr>
        </tbody>
    </table>
</div>
    <div class="absolute right-0 w-1/3 flex-row my-3">
        <label class="my-2" for="validation-besoin-fournisseur">Fournisseur:</label>
        <br>
        <select name="" id="validation-besoin-fournisseur"
            class="py-3 px-4 block w-2/3 border border-gray-500 rounded-lg text-sm">
            <option value="">TESt</option>
            <option value="">tesT</option>
        </select>
        <button class="btn btn-outline w-2/3 my-3" type="submit">Demander proformat</button>
    </div>
</form>
