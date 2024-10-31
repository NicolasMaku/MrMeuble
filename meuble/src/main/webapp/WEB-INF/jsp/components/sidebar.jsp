<%@ page import="com.source.meuble.utilisateur.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Utilisateur u = ((Utilisateur) request.getSession().getAttribute("u"));
    if (u == null) {
        response.sendRedirect("/");
    }
//    Sidebar sidebar = SidebarMock.DEFAULT_SIDEBAR;
    String url = ((String) request.getAttribute("jakarta.servlet.forward.request_uri"));
%>

<%=u.getSidebar(url)%>

<%--<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">--%>
<%--    <%=sidebar.getLogo()%>--%>

<%--    <div class="menu-inner-shadow"></div>--%>
<%--    <ul class="menu-inner py-1">--%>

<%--    <%--%>
<%--        for (Menu menu : sidebar.getMenus()) {--%>
<%--            if (menu.canAccess(u)) {--%>
<%--    %>--%>
<%--        <li class="menu-item <%=menu.isActive(url) ? "active open" : ""%>">--%>
<%--            <a href="<%=menu.getLien()%>" class="menu-link  <%=menu.hasSubmenu() ? "menu-toggle" : ""%>">--%>
<%--                <%--%>
<%--                    if (menu.hasIcon()) {--%>
<%--                %>--%>
<%--                    <i class="menu-icon tf-icons <%=menu.getIcon()%>"></i>--%>
<%--                <%--%>
<%--                    }--%>
<%--                %>--%>
<%--                <div data-i18n="<%=menu.getTitle()%>"><%=menu.getTitle()%></div>--%>
<%--            </a>--%>
<%--            <%--%>
<%--                if (menu.hasSubmenu()) {--%>
<%--            %>--%>
<%--                <ul class="menu-sub">--%>
<%--                    <%--%>
<%--                        for (Menu submenu : menu.getSubmenus()) {--%>
<%--                            if (submenu.canAccess(u)) {--%>
<%--                    %>--%>
<%--                        <li class="menu-item <%=submenu.isActive(url) ? "active" : ""%>">--%>
<%--                            <a href="<%=submenu.getLien()%>" class="menu-link">--%>
<%--                                <div data-i18n="<%=submenu.getTitle()%>"><%=submenu.getTitle()%>--%>
<%--                                </div>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    <%--%>
<%--                            }--%>
<%--                        }--%>
<%--                    %>--%>
<%--                </ul>--%>
<%--        <%--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--        %>--%>
<%--        </li>--%>

<%--    </ul>--%>

<%--    <ul class="m-0 p-0">--%>
<%--        <li class="menu-block my-1 d-flex flex-row justify-content-between">--%>
<%--            &lt;%&ndash;            <a title="Logout" data-bs-placement="top" data-bs-toggle="tooltip" href="javascript:%20void(0);"><span aria-hidden="true" class="text-body bx bx-power-off"></span></a>&ndash;%&gt;--%>
<%--        </li>--%>
<%--    </ul>--%>

<%--</aside>--%>

