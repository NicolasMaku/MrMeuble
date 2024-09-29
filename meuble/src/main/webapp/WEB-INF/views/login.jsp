<%@ page import="com.source.meuble.util.RequestAttribute" %><%
    RequestAttribute attribute = new RequestAttribute(request);
    String error = attribute.getObject("error", String.class);
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
<div class="w-full h-dvh flex justify-center items-center">
    <div class="flex flex-col mx-auto">
        <p class="text-[32px] font-bold text-gray-700 dark:text-white">Se connecter</p>
        <p class="mb-2.5 mt-2.5 font-sans text-gray-700 dark:text-zinc-400">Veuillez vous identifier pour vous
            connecter!</p>
        <%
            if(error != null) {
        %>
        <p class="text-red-600"> <%=error%></p>

        <%
            }
        %>
        <div class="my-4">
            <div class="flex items-center">
                <div class="grow border-t border-zinc-200 dark:border-zinc-700"></div>
                <div class="grow border-t border-zinc-200 dark:border-zinc-700"></div>
            </div>
        </div>
        <div>
            <form action="login" method="POST" class="mb-4">
                <div class="grid gap-2">
                    <div class="grid gap-1">
                        <label class="text-gray-700 dark:text-white" for="email">
                            Identifiant:
                        </label>
                        <input
                                class="mr-2.5 mb-2 h-full min-h-[44px] w-full rounded-lg border border-zinc-300 bg-white px-4 py-3 text-sm font-medium text-gray-700 placeholder:text-zinc-400 focus:outline-slate-600 dark:bg-transparent dark:text-white dark:placeholder:text-zinc-400"
                                id="email" placeholder="Admin" type="text" autocapitalize="none"
                                autocomplete="email" autocorrect="off" name="username">
                        <label class="text-gray-700 mt-2 dark:text-white" for="password">
                            Mot de passe:
                        </label>
                        <input id="password" placeholder="Mot de passe" type="password"
                               autocomplete="current-password"
                               class="mr-2.5 mb-2 h-full min-h-[44px] w-full rounded-lg border border-zinc-300 bg-white px-4 py-3 text-sm font-medium text-gray-700 placeholder:text-zinc-400 focus:outline-slate-600 dark:bg-transparent dark:text-white dark:placeholder:text-zinc-400"
                               name="password">
                    </div>
                    <button
                            class="mt-2 flex h-[unset] text-slate-100 w-full items-center justify-center rounded-lg px-4 py-4 text-sm font-medium bg-slate-500 focus:bg-slate-700 hover:bg-slate-700 transition-all duration-300"
                            type="submit">
                        Se connecter
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
</body>
</html>