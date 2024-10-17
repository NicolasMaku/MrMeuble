<%--
  Created by IntelliJ IDEA.
  User: Miarantsoa
  Date: 17/10/2024
  Time: 04:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String insideContent = "";
    if(request.getAttribute("insideContent") != null) {
        insideContent += (String) request.getAttribute("insideContent");
    }
%>

<div class="w-[89%] min-h-[80dvh] mx-32 my-10">
    <% if(insideContent.equals("")) { %>
    <div class="flex justify-center items-center object-cover"><img class="h-[70dvh]" src="/assets/img/ca.png" alt="sary itako fotsiny"></div>
    <% } else { %>
    <jsp:include page="<%=insideContent%>" />
    <% } %>
</div>