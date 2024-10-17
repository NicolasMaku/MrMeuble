<%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="relative z-1 flex items-center justify-center">
    <div class="w-1/2">
        <form action="" method="POST">
            <div class="p-4 overflow-y-auto">
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
                <button type="submit"
                        class="w-3/6 py-2 px-3 items-center gap-x-2 text-sm font-medium rounded-lg border border-transparent bg-gray-600 text-white hover:bg-gray-700 focus:outline-none focus:bg-gray-700 disabled:opacity-50 disabled:pointer-events-none">
                    Ajouter
                </button>
            </div>
        </form>
    </div>
</div>


<div class="w-full flex justify-center mt-2 bg-gray-400 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-30">
    <div class="overflow-x-auto w-1/3">
        <table class="table">
            <tbody>
            <tr>
                <th>1</th>
                <td>Cahier etudiant</td>
                <td class="font-bold">1*100</td>
                <td class="font-bold">100</td>
            </tr>
            <tr>
                <th>2</th>
                <td>Stylo schneider</td>
                <td class="font-bold">5*20</td>
                <td class="font-bold">100</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<button class="absolute right-10 btn btn-outline my-3">Commander</button>
