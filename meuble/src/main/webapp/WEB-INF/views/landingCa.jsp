<%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 16/10/2024
  Time: 06:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String tableau = "";
    if(request.getAttribute("tableauCa") != null) {
        tableau += (String) request.getAttribute("tableauCa");
    }
%>

<div class="w-[89%] min-h-[80dvh] mx-32 my-10">
    <% if(tableau.equals("")) { %>
        <div class="flex justify-center items-center object-cover"><img class="h-[70dvh]" src="/assets/img/ca.png" alt="sary itako fotsiny"></div>
    <% } else { %>
        <jsp:include page="<%=tableau%>" />
    <% } %>
</div>