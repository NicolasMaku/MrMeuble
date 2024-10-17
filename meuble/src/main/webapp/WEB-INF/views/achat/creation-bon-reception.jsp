<%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="overflow-x-auto bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30 text-black">
    <table class="table">
        <thead>
        <tr>
            <th class="text-black">id</th>
            <th class="text-black text-center">Bon de commande</th>
            <th class="text-black text-center">Date de creation</th>
            <th class="text-black text-center">Transfert</th>
            <th class="text-black text-center">Action</th>
        </tr>
        </thead>
        <tbody class="text-black">
        <tr>
            <th>1</th>
            <td class="text-blue-500 underline text-center"><a href="">FA007</a></td>
            <td class="text-black text-center">17/10/2024</td>
            <td class="text-black text-center">Non transféré</td>
            <th class="flex justify-center gap-2">
                <button class="btn btn-info btn-xs">Transferer</button>
            </th>
        </tr>
        <tr>
            <th>2</th>
            <td class="text-blue-500 underline text-center"><a href="">FA008</a></td>
            <td class="text-black text-center">17/10/2024</td>
            <td class="text-black text-center">Non transféré</td>
            <th class="flex justify-center gap-2">
                <button class="btn btn-info btn-xs">Transferer</button>
            </th>
        </tr>
        </tbody>
    </table>
</div>
